package com.sdut.edu.cn.util;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import org.apache.log4j.Logger;

/**
 * Generics��util��.
 */
public class GenericsUtils {
	/**
	 * ��־.
	 */
	private static final Logger LOGGER = Logger.getLogger(GenericsUtils.class);

	/**
	 * ���췽��.
	 */
	protected GenericsUtils() {
	}

	/**
	 * ͨ������,��ö���Classʱ�����ĸ���ķ��Ͳ���������. ��public BookManager extends
	 * GenricManager&lt;Book&gt;
	 *
	 * @param clazz
	 *            The class to introspect
	 * @return the first generic declaration, or <code>Object.class</code> if
	 *         cannot be determined
	 */
	@SuppressWarnings("unchecked")
	public static Class getSuperClassGenricType(Class clazz) {
		return getSuperClassGenricType(clazz, 0);
	}

	/**
	 * ͨ������,��ö���Classʱ�����ĸ���ķ��Ͳ���������. ��public BookManager extends
	 * GenricManager&lt;Book&gt;
	 *
	 * @param clazz
	 *            clazz The class to introspect
	 * @param index
	 *            the Index of the generic ddeclaration,start from 0.
	 * @return the index generic declaration, or <code>Object.class</code> if
	 *         cannot be determined
	 */
	@SuppressWarnings("unchecked")
	public static Class getSuperClassGenricType(Class clazz, int index) {
		Type genType = clazz.getGenericSuperclass();

		if (!(genType instanceof ParameterizedType)) {
			LOGGER.warn(clazz.getSimpleName() + "'s superclass not ParameterizedType");

			return Object.class;
		}

		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();

		if ((index >= params.length) || (index < 0)) {
			LOGGER.warn("Index: " + index + ", Size of " + clazz.getSimpleName() + "'s Parameterized Type: "
					+ params.length);

			return Object.class;
		}

		if (!(params[index] instanceof Class)) {
			LOGGER.warn(clazz.getSimpleName() + " not set the actual class on superclass generic parameter");

			return Object.class;
		}

		return (Class) params[index];
	}
}
