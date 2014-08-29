package com.verywell.iotp.admin.constants;

import java.text.MessageFormat;
import java.util.Properties;

import com.verywell.framework.module.config.Config;
import com.verywell.framework.module.config.PropertiesConfigLoader;
import com.verywell.framework.module.config.PropertiesLoaded;

/**
 * @title:系统错误编号定义
 * @description:
 * 
 * @author: Yao
 * 
 */
@Config
@PropertiesConfigLoader(file = "config/result_config.properties", refreshTime = 60 * 60)
public class ResultConstants
{
	/** 登录成功 */
	public static final int LOGIN_SUCCESS = 9000;

	/** 登录失败,密码不正确! */
	public static final int LOGIN_INFO_FAILED = 9001;

	/** 登录失败,验证码不正确! */
	public static final int IMG_CODE_FAILED = 9002;

	/** 登录失败,系统错误! */
	public static final int LOGIN_ERROR = 9009;

	/** 查询成功 */
	public static final int QUERY_SUCCEED = 1000;

	/** 查询失败 */
	public static final int QUERY_FAILED = 1001;

	/** 查询异常 */
	public static final int QUERY_ERROR = 1002;

	/** 创建成功 */
	public static final int ADD_SUCCEED = 2000;

	/** 创建失败 */
	public static final int ADD_FAILED = 2001;

	/** 创建异常 */
	public static final int ADD_ERROR = 2002;

	/** 插入成功 */
	public static final int SAVE_SUCCEED = 3000;

	/** 插入失败 */
	public static final int SAVE_FAILED = 3001;

	/** 插入异常 */
	public static final int SAVE_ERROR = 3002;

	/** 插入异常-名称重复 */
	public static final int SAVE_FAILED_NAME_IS_EXIST = 3003;

	/** 编辑成功 */
	public static final int EDIT_SUCCEED = 4000;

	/** 编辑失败 */
	public static final int EDIT_FAILED = 4001;

	/** 编辑异常 */
	public static final int EDIT_ERROR = 4002;

	/** 更新成功 */
	public static final int UPDATE_SUCCEED = 5000;

	/** 更新失败 */
	public static final int UPDATE_FAILED = 5001;

	/** 更新异常 */
	public static final int UPDATE_ERROR = 5002;

	/** 更新失败-名称重复 */
	public static final int UPDATE_FAILED_NAME_IS_EXIST = 5003;

	/** 删除成功 */
	public static final int DELETE_SUCCEED = 6000;

	/** 删除失败 */
	public static final int DELETE_FAILED = 6001;

	/** 删除异常 */
	public static final int DELETE_ERR0R = 6002;

	/** 删除异常 */
	public static final int DELETE_FAILED_IS_REF = 6003;

	/** 查看成功 */
	public static final int VIEW_SUCCESS = 7000;

	/** 查看失败 */
	public static final int VIEW_FAILED = 7001;

	/** 查看异常 */
	public static final int VIEW_ERR0R = 7002;

	/** 审核成功 */
	public static final int AUDIT_SUCCEED = 8000;

	/** 审核失败 */
	public static final int AUDIT_FAILED = 8001;

	/** 审核异常 */
	public static final int AUDIT_ERROR = 8002;

	/*** 用户设备保存失败 */
	public static final int USER_DEV_SAVE_FAILED = 9901;

	/*** 用户设备更新失败 */
	public static final int USER_DEV_UPDATE_FAILED = 9902;

	private static Properties resultProperties;

	/**
	 * 根据结果编号获得提示信息
	 * 
	 * @param resultCode
	 * @return
	 */
	public static String getResultInfo(int resultCode)
	{
		return resultProperties.getProperty(String.valueOf(resultCode));
	}

	/**
	 * 根据结果编号获得提示信息,并将提示信息进行参数替换
	 * 
	 * @param resultCode
	 * @return
	 */
	public static String getResultInfo(int resultCode, String... params)
	{
		return MessageFormat.format(resultProperties.getProperty(String.valueOf(resultCode)), params);
	}

	@PropertiesLoaded
	public static void setResultProperties(Properties resultProperties)
	{
		ResultConstants.resultProperties = resultProperties;
	}
}
