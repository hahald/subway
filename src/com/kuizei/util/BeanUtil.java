package com.kuizei.util;

import org.apache.commons.beanutils.PropertyUtils;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class BeanUtil {

	/**
	 * 获取值为空的字段
	 * @author BC
	 * @param source
	 * @return
	 * @throws Exception
	 */
	public static String[] getNullPropertyNames (Object source) throws Exception {    
		 PropertyDescriptor[] pds = PropertyUtils.getPropertyDescriptors(source.getClass());

		 Set<String> emptyNames = new HashSet<String>();
		 for(PropertyDescriptor pd : pds) {
			 Method m = pd.getReadMethod();
			 Object srcValue = m.invoke(source);
			 if (srcValue == null) {
				 emptyNames.add(pd.getName());
			 };
		 }
		 String[] result = new String[emptyNames.size()];
		 return emptyNames.toArray(result);
	}
	
	/**
	 * 获取值不为空的字段
	 * @author zl
	 * @param source
	 * @return
	 * @throws Exception
	 */
	public static String[] getNotNullPropertyNames (Object source) throws Exception {    
		 PropertyDescriptor[] pds = PropertyUtils.getPropertyDescriptors(source.getClass());

		 Set<String> emptyNames = new HashSet<String>();
		 for(PropertyDescriptor pd : pds) {
			 Method m = pd.getReadMethod();
			 Object srcValue = m.invoke(source);
			 if (srcValue != null && !"".equals(srcValue)) {
				 emptyNames.add(pd.getName());
			 };
		 }
		 String[] result = new String[emptyNames.size()];
		 return emptyNames.toArray(result);
	}

	/**
	 * 将Bean转换为map
	 * @author zhaotao
	 * @param source
	 * @return
	 * @throws InvocationTargetException
	 * @throws IllegalAccessException
	 */
	public static Map<String, Object> turnBeanToMap(Object source) throws InvocationTargetException, IllegalAccessException {
		Map<String, Object> map = new HashMap<>();
		PropertyDescriptor[] pds = PropertyUtils.getPropertyDescriptors(source.getClass());

		Set<String> emptyNames = new HashSet<String>();
		for(PropertyDescriptor pd : pds) {
			Method m = pd.getReadMethod();
			Object srcValue = m.invoke(source);
			map.put(pd.getName(), srcValue);
		}
		return map;
	}
}
