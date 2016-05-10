package com.sdut.edu.cn.Hibernate;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Entity;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class AbstractDao<T> implements HibernateGenericDao<T> {
	protected static final Logger LOGGER = Logger.getLogger(AbstractDao.class);

	@Autowired
	private SessionFactory sessionFactory;
	protected Class<T> entityClass;

	@SuppressWarnings("unchecked")
	public AbstractDao() {
		this.entityClass = com.sdut.edu.cn.util.GenericsUtils.getSuperClassGenricType(this.getClass());
	}

	public Session getSession() {
		// 事务必须是开启的(Required)，否则获取不到
		return sessionFactory.getCurrentSession();
	}

	/**
	 * 获取实体的名称(用到了反射技术)
	 * 
	 * @param <E>
	 * @param entityClass
	 *            实体类
	 * @return
	 **/
	protected static <E> String getEntityName(Class<E> entityClass) {
		// 默认实体名称，Simple: 简单的
		String entityName = entityClass.getSimpleName();
		// 反射技术,获得注解对象
		Entity entity = entityClass.getAnnotation(Entity.class);
		if (entity.name() != null && !"".equals(entity.name())) {
			entityName = entity.name();
		}
		return entityName;
	}

	/**
	 * 保存实体
	 * 
	 * @param entity
	 *            实体对象
	 **/

	public void save(T entity) {
		getSession().save(entity);

	}

	/**
	 * 保存或更新实体
	 * 
	 * @param entity
	 *            实体对象
	 **/

	public void saveOrUpdate(T entity) {
		getSession().saveOrUpdate(entity);

	}

	/**
	 * 更新实体
	 * 
	 * @param entity
	 *            实体对象
	 */

	public void update(T entity) {
		getSession().update(entity);
		getSession().flush();
	}

	/**
	 * 合并实体
	 * 
	 * @param entity
	 *            实体对象
	 */

	public void merge(T entity) {
		getSession().merge(entity);
	}

	/**
	 * 删除实体
	 * 
	 * @param 实体标识
	 *            JPA和Hibernate 规定实体的id属性必须实现序列化接口
	 **/

	public void delete(Serializable id) {
		getSession().delete(get(id));
	}

	/**
	 * 批量删除实体
	 * 
	 * @param entityIds
	 *            实体标识数组
	 **/

	public void deleteBatch(Serializable[] ids) {
		int recordCount = 0;
		for (Serializable id : ids) {
			delete(id);
			recordCount++;
			if (recordCount % 50 == 0) {
				getSession().flush();
				getSession().clear();
			}
		}
		;
	}

	/**
	 * 获取实体对象
	 * 
	 * @param id
	 *            序列化ID
	 */
	@SuppressWarnings("unchecked")

	public T get(Serializable id) {
		if (id == null)
			throw new RuntimeException(this.entityClass.getName() + ":传入的实体id不能为空");
		return (T) getSession().get(this.entityClass, id);
	}

	/**
	 * 实体对象是否存在
	 * 
	 * @param id
	 *            序列化ID
	 */

	public boolean exists(Serializable id) {
		return get(id) != null;
	}

	/**
	 * 数据库与缓存同步(更新到数据库中)
	 */

	public void flush() {
		getSession().flush();
	}

	/**
	 * 清除缓存
	 */

	public void clear() {
		getSession().clear();
	}

	/**
	 * 全部记录
	 */

	public List<T> listAll() {
		return pagedQuery(-1, -1);
	}

	/**
	 * 全部记录(条件)
	 * 
	 * @param whereJPql
	 *            条件语句
	 * @param queryParams
	 *            条件参数 (数组)多个
	 * @return
	 **/

	public List<T> list(String whereJPql, Object[] queryParams) {
		return pagedQuery(-1, -1, whereJPql, queryParams);
	}

	/**
	 * 全部记录(排序)
	 * 
	 * @param orderBy
	 *            排序(LinkedHashMap:保持顺序)
	 **/

	public List<T> list(LinkedHashMap<String, String> orderBy) {
		return pagedQuery(-1, -1, orderBy);
	}

	/**
	 * 全部记录(条件, 排序)
	 * 
	 * @param whereJPql
	 *            条件语句
	 * @param queryParams
	 *            条件参数 (数组)多个
	 * @param orderBy
	 *            排序(LinkedHashMap:保持顺序)
	 * @return
	 **/

	public List<T> list(String whereJPql, Object[] queryParams, LinkedHashMap<String, String> orderBy) {
		return pagedQuery(-1, -1, whereJPql, queryParams, orderBy);
	}

	/**
	 * 分页记录
	 * 
	 * @param firstIndex
	 *            开始索引
	 * @param maxResult
	 *            需要获取的记录数(一页显示条数)
	 * @return
	 **/

	public List<T> pagedQuery(int firstIndex, int maxResult) {
		return pagedQuery(firstIndex, maxResult, null, null, null);
	}

	/**
	 * 分页记录(条件)
	 * 
	 * @param firstIndex
	 *            开始索引
	 * @param maxResult
	 *            需要获取的记录数(一页显示条数)
	 * @param whereJPql
	 *            条件语句
	 * @param queryParams
	 *            条件参数 (数组)多个
	 * @return
	 **/

	public List<T> pagedQuery(int firstIndex, int maxResult, String whereJPql, Object[] queryParams) {
		return pagedQuery(firstIndex, maxResult, whereJPql, queryParams, null);
	}

	/**
	 * 分页记录(排序)
	 * 
	 * @param firstIndex
	 *            开始索引
	 * @param maxResult
	 *            需要获取的记录数(一页显示条数)
	 * @param orderBy
	 *            排序(LinkedHashMap:保持顺序)
	 * @return
	 **/

	public List<T> pagedQuery(int firstIndex, int maxResult, LinkedHashMap<String, String> orderBy) {
		return pagedQuery(firstIndex, maxResult, null, null, orderBy);
	}

	/**
	 * 分页记录(条件, 排序)
	 * 
	 * @param firstIndex
	 *            开始索引
	 * @param maxResult
	 *            需要获取的记录数(一页显示条数)
	 * @param whereJPql
	 *            条件语句
	 * @param queryParams
	 *            条件参数 (数组)多个
	 * @param orderBy
	 *            排序(LinkedHashMap:保持顺序)
	 * @return
	 **/
	@SuppressWarnings("unchecked")

	public List<T> pagedQuery(int firstIndex, int maxResult, String whereJPql, Object[] queryParams,
			LinkedHashMap<String, String> orderBy) {
		// 实体类名称
		String entityName = getEntityName(entityClass);
		Query query = getSession().createQuery("select entity from " + entityName + " entity "
				+ (whereJPql == null || "".equals(whereJPql.trim()) ? "" : "where " + whereJPql)
				+ buildOrderby(orderBy));
		setQueryParams(query, queryParams);
		if (firstIndex != -1 && maxResult != -1)
			query.setFirstResult(firstIndex).setMaxResults(maxResult);
		return query.list();
	}

	/**
	 * 记录总条数(条件)
	 * 
	 * @param whereJPql
	 *            条件语句
	 * @param queryParams
	 *            条件参数 (数组)多个
	 * @return
	 **/

	public int getRecordTotal(String whereJPql, Object[] queryParams) {
		// 实体类名称
		String entityName = getEntityName(entityClass);
		Query query = getSession().createQuery("select count(entity) from " + entityName + " entity "
				+ (whereJPql == null || "".equals(whereJPql.trim()) ? "" : "where " + whereJPql));
		setQueryParams(query, queryParams);
		Long total = (Long) query.uniqueResult();
		return total.intValue();
	}

	/**
	 * 记录总条数
	 * 
	 * @return
	 **/

	public int getRecordTotal() {
		return getRecordTotal(null, null);
	}

	/**
	 * 批量修改对象某一个属性的值
	 * 
	 * @param ids
	 *            被操作对象ID数组
	 * @param propertyName
	 *            被操作对象属性名
	 * @param propertyName
	 *            被操作对象属性值
	 **/

	public void updatePropertyValue(String[] ids, String propertyName, Object propertyValue) {
		// 实体类名称
		String entityName = getEntityName(entityClass);
		StringBuffer sb = new StringBuffer();
		sb.append("update ").append(entityName).append(" as entity set entity.").append(propertyName).append("=:")
				.append(propertyName).append(" where entity.id=:id");
		Query query = getSession().createQuery(sb.toString());
		query.setParameter(propertyName, propertyValue);
		LOGGER.info("修改对象[" + entityName + "]的[" + propertyName + "]属性值为[" + propertyValue + "]SQL:" + sb.toString());
		int recordCount = 0;
		for (String id : ids) {
			query.setLong("id", Long.valueOf(id));
			query.executeUpdate();
			recordCount++;
			if (recordCount % 50 == 0) {
				getSession().flush();
				getSession().clear();
			}
		}
	}

	/**
	 * 执行SQL语句(用于插入,更新,删除记录)
	 * 
	 * @param sql
	 *            sql语句
	 */

	public void executeSql(String sql) {
		Query query = getSession().createSQLQuery(sql);
		query.executeUpdate();
	}

	/**
	 * 执行SQL语句返回对象数组(用于查询记录)
	 * 
	 * @param sql
	 *            sql语句
	 */

	public Object[] executeSqlBackObjArray(String sql) {
		Query query = getSession().createSQLQuery(sql);
		return (Object[]) query.uniqueResult();
	}

	/**
	 * 执行SQL语句返回集合对象数组(用于查询记录)
	 * 
	 * @param sql
	 *            sql语句
	 */
	@SuppressWarnings("unchecked")

	public List<Object[]> executeSqlBackObjArrayList(String sql) {
		Query query = getSession().createSQLQuery(sql);
		return query.list();
	}

	/**
	 * 组装order by 语句
	 * 
	 * @param orderby
	 * @param LinkedHashMap<属性名,
	 *            排序值>
	 * @return LinkedHashMap中的各项是按照自己规定顺序使用 orderBy.isEmpty():集合里面的元素不为空
	 **/
	protected static String buildOrderby(LinkedHashMap<String, String> orderBy) {
		StringBuffer orderByql = new StringBuffer("");
		if (orderBy != null && !orderBy.isEmpty()) {
			orderByql.append(" order by ");
			// order by o.key desc,o.key2 asc
			for (Map.Entry<String, String> entry : orderBy.entrySet()) {// 遍历Map
				orderByql.append("entity.").append(entry.getKey()).append(" ").append(entry.getValue()).append(",");
			}
			// 去掉最后一个 ","
			orderByql.deleteCharAt(orderByql.length() - 1);
		}
		return orderByql.toString();
	}

	/**
	 * 设置查询语句的参数的方法
	 **/
	protected static void setQueryParams(Query query, Object[] queryParams) {
		if (queryParams != null && queryParams.length > 0) {
			for (int i = 0; i < queryParams.length; i++) {
				query.setParameter(i, queryParams[i]);
			}
		}
	}

}
