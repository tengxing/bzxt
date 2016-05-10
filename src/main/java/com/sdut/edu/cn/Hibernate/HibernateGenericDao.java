package com.sdut.edu.cn.Hibernate;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;
/**
 * 实体操作通用接口
 * T 代表实体类型继承序列化 可以用别的字母代替
 * 用泛型来明确要操作的实体类型
 * **/
public interface HibernateGenericDao<T> {
    /**
     * 保存实体
     * @param entity 实体对象
     * **/
    public void save(T entity);
    /**
     * 保存或更新实体
     * @param entity 实体对象
     * **/
    public void saveOrUpdate(T entity);
    /**
     * 更新实体
     * @param entity 实体对象
     * */
    public void update(T entity);
    /**
     * 合并实体
     * @param entity 实体对象
     * */
    public void merge(T entity);
    /**
     * 删除实体
     * @param 实体标识
     * JPA和Hibernate 规定实体的id属性必须实现序列化接口
     * **/
    public void delete(Serializable id);
    /**
     * 批量删除实体
     * @param entityIds 实体标识数组
     * **/
    public void deleteBatch(Serializable[] ids);
    /**
     * 获取实体对象
     * @param id 序列化ID
     * */
    public T get(Serializable id);
    /**
     * 实体对象是否存在
     * @param id 序列化ID
     * */
    boolean exists(Serializable id);
    /**
     * 数据库与缓存同步(更新到数据库中)
     * */
    public void flush();
    /**
     * 清除缓存
     * */
    public void clear();
    /**
     * 全部记录
     * */
    public List<T> listAll();
    /**
     * 获取分页数据封装
     * @param firstIndex 开始索引 
     * @param maxResult 需要获取的记录数(一页显示条数)
     * @param whereJPql 条件语句
     * @param queryParams 条件参数 (数组)多个
     * @param orderBy 排序(LinkedHashMap:保持顺序)
     * @return
     * **/
    /**
     * 全部记录(条件)
     * @param whereJPql 条件语句
     * @param queryParams 条件参数 (数组)多个
     * @return
     * **/
    public List<T> list(String whereJPql, Object[] queryParams);
    /**
     * 全部记录(排序)
     * @param orderBy 排序(LinkedHashMap:保持顺序)
     * **/
    public List<T> list(LinkedHashMap<String, String> orderBy);
    /**
     * 全部记录(条件, 排序)
     * @param whereJPql 条件语句
     * @param queryParams 条件参数 (数组)多个
     * @param orderBy 排序(LinkedHashMap:保持顺序)
     * @return
     * **/
    public List<T> list(String whereJPql, Object[] queryParams, LinkedHashMap<String, String> orderBy);   
    /**
     * 分页记录
     * @param firstIndex 开始索引 
     * @param maxResult 需要获取的记录数(一页显示条数)
     * @return
     * **/
    public List<T> pagedQuery(int firstIndex,int maxResult);
    /**
     * 分页记录(条件)
     * @param firstIndex 开始索引 
     * @param maxResult 需要获取的记录数(一页显示条数)
     * @param whereJPql 条件语句
     * @param queryParams 条件参数 (数组)多个
     * @return
     * **/
    public List<T> pagedQuery(int firstIndex, int maxResult, String whereJPql, Object[] queryParams);
    /**
     * 分页记录(排序)
     * @param firstIndex 开始索引 
     * @param maxResult 需要获取的记录数(一页显示条数)
     * @param orderBy 排序(LinkedHashMap:保持顺序)
     * @return
     * **/
    public List<T> pagedQuery(int firstIndex, int maxResult, LinkedHashMap<String, String> orderBy);
    /**
     * 分页记录(条件, 排序)
     * @param firstIndex 开始索引 
     * @param maxResult 需要获取的记录数(一页显示条数)
     * @param whereJPql 条件语句
     * @param queryParams 条件参数 (数组)多个
     * @param orderBy 排序(LinkedHashMap:保持顺序)
     * @return
     * **/
    public List<T> pagedQuery(int firstIndex, int maxResult, String whereJPql, Object[] queryParams, LinkedHashMap<String, String> orderBy);
    /**
     * 记录总条数(条件) 
     * @param whereJPql 条件语句
     * @param queryParams 条件参数 (数组)多个
     * @return
     * **/  
    public int getRecordTotal(String whereJPql, Object[] queryParams);
    /**
     * 记录总条数
     * @return
     * **/  
    public int getRecordTotal();
    /**
     * 批量修改对象某一个属性的值
     * @param ids 被操作对象ID数组
     * @param propertyName 被操作对象属性名
     * @param propertyName 被操作对象属性值
     * **/
    public void updatePropertyValue(String[] ids, String propertyName, Object propertyValue);
    /**
     * 执行SQL语句(用于插入,更新,删除记录)
     * @param sql sql语句
     */
    public void executeSql(String sql);
    /**
     * 执行SQL语句返回对象数组(用于查询记录)
     * @param sql sql语句
     */
    public Object[] executeSqlBackObjArray(String sql);
    /**
     * 执行SQL语句返回集合对象数组(用于查询记录)
     * @param sql sql语句
     */
    public List<Object[]> executeSqlBackObjArrayList(String sql);
}