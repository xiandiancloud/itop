package com.verywell.framework.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.verywell.framework.utils.socket.PocDevService;

/**
 * HTTP工具类
 * 
 * @author Yao
 * 
 */
public class HttpUtil
{

	private static Log log = LogFactory.getLog(HttpUtil.class);

	/**
	 * 定义编码格式 UTF-8
	 */
	public static final String URL_PARAM_DECODECHARSET_UTF8 = "UTF-8";

	/**
	 * 定义编码格式 GBK
	 */
	public static final String URL_PARAM_DECODECHARSET_GBK = "GBK";

	private static final String URL_PARAM_CONNECT_FLAG = "&";

	private static final String EMPTY = "";

	private static MultiThreadedHttpConnectionManager connectionManager = null;

	private static int connectionTimeOut = 25000;

	private static int socketTimeOut = 25000;

	private static int maxConnectionPerHost = 20;

	private static int maxTotalConnections = 20;

	private static HttpClient client;

	static
	{
		connectionManager = new MultiThreadedHttpConnectionManager();
		connectionManager.getParams().setConnectionTimeout(connectionTimeOut);
		connectionManager.getParams().setSoTimeout(socketTimeOut);
		connectionManager.getParams().setDefaultMaxConnectionsPerHost(maxConnectionPerHost);
		connectionManager.getParams().setMaxTotalConnections(maxTotalConnections);
		client = new HttpClient(connectionManager);
	}

	/**
	 * POST方式提交数据
	 * 
	 * @param url
	 *            待请求的URL
	 * @param params
	 *            要提交的数据
	 * @return 响应结果
	 * @throws IOException
	 *             IO异常
	 */
	public static String URLPost(String url, Map<String, String> params)
	{
		return URLPost(url, params, "UTF-8");
	}

	/**
	 * GET方式提交数据
	 * 
	 * @param url
	 *            待请求的URL
	 * @param params
	 *            要提交的数据
	 * @return 响应结果
	 * @throws IOException
	 *             IO异常
	 */
	public static String URLGet(String url, Map<String, String> params)
	{
		return URLGet(url, params, "UTF-8");
	}

	/**
	 * POST方式提交数据
	 * 
	 * @param url
	 *            待请求的URL
	 * @param params
	 *            要提交的数据
	 * @param enc
	 *            编码
	 * @return 响应结果
	 * @throws IOException
	 *             IO异常
	 */
	public static String URLPost(String url, Map<String, String> params, String enc)
	{

		String response = EMPTY;
		PostMethod postMethod = null;
		try
		{
			postMethod = new PostMethod(url);
			postMethod.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=" + enc);
			// 将表单的值放入postMethod中
			Set<String> keySet = params.keySet();
			for (String key : keySet)
			{
				String value = params.get(key);
				postMethod.addParameter(key, value);
			}
			// 执行postMethod
			int statusCode = client.executeMethod(postMethod);
			if (statusCode == HttpStatus.SC_OK)
			{
				response = postMethod.getResponseBodyAsString();
			}
			else
			{
				log.error("响应状态码 = " + postMethod.getStatusCode());
			}
		}
		catch (HttpException e)
		{
			log.error("发生致命的异常，可能是协议不对或者返回的内容有问题", e);
			e.printStackTrace();
		}
		catch (IOException e)
		{
			log.error("发生网络异常", e);
			e.printStackTrace();
		}
		finally
		{
			if (postMethod != null)
			{
				postMethod.releaseConnection();
				postMethod = null;
			}
		}

		return response;
	}

	/**
	 * 
	 * @param url
	 * @param params
	 * @param enc
	 * @return
	 */
	private static String pocLight(String url, Map<String, String> params, String enc)
	{
		if ("switch".equals(params.get("cmd")))
		{
			String deviceId = params.get("deviceId");
			String s = params.get("value");
			int value = Integer.valueOf(s).intValue();
			if (deviceId != null)
			{
				if (deviceId.equals("1060"))//0
				{
					PocDevService.lightCtrlOne("0x01", 0x01, value);
					return "1";
				}
				else if (deviceId.equals("1063"))//1
				{
					PocDevService.lightCtrlOne("0x01", 0x02, value);
					return "1";
				}
				else if (deviceId.equals("1040"))//2
				{
					PocDevService.lightCtrlOne("0x01", 0x03, value);
					return "1";
				}
				else if (deviceId.equals("1064"))//3
				{
					 PocDevService.lightCtrlOne("0x01", 0x04, value);
					 return "1";
				}
				else if (deviceId.equals("1021"))// kongtiao0
				{
					 PocDevService.airConCtrlOne("0x01", 0x04, value == 1 ? 0 : 1);
					 return "1";
				}
				else if (deviceId.equals("1020"))// kongtiao0
				{
					 PocDevService.airConCtrlOne("0x01", 0x04, value == 1 ? 0 : 1);
					 return "1";
				}
				else // 1060,1063,1040,1064}
				{
					String[]  args =  deviceId.split(",");		
					boolean alllight = false;
					for (int i = 0; i < args.length; i++)
					{
						String devid = args[i];
						
						if (devid.equals("1060"))//0
						{
							PocDevService.lightCtrlOne("0x01", 0x01, value);
							alllight = true;
						}
						else if (devid.equals("1063"))//1
						{
							PocDevService.lightCtrlOne("0x01", 0x02, value);
							alllight = true;
						}
						else if (devid.equals("1040"))//2
						{
							PocDevService.lightCtrlOne("0x01", 0x02, value);
							alllight = true;
						}
						else if (devid.equals("1064"))//3
						{
							 PocDevService.lightCtrlOne("0x01", 0x04, value);
							 alllight = true;
						}				
						else if (deviceId.equals("1021"))// kongtiao0
						{
							 PocDevService.airConCtrlOne("0x01", 0x04, value);
							 return "1";
						}
						else if (deviceId.equals("1020"))// kongtiao0
						{
							 PocDevService.airConCtrlOne("0x01", 0x04, value);
							 return "1";
						}
					}
					if (alllight)
					{
						return "1";
					}
				}
			}
		}		
		return "";
	}
	/**
	 * GET方式提交数据
	 * 
	 * @param url
	 *            待请求的URL
	 * @param params
	 *            要提交的数据
	 * @param enc
	 *            编码
	 * @return 响应结果
	 * @throws IOException
	 *             IO异常
	 */
	public static String URLGet(String url, Map<String, String> params, String enc)
	{
		
		System.out.println("params: " + params);
		if (pocLight(url, params, enc).equalsIgnoreCase("1"))
		{
			return "1";
		}
		String response = EMPTY;
		GetMethod getMethod = null;
		StringBuffer strtTotalURL = new StringBuffer(EMPTY);

		if (strtTotalURL.indexOf("?") == -1)
		{
			strtTotalURL.append(url).append("?").append(getUrl(params, enc));
		}
		else
		{
			strtTotalURL.append(url).append("&").append(getUrl(params, enc));
		}

		log.info("GET请求URL = /n" + strtTotalURL.toString());

		try
		{
			getMethod = new GetMethod(strtTotalURL.toString());
			getMethod.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=" + enc);
			// 执行getMethod
			int statusCode = client.executeMethod(getMethod);
			if (statusCode == HttpStatus.SC_OK)
			{
				response = getMethod.getResponseBodyAsString();
			}
			else
			{
				log.debug("响应状态码 = " + getMethod.getStatusCode());
			}
		}
		catch (HttpException e)
		{
			log.error("发生致命的异常，可能是协议不对或者返回的内容有问题", e);
			e.printStackTrace();
		}
		catch (IOException e)
		{
			log.error("发生网络异常", e);
			e.printStackTrace();
		}
		finally
		{
			if (getMethod != null)
			{
				getMethod.releaseConnection();
				getMethod = null;
			}
		}

		return response;
	}

	/**
	 * 据Map生成URL字符串
	 * 
	 * @param map
	 *            Map
	 * @param valueEnc
	 *            URL编码
	 * @return URL
	 */
	private static String getUrl(Map<String, String> map, String valueEnc)
	{

		if (null == map || map.keySet().size() == 0)
		{
			return (EMPTY);
		}
		StringBuffer url = new StringBuffer();
		Set<String> keys = map.keySet();
		for (Iterator<String> it = keys.iterator(); it.hasNext();)
		{
			String key = it.next();
			if (map.containsKey(key))
			{
				String val = map.get(key);
				String str = val != null ? val : EMPTY;
				try
				{
					str = URLEncoder.encode(str, valueEnc);
				}
				catch (UnsupportedEncodingException e)
				{
					e.printStackTrace();
				}
				url.append(key).append("=").append(str).append(URL_PARAM_CONNECT_FLAG);
			}
		}
		String strURL = EMPTY;
		strURL = url.toString();
		if (URL_PARAM_CONNECT_FLAG.equals(EMPTY + strURL.charAt(strURL.length() - 1)))
		{
			strURL = strURL.substring(0, strURL.length() - 1);
		}

		return (strURL);
	}

	public static String URLPostXml(String url, String xml, String enc)
	{

		String response = EMPTY;
		PostMethod postMethod = null;
		try
		{
			postMethod = new PostMethod(url);
			RequestEntity entity = new StringRequestEntity(xml, "text/xml", enc);
			postMethod.setRequestEntity(entity);
			// 执行postMethod
			int statusCode = client.executeMethod(postMethod);
			if (statusCode == HttpStatus.SC_OK)
			{
				response = postMethod.getResponseBodyAsString();
			}
			else
			{
				log.error("响应状态码 = " + postMethod.getStatusCode());
			}
		}
		catch (HttpException e)
		{
			log.error("发生致命的异常，可能是协议不对或者返回的内容有问题", e);
			e.printStackTrace();
		}
		catch (IOException e)
		{
			log.error("发生网络异常", e);
			e.printStackTrace();
		}
		finally
		{
			if (postMethod != null)
			{
				postMethod.releaseConnection();
				postMethod = null;
			}
		}

		return response;
	}

}
