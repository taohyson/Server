<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title><s:text name="bBuildingConstantListJsp.title"></s:text></title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="../../css/main.css" rel="stylesheet" type="text/css" />
		
	</head>
	<script type="text/javascript" src="../../js/ajax.js"></script>
	<script type="text/javascript">
		function reflashconstantcache() {
			var ajaxobj = new Ajax();
			ajaxobj.url="reflashConstantCache?cacheType=10&number="+Math.random();;
		    ajaxobj.callback=function(){
		    	var responseMsg = eval('(' + ajaxobj.gettext() + ')');
		    	//alert(responseMsg.erroCodeNum);
		    	if (responseMsg.erroCodeNum == 0) {
					alert('<s:text name="action.success"><s:param><s:text name="bBuildingConstantListJsp.reflashConstantCache"></s:text></s:param></s:text>');
				} else {
					alert('<s:text name="action.fail"><s:param><s:text name="bBuildingConstantListJsp.reflashConstantCache"></s:text></s:param></s:text>');
				}
		    }
			ajaxobj.send();
		}
		
		function del(buildingId) {
			if (window.confirm('<s:text name="deleteConfirm"><s:param><s:text name="buildingConstant.buildingId"></s:text></s:param><s:param>'+buildingId+'</s:param></s:text>')) {
				var ajaxobj = new Ajax();
				ajaxobj.url = "delBBuildingConstant?buildingId=" + buildingId;
				ajaxobj.callback = function() {
					//alert(ajaxobj.gettext());
					var tr = document.getElementById(buildingId);
					var table = document.getElementById("table");
					table.deleteRow(tr.rowIndex);
				}
				ajaxobj.send();
			}
	
		}
	
		function update(buildingId) {
			window.location.href = "updateBBuildingConstant?buildingId=" + buildingId;
		}
	
		function add() {
			window.location.href = "addBBuildingConstant";
		}
	</script>
	<body>
		<input type="submit" value="<s:text name="addBBuildingConstantJsp.title"></s:text>" class="button" onclick=add(); />
		<input type="button" value='<s:text name="bBuildingConstantListJsp.reflashConstantCache"></s:text>' class="button" onclick="reflashconstantcache()" />
		<table id="table" cellpadding="3" cellspacing="1" border="0" width="100%" align=center>
			<tr class="border">
				<td class="td_title" colspan="22" align="center">
					<center>
						<s:text name="bBuildingConstantListJsp.title"></s:text>
					</center>
				</td>
			</tr>
			<tr>
				<td>
					<s:text name="buildingConstant.buildingId"></s:text>
				</td>
				<td>
					<s:text name="buildingConstant.buildingName"></s:text>
				</td>
				<td>
					<s:text name="buildingConstant.buildingDesc"></s:text>
				</td>
				<td>
					<s:text name="buildingConstant.maxLevel"></s:text>
				</td>
				<td>
					<s:text name="buildingConstant.displayLevel"></s:text>
				</td>
				
				<td width="35">
					<s:text name="delete"></s:text>
				</td>
				<td width="35">
					<s:text name="update"></s:text>
				</td>
			</tr>
			<s:iterator var="buildingConstant" value="buildingConstantList">
				<tr id="${buildingConstant.buildingId}">
					<td>
						${buildingConstant.buildingId}
					</td>
					<td>
						${buildingConstant.buildingName}
					</td>
					<td>
						${buildingConstant.buildingDesc}
					</td>
					<td>
						${buildingConstant.maxLevel}
					</td>
					<td>
						${buildingConstant.displayLevel}
					</td>

					<td>
						<a href="#" onclick='del("${buildingConstant.buildingId}")'><s:text name="delete"></s:text></a>
					</td>
					<td>
						<a href="#" onclick='update("${buildingConstant.buildingId}")'><s:text name="update"></s:text></a>
					</td>
				</tr>
			</s:iterator>
			<tr>
				<td colspan="22">
					<aldtags:pageTag />
				</td>
			</tr>
		</table>
	</body>
</html>