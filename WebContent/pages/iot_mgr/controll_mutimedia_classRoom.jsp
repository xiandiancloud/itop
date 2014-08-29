<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="/common/header.jsp"%>
</head>
<body>
<c:if test="${not empty devInfo}">
	<div style="width: 630px">
		<div class="tab_top">
			<div id="tab0" class="tab_text_over" onclick="changeTab('0')">
				<div class="left"></div>
				<div class="con">&nbsp;&nbsp;投影幕布管理&nbsp;&nbsp;</div>
				<div class="right" id="dateBtn"></div>
			</div>
			<div id="tab1" class="tab_text_out" onclick="changeTab('1')">
				<div class="left"></div>
				<div class="con">&nbsp;&nbsp;信号切换&nbsp;&nbsp;</div>
				<div class="right"></div>
			</div>
		</div>
		<div id="tabContent0" class="table_div" style="height: 250px;text-align: center;padding-top: 40px;">
			<dl>
				<button class="form_botton" onclick="sendCmd('${devInfo.devId}','PRO','ON',event);">投  影  开</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="form_botton" onclick="sendCmd('${devInfo.devId}','PRO','OFF',event);">投  影  关</button>
			</dl>
			<dl>&nbsp;&nbsp;</dl>
			<dl>
				<button class="form_botton" onclick="sendCmd('${devInfo.devId}','SCREEN','ON',event);">幕  布  升</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="form_botton" onclick="sendCmd('${devInfo.devId}','SCREEN','OFF',event);">幕  布  降</button>
			</dl>
		</div>
		<div id="tabContent1" class="table_div" style="height: 250px;padding-left:5px;display:none">
			<div>
				<dl style="text-align: left;"><b>投影左</b></dl>
				<dl style="text-align: left;padding-left: 20px">
					<table width="100%">
						<tr>
							<td>
								<button class="form_botton" onclick="sendCmd('${devInfo.devId}','RGB1','IN1',event);">信息接口1</button>&nbsp;
								<button class="form_botton" onclick="sendCmd('${devInfo.devId}','RGB1','IN2',event);">信息接口2</button>&nbsp;
								<button class="form_botton" onclick="sendCmd('${devInfo.devId}','RGB1','IN3',event);">信息接口3</button>&nbsp;
								<button class="form_botton" onclick="sendCmd('${devInfo.devId}','RGB1','IN4',event);">信息接口4</button>&nbsp;
								<button class="form_botton" onclick="sendCmd('${devInfo.devId}','RGB1','IN5',event);">信息接口5</button>
							</td>
						</tr>
					</table>
				</dl>
			</div>
			<div>
				<dl style="text-align: left;"><b>投影右</b></dl>
				<dl style="text-align: left;padding-left: 20px">
					<table width="100%">
						<tr>
							<td>
								<button class="form_botton" onclick="sendCmd('${devInfo.devId}','RGB2','IN1',event);">信息接口1</button>&nbsp;
								<button class="form_botton" onclick="sendCmd('${devInfo.devId}','RGB2','IN2',event);">信息接口2</button>&nbsp;
								<button class="form_botton" onclick="sendCmd('${devInfo.devId}','RGB2','IN3',event);">信息接口3</button>&nbsp;
								<button class="form_botton" onclick="sendCmd('${devInfo.devId}','RGB2','IN4',event);">信息接口4</button>&nbsp;
								<button class="form_botton" onclick="sendCmd('${devInfo.devId}','RGB2','IN5',event);">信息接口5</button>
							</td>
						</tr>
					</table>
				</dl>
			</div>
		</div>
	</div>
</c:if>
<c:if test="${empty devInfo}">
	<div style="width: 300px;height: 300px;text-align: center;padding-top: 50px"><font color="red"><b>暂无相应设备</b></font></div>
</c:if>
</body>
<script>
	function changeTab(tabIndex)
	{
		for(var i=0;i<3;i++)
		{
			if(tabIndex==i)
			{
				$('#tab'+i).attr("class","tab_text_over");
				$('#tabContent'+i).show();
			}
			else
			{
				$('#tab'+i).attr("class","tab_text_out");
				$('#tabContent'+i).hide();
			}
		}
	}
</script>
</html>
