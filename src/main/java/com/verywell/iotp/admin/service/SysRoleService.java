package com.verywell.iotp.admin.service;

import java.util.List;

import com.verywell.framework.service.BaseCrudService;
import com.verywell.iotp.admin.entity.sys.SysRole;

/**
 * @title: FSysRoleBO.java
 * @description: 角色信息业务操作接口
 * 
 * @author: dongyuese
 * 
 */
public interface SysRoleService extends BaseCrudService<SysRole, Long>
{

	/**
	 * 根据单位ID查询角色信息
	 * 
	 * @param corpId
	 *            　单位ID
	 * @param status
	 *            　角色有效标志位
	 * @return　角色信息集合
	 * @throws Exception
	 */
	List<SysRole> findByCorpId(Long corpId) throws Exception;
	
}
