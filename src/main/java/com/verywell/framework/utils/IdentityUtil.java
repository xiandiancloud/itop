/**
 * Copyright (c) 2005-2012 springside.org.cn
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.verywell.framework.utils;

import java.security.SecureRandom;
import java.util.UUID;

/**
 * 封装各种生成唯一性ID算法的工具类.
 * 
 * @author Yao
 */
public class IdentityUtil
{

	private static SecureRandom random = new SecureRandom();

	private IdentityUtil()
	{
	}

	/**
	 * 封装JDK自带的UUID, 通过Random数字生成,中间有-分割
	 */
	public static String uuid()
	{
		return UUID.randomUUID().toString();
	}

	/**
	 * 封装JDK自带的UUID, 通过Random数字生成,中间无-分割
	 */
	public static String uuid2()
	{
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	/**
	 * 使用SecureRandom随机生成Long.
	 */
	public static long randomLong()
	{
		return random.nextLong();
	}

	/**
	 * 基于Base62编码的SecureRandom随机生成Long.
	 */
	public static String randomBase62()
	{
		return EncodeUtil.encodeBase62(random.nextLong());
	}
}
