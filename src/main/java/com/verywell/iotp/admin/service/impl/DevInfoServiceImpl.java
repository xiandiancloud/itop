package com.verywell.iotp.admin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.verywell.framework.dao.BaseHibernateDAO;
import com.verywell.framework.service.BaseCrudServiceImpl;
import com.verywell.framework.utils.HttpUtil;
import com.verywell.iotp.admin.constants.CommonConstants;
import com.verywell.iotp.admin.constants.ResultConstants;
import com.verywell.iotp.admin.dao.DevAttrInfoDAO;
import com.verywell.iotp.admin.entity.dev.DevAttrInfo;
import com.verywell.iotp.admin.entity.dev.DevAttributes;
import com.verywell.iotp.admin.entity.dev.DevClassGroupInfo;
import com.verywell.iotp.admin.entity.dev.DevInfo;
import com.verywell.iotp.admin.service.DevAttributesService;
import com.verywell.iotp.admin.service.DevInfoService;

/**
 * 设备相关服务实现类
 * 
 * @author yao
 * 
 */
@Service
@Transactional(readOnly = true)
public class DevInfoServiceImpl extends BaseCrudServiceImpl<DevInfo, Long> implements DevInfoService
{
	protected Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private DevAttributesService devAttributesService;

	@Autowired
	private DevAttrInfoDAO devAttrInfoDAO;

	@Autowired
	@Override
	@Qualifier(value = "devInfoDAO")
	public void setBaseDao(BaseHibernateDAO<DevInfo, Long> baseDao)
	{
		this.baseDao = baseDao;
	}

	@Override
	public long getAlarmDevCountByRoomId(Long roomId) throws Exception
	{
		String hql = "select count(*) from DevInfo dev where dev.roomId=? and dev.alarmStatus=" + DevInfo.ALARM_STATUS_ABNORMAL;
		return baseDao.findLong(hql, roomId);
	}

	@Override
	public List<DevInfo> findByRoomId(Long roomId) throws Exception
	{
		String hql = "from DevInfo dev where dev.roomId=? and dev.devStatus!=" + DevInfo.DEV_STATUS_DELETE;
		List<DevInfo> list = baseDao.findByHql(hql, roomId);
		return list;
	}

	@Override
	public DevInfo findById(Long id) throws Exception
	{
		DevInfo devInfo = baseDao.findById(id);
		return devInfo;
	}

	@Override
	public List<DevInfo> findByClassGroupId(Long roomId, Long classGroupId) throws Exception
	{
		List<DevInfo> resultList = new ArrayList<DevInfo>();
		String hql = "from DevInfo dev where dev.devClassInfo.devClassGroupInfo.groupId=? and dev.roomId=? and dev.devStatus!=" + DevInfo.DEV_STATUS_DELETE
				+ " order by dev.devName";
		return baseDao.findByHql(hql, classGroupId, roomId);
	}

	@Transactional(readOnly = false)
	@Override
	public int updatePosition(Long devId, Integer posX, Integer posY) throws Exception
	{
		DevInfo devInfo = baseDao.findById(devId);
		if (devInfo != null)
		{
			devInfo.setPositionX(posX);
			devInfo.setPositionY(posY);
			baseDao.update(devInfo);
			return ResultConstants.UPDATE_SUCCEED;
		}
		else
		{
			return ResultConstants.UPDATE_FAILED;
		}
	}

	@Transactional(readOnly = false)
	@Override
	public int delete(Long devId) throws Exception
	{
		DevInfo devInfo = baseDao.findById(devId);
		if (devInfo != null)
		{
			devInfo.setDevStatus(DevInfo.DEV_STATUS_DELETE);
			baseDao.update(devInfo);
			return ResultConstants.DELETE_SUCCEED;
		}
		else
		{
			return ResultConstants.DELETE_ERR0R;
		}
	}

	/**
	 * 根据设备类型分组获得相应的控制服务地址
	 * 
	 * @param devClassGroupId
	 * @return
	 * @throws Exception
	 */
	private String getServiceUrl(Long devClassGroupId) throws Exception
	{
		if (devClassGroupId.equals(DevClassGroupInfo.CLASS_GROUP_LIGHT))
			return CommonConstants.LIGHT_SERVICE;
		else if (devClassGroupId.equals(DevClassGroupInfo.CLASS_GROUP_AIR))
			return CommonConstants.AIR_CONDITIONER_SERVICE;
		else if (devClassGroupId.equals(DevClassGroupInfo.CLASS_GROUP_SENSOR))
			return CommonConstants.SENSOR_SERVICE;
		else if (devClassGroupId.equals(DevClassGroupInfo.CLASS_GROUP_CURTAIN))
			return CommonConstants.CURTAIN_SERVICE;
		else if (devClassGroupId.equals(DevClassGroupInfo.CLASS_GROUP_MUTIMEDIA))
			return CommonConstants.MUTIMEDIA_SERVICE;
		return null;

	}

	@Override
	public String controllDev(String devIds, String cmd, String value) throws Exception
	{
		String resultCode = "0";
		Long devId = null;
		if (devIds.indexOf(",") >= 0)
		{
			devId = Long.valueOf(devIds.split(",")[0]);
		}
		else
			devId = Long.valueOf(devIds);
		DevInfo devInfo = baseDao.findById(devId);

		String serviceUrl = getServiceUrl(devInfo.getDevClassInfo().getDevClassGroupInfo().getGroupId());

		if (serviceUrl != null)
		{
			Map<String, String> params = new HashMap<String, String>();
			params.put("deviceId", String.valueOf(devIds));
			params.put("cmd", cmd);
			if (value.indexOf(",") >= 0)
			{
				params.put("value", value.split(",")[0]);
				params.put("index", value.split(",")[1]);
			}
			else
			{
				params.put("value", value);
				params.put("index", "0");
			}
			resultCode = HttpUtil.URLGet(serviceUrl, params);
		}
		devInfo.setDevStatus(new Integer(value));
		baseDao.update(devInfo);//Update Data 
		devInfo = baseDao.findById(devId);
		return resultCode;
	}

	@Override
	public String setScene(Long sceneId) throws Exception
	{
		String resultCode = "0";
		String serviceUrl = CommonConstants.SCENE_SERVICE;
		if (serviceUrl != null)
		{
			Map<String, String> params = new HashMap<String, String>();
			params.put("sceneId", String.valueOf(sceneId));
			resultCode = HttpUtil.URLGet(serviceUrl, params);
		}
		return resultCode;
	}

	@Override
	public List<DevInfo> findByClassGroupId(Long classGroupId) throws Exception
	{
		List<DevInfo> resultList = new ArrayList<DevInfo>();
		String hql = "from DevInfo dev where dev.devClassInfo.devClassGroupInfo.groupId=? and dev.devStatus!=" + DevInfo.DEV_STATUS_DELETE
				+ " order by dev.devName";
		return baseDao.findByHql(hql, classGroupId);
	}

	@Override
	public List<DevInfo> findByRoomIdAndExceptClassGroupId(Long roomId, Long... classGroupId) throws Exception
	{

		String hql = "from DevInfo dev where dev.roomId=? and dev.devClassInfo.devClassGroupInfo.groupId not in(" + StringUtils.join(classGroupId, ",")
				+ ") and dev.devStatus!=" + DevInfo.DEV_STATUS_DELETE;
		List<DevInfo> list = baseDao.findByHql(hql, roomId);
		return list;
	}

	@Override
	@Transactional(readOnly = false)
	public int save(DevInfo entity) throws Exception
	{
		baseDao.save(entity);
		Long devClassId = entity.getDevClassInfo().getDevClassId();
		List<DevAttributes> attrList = devAttributesService.findByDevClassId(devClassId);
		if (attrList != null && attrList.size() > 0)
		{
			for (DevAttributes devAttributes : attrList)
			{
				DevAttrInfo devAttrInfo = new DevAttrInfo();
				devAttrInfo.setDevInfo(entity);
				devAttrInfo.setAttrKey(devAttributes.getAttrKey());
				devAttrInfo.setAttrValue("");
				devAttrInfoDAO.save(devAttrInfo);
			}
		}
		return ResultConstants.SAVE_SUCCEED;
	}

	@Override
	@Transactional(readOnly = false)
	public int update(DevInfo entity) throws Exception
	{
		baseDao.update(entity);
		baseDao.executeHQL("delete from DevAttrInfo d where d.devInfo.devId=?", entity.getDevId());
		Long devClassId = entity.getDevClassInfo().getDevClassId();
		List<DevAttributes> attrList = devAttributesService.findByDevClassId(devClassId);
		if (attrList != null && attrList.size() > 0)
		{
			for (DevAttributes devAttributes : attrList)
			{
				DevAttrInfo devAttrInfo = new DevAttrInfo();
				devAttrInfo.setDevInfo(entity);
				devAttrInfo.setAttrKey(devAttributes.getAttrKey());
				devAttrInfo.setAttrValue("");
				devAttrInfoDAO.save(devAttrInfo);
			}
		}
		return ResultConstants.UPDATE_SUCCEED;
	}
}
