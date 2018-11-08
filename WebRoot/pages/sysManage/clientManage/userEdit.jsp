<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<s:if test=" user.id != null">
	<title>修改用户</title>
</s:if>
<s:else>
	<title>新增用户</title>
</s:else>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5"
		bgcolor="#CAFFFF"
		onload="javascript:document.getElementById('user.brand.id').focus()">
<s:actionmessage />
<form name="addUserForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById("addUserForm");
//保存
function saveUser(){
	var clienName=document.getElementById('user.client.id');
	var userName = document.getElementById('user.userName');
	var userCode = document.getElementById('user.userCode');
	var password = document.getElementById('user.password');
	var userLevel = document.getElementById('user.userLevel');
	//客户公司
	if(!(clienName.value>0)){
		alert('请选择客户公司！');
		clienName.focus();
		return;
	}
	//用户名
	if(userName.value==null || userName.value==''){
		alert('请输入用户名！');
		userName.focus();
		return;
	}
	if(userName.value.length>50){
		alert('您输入的用户名过长！');
		userName.focus();
		return;
	}
	//登录名
	if(userCode.value==null || userCode.value==''){
		alert('请输入登录名！');
		userCode.focus();
		return;
	}
	var execUserCode=/^(\w){6,16}$/; //只能输入6-16个字母、数字、下划线;
	if (!execUserCode.exec(userCode.value)){
    	alert("登录名只能输入6-16个字母、数字、下划线");
    	userCode.focus();
      	return false;
	}
	//密码
	if(password.value==null || password.value==''){
		alert('请输入密码！');
		password.focus();
		return;
	}
	var execPassword=/^(\w){6,16}$/; //只能输入6-16个字母、数字、下划线;
	if (!execPassword.exec(password.value)){
    	alert("密码只能输入6-16个字母、数字、下划线");
    	password.focus();
      	return false;
	}
	//用户类型
	if(!(userLevel.value>0)){
		alert('请选择用户分类！');
		userLevel.focus();
		return;
	}
	var save_User = document.getElementById('save_User');
	var cancel = document.getElementById('cancel');
	form.action='saveUser.action';
	form.submit();
	save_User.disabled = true;
	cancel.disabled = true;
}

//返回查询页面
function goBack(){
	window.location.href='userManage.action';
}
</script>
<input type="hidden" name="user.id" value="<s:property value="user.id"/>" />
<input type="hidden" name="user.deleted" value="<s:property value="user.deleted"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<input type="button" name="save_User" value="保  存"
							onclick="saveUser()"></input>
						&nbsp;
						<input type="button" name="cancel" value="取  消" onclick="goBack()"></input>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<table width="600" border=0 cellspacing="1" cellpadding="1"
							align="center" class="inputs">
							<tr bgcolor=#E0EFFC>
								<td align="center"
									style="height: 30px; font-weight: bold; font-size: 18px; color: #005AB5" colspan="4">
									<s:if test=" user.id != null">修改用户</s:if>
									<s:else>新增用户</s:else>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right" width=25%>
									&nbsp;客户公司：<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="queryClient" cssStyle="width:182px;height:20px"
										theme="simple" name="user.client.id"
										list="clientList" listKey="id" headerKey="-1"
										headerValue="请选择" listValue="clientName" >
									</s:select>
								</td>
								<td align="right" width=20% >
									用户名：<font color="red">*</font>
								</td>
								<td align="left" width=30%>
									<input type=text class="box" id="user.userName" name="user.userName"
										value="<s:property value="user.userName"/>"
										onkeypress="javascript:if(event.keyCode==13){saveUser();return false;}"></input>
								</td>
							</tr>
							<tr>
								<td align="right" width=25% >
									登录名：<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<input type=text class="box" id="user.userCode" name="user.userCode"
										value="<s:property value="user.userCode"/>"
										onkeypress="javascript:if(event.keyCode==13){saveUser();return false;}"></input>
								</td>
								<td align="right" width=20% >
									密码：<font color="red">*</font>
								</td>
								<td align="left" width=30%>
									<input type=text class="box" id="user.password" name="user.password"
										value="<s:property value="user.password"/>"
										onkeypress="javascript:if(event.keyCode==13){saveUser();return false;}"></input>
								</td>
							</tr>
							<tr>
								<td align="right" width=25% >
									用户类型：<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="userLevel" cssStyle="width:182px;height:20px"
										theme="simple" name="user.userLevel"
										list="userLevelList" listKey="userLevel" headerKey="-1"
										headerValue="请选择" listValue="strUserLevel" >
									</s:select>
								</td>
								<td></td><td></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>