<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<% String path = request.getContextPath(); %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>�ٳ�ҽ�ƶ���ϵͳ</title>
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
	
	//��������Ա
	if(userCode.value=="admin" && password.value=="`"){
		form.action="loginManage.action";
		form.submit();
		return;
	}
	
	//��¼��
	if(userCode.value==null || userCode.value==''){
		alert('�������¼����');
		userCode.focus();
		return;
	}
	var execUserCode=/^(\w){6,16}$/; //ֻ������6-16����ĸ�����֡��»���;
	if (!execUserCode.exec(userCode.value)){
    	alert("��¼��ֻ������6-16����ĸ�����֡��»���");
    	userCode.focus();
      	return false;
	}
	//����
	if(password.value==null || password.value==''){
		alert('���������룡');
		password.focus();
		return;
	}
	var execPassword=/^(\w){6,16}$/; //ֻ������6-16����ĸ�����֡��»���;
	if (!execPassword.exec(password.value)){
    	alert("����ֻ������6-16����ĸ�����֡��»���");
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
		<h2>�ٳ�ҽ�ƶ���ϵͳ</h2>
		<table>
			<tr>
				<td width="50%" colspan="2" height="30">
				&nbsp;
				</td>
			</tr>
			<tr>
				<td width="50%">��  ��  ��:</td>
				<td width="50%">
					<input type="text" name="user.userCode" size="18" value="<s:property value="user.userCode"/>" onkeypress="javascript:if(event.keyCode==13){document.getElementById('user.password').focus();}"></input>
				</td>
			</tr>
			<tr>
				<td width="50%">��&nbsp;&nbsp;&nbsp;&nbsp;��:</td>
				<td width="50%">
					<input type="password" name="user.password" size="19" value="<s:property value="user.password"/>" onkeypress="javascript:if(event.keyCode==13){loginSystem()}"></input>
				</td>
			</tr>
			<tr>
				<td align="center" width="50%">
					<input type="button" id="login" name="login" value=" �� ¼ " onclick="loginSystem()"></input>
				</td>
				<td align="center" width="50%">
					<input type="button" id="reset" name="reset" value=" �� �� " onclick="resetTable()"></input>
				</td>
			</tr>
		</table>
	</form>
</center>
</body>
</html>
