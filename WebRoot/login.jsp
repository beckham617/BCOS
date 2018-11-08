<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<% String path = request.getContextPath(); %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>百畅医疗订货系统</title>
</head>
<body background="<%=path%>/image/Butterfly.jpg" bgcolor="#CAFFFF" onload="document.getElementById('user.userCode').focus()">
<center>
<form name="loginForm" method="post">
<s:actionmessage />
<script language="JavaScript" type="text/JavaScript">
if(window.parent){
	window.parent.location.href="#";
}
String.prototype.Trim = function()   
{   
  return this.replace(/(^\s*)|(\s*$)/g,   "");   
}
var form = document.getElementById("loginForm");

function loginSystem(){
	var userCode = document.getElementById("user.userCode");
	var password = document.getElementById("user.password");
	var login = document.getElementById("login");
	var reset = document.getElementById("reset");
	userCode.value = userCode.value.Trim(); 
	
	//超级管理员
	if(userCode.value=="admin" && password.value=="`"){
		form.action="loginManage.action";
		form.submit();
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
	form.action="loginManage.action";
	form.submit();
	login.disabled = true;
	reset.disabled = true;
}

function resetTable(){
	var userCode = document.getElementById("user.userCode");
	var password = document.getElementById("user.password");
	userCode.value = "";
	password.value = "";
	userCode.focus();
}
</script>

		<table>
			<tr>
				<td height=100>
					&nbsp;
				</td>
			</tr>
		</table>
		<h2>百畅医疗订货系统</h2>
		<table>
			<tr>
				<td width="50%" colspan="2" height="30">
				&nbsp;
				</td>
			</tr>
			<tr>
				<td width="50%">用  户  名:</td>
				<td width="50%">
					<input type="text" name="user.userCode" size="18" value="<s:property value="user.userCode"/>" onkeypress="javascript:if(event.keyCode==13){document.getElementById('user.password').focus();}"></input>
				</td>
			</tr>
			<tr>
				<td width="50%">密&nbsp;&nbsp;&nbsp;&nbsp;码:</td>
				<td width="50%">
					<input type="password" name="user.password" size="19" value="<s:property value="user.password"/>" onkeypress="javascript:if(event.keyCode==13){loginSystem()}"></input>
				</td>
			</tr>
			<tr>
				<td align="center" width="50%">
					<input type="button" id="login" name="login" value=" 登 录 " onclick="loginSystem()"></input>
				</td>
				<td align="center" width="50%">
					<input type="button" id="reset" name="reset" value=" 重 置 " onclick="resetTable()"></input>
				</td>
			</tr>
		</table>
	</form>
</center>
</body>
</html>
