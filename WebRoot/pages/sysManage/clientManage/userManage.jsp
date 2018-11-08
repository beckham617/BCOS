<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>产品系列管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5" bgcolor="#CAFFFF" >
<s:actionmessage/>
<form name="userManageForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById('userManageForm');
//查询
function queryUser(){
	var query_User = document.getElementById('query_User');
	var add_User = document.getElementById('add_User');
	form.action='userManage.action';
	form.submit();
	query_User.disabled=true;
	add_User.disabled=true;
}

//新增
function addUser(){
	form.action='addUser.action';
	form.submit();
}

//修改
function editUser(obj){
	document.location.href='editUser.action?selectId='+obj;
}

//删除
function deleteUser(obj){
	if(confirm("确定删除吗？")==true){
		document.location.href='deleteUser.action?selectId='+obj;
	}else{
		return;
	}
}
</script>
	<table style="border:0 solid blue" style="background-color:#CAFFFF" >
			<tr> 
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="button" name="query_User" value="查  询" onclick="queryUser()"></input>&nbsp;
					<input type="button" class="button" name="add_User" value="新  增" onclick="addUser()"></input>&nbsp;
				</td>
			</tr>
			<tr> 
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					请选择查询过滤条件：
				</td>
			</tr>
			<tr>
				<td align="left">
					客户公司：
					<s:select id="queryClient" cssStyle="width:182px;height:20px"
						theme="simple" name="user.client.id"
						list="clientList" listKey="id" headerKey="-1"
						headerValue="请选择" listValue="clientName" >
					</s:select>
					&nbsp;&nbsp;&nbsp;&nbsp;
					用户类型：
					<s:select id="userLevel" cssStyle="width:182px;height:20px"
						theme="simple" name="user.userLevel"
						list="userLevelList" listKey="userLevel" headerKey="-1"
						headerValue="请选择" listValue="strUserLevel" >
					</s:select>
				</td>
			</tr>
			<tr>
				<td>
					<table width="600" height="200" border=1 cellspacing="1" cellpadding="1" align="center" class="inputs" bgcolor=#E0EFFC>
						<tr bgcolor=#E0EFFC >
							<td align="center"  style="height:30px;font-weight:bold;font-size:18px;color:#005AB5 "> 
								用户管理
							</td>
						</tr>
						<tr style="height:25px;">
							<td>
								<div style="WIDTH:620; HEIGHT: 400; BACKGROUND-COLOR: transparent; OVERFLOW: scroll; scrollbar-face-color: #FFFFFF; scrollbar-shadow-color: #D2E5F4; scrollbar-highlight-color: #D2E5F4; scrollbar-3dlight-color: #FFFFFF; scrollbar-darkshadow-color: #FFFFFF; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #D2E5F4">
								<table width="600" border=1>
									<tr>
										<td align="center" width="5%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;序&nbsp;号&nbsp;
										</td>
										<td align="center" width="20%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;客户公司&nbsp;
										</td>
										<td align="center" width="20%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;用&nbsp;户&nbsp;名&nbsp;
										</td>
										<td align="center" width="20%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;登&nbsp;录&nbsp;名&nbsp;
										</td>
										<td align="center" width="20%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;用户等级&nbsp;
										</td>
										<td align="center" width="15%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;操&nbsp;&nbsp;&nbsp;作&nbsp;
										</td>
									</tr>
									<% int i = 0; %>
									<s:if test="resultList.size > 0">
									<s:iterator value="resultList">
										<% i += 1; %>
										<tr style="height:25px;" >
											<td width="5%" align="center" class="navigator" bgcolor=#E0EFFC><%=i%></td>
											<td width="20%" align="center" >
												<s:property value="client.clientName" />
											</td>
											<td width="20%" align="center" bgcolor=#E0EFFC>
												<s:property value="userName" />
											</td>
											<td width="20%" align="center" >
												<s:property value="userCode" />
											</td>
											<td width="20%" align="center" bgcolor=#E0EFFC>
												<s:property value="strUserLevel" />
											</td>
											<td width="15%" align=center border=0 nowrap >
												&nbsp;<img alt="修  改" src="<%=path%>/treemenu/image/new/edit.gif" onclick="editUser(<s:property value="id"/>)"/>
												&nbsp;
												&nbsp;<img alt="删  除" src="<%=path%>/treemenu/image/new/delete.gif" onclick="deleteUser(<s:property value="id"/>)" />
											</td>
										</tr>
									</s:iterator>
									</s:if>
									<s:else>
										<tr style="height:25px;" >
											<td width="100%" align="right" colspan="6" class="navigator" >
												暂时没有数据
											</td>
										</tr>
									</s:else>
								</table>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>