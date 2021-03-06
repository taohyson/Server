<%@ include file="../common/taglib.jsp"%>
<%@ include file="../common/graphTools.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title><s:text name="summaryDataHistoryListJsp.title"></s:text></title>
		<style type="text/css">
		td {
			text-align: center;
		}
		</style>		
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="../../css/main.css" rel="stylesheet" type="text/css" />
		<script language="javascript" type="text/javascript" src="../../My97DatePicker/stats_WdatePicker.js"></script>  
	</head>
	<body>
		<form action="summaryDataHistoryList?isCommit=T" method="post" onsubmit="return check()">
			<s:text name="timeFrom"></s:text><s:text name="colon"></s:text>
			<input type="text" id="startDate" name="startDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="<s:if test="startDate != null"><s:text name="format.date_ymd"><s:param value="startDate"></s:param></s:text></s:if>" class="Wdate" style="width:100px"/>
			<s:text name="timeTo"></s:text>
			<input type="text" id="endDate" name="endDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="<s:if test="endDate != null"><s:text name="format.date_ymd"><s:param value="endDate"></s:param></s:text></s:if>" class="Wdate" style="width:100px"/>
			<input type="submit" value="<s:text name='submit'></s:text>" class="button" />
		</form>
		<table id="table" cellpadding="3" cellspacing="1" border="0" width="100%" align=center>
			<tr class="border">
				<td class="td_title" colspan="22" align="center">
					<center>
						<s:text name="summaryDataHistoryListJsp.title"></s:text>
					</center>
				</td>
			</tr>
			<tr>
				<td>
					<s:text name="channel"></s:text>
				</td>
				<td>
					<s:text name="summaryDataHistory.maxOnlineAmount"></s:text>
				</td>
				<td>
					<s:text name="summaryDataHistory.maxOnlineTime"></s:text>
				</td>
				<td>
					<s:text name="summaryDataHistory.avgOnlineAmount"></s:text>
				</td>
				<td>
					<s:text name="summaryDataHistory.payNum"></s:text>
				</td>
				<td>
					<s:text name="summaryDataHistory.payUserNum"></s:text>
				</td>
				<td>
					<s:text name="summaryDataHistory.buyToolConsume"></s:text>
				</td>
				<td>
					<s:text name="channelDetail"></s:text>
				</td>
			</tr>
			<s:iterator value="statsMap">
				<tr>
					<s:iterator>
						<td>
							${key}
						</td>
						<td>
							<s:property value="value.split(',')[4]"/>
						</td>
						<td>
							<s:property value="value.split(',')[5]"/>
						</td>
						<td>
							<s:property value="value.split(',')[3]"/>
						</td>
						<td>
							<s:property value="value.split(',')[0]"/>
						</td>
						<td>
							<s:property value="value.split(',')[1]"/>
						</td>
						<td>
							<s:property value="value.split(',')[2]"/>
						</td>
						<td>
							<a href="#" ><s:text name="detail"></s:text></a>
						</td>
					</s:iterator>
				</tr>
			</s:iterator>
			<tr>
				<td colspan="22">
					<aldtags:pageTag datePara1="startDate" dateValue1="${startDate}" datePara2="endDate" dateValue2="${endDate}" paraStr="isCommit,T"/>
				</td>
			</tr>
		</table>
	</body>
</html>