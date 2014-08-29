package com.verywell.iotp.admin.service;

import java.util.List;

import com.verywell.framework.service.BaseCrudService;
import com.verywell.iotp.admin.entity.sys.SysCorp;

public interface SysCorpService extends BaseCrudService<SysCorp, Long>
{

	/**
	 * 按照单位类型获取单位信息
	 * 
	 * @param corpType
	 *            　属性值
	 * @return　单位信息集合
	 * @throws Exception
	 */
	List<SysCorp> findByCorpType(final Long corpType) throws Exception;

	/**
	 * 根据父单位ID查询下级单位
	 * 
	 * @param parentId
	 *            　父单位ID
	 * @return　返回下级单位
	 * @throws Exception
	 */
	List<SysCorp> findByParentId(Long parentId) throws Exception;

	/**
	 * 根据父单位id和单位类型查询合作商单位
	 * 
	 * @param parentId
	 *            父单位id
	 * @param corpType
	 *            单位类型
	 * @return 合作商单位集合
	 * @throws Exception
	 */
	List<SysCorp> findByParentIdAndCorpType(Long parentId, Long corpType) throws Exception;

}
