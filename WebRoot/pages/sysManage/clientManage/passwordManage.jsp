<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>修改用户密码</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5"
	style="background-image:url(<%=path%>/image/GrassinA.jpg);background-repeat:no-repeat;"
	onload="onloadJS();">
<s:actionmessage />
<form name="passwordManageForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById("passwordManageForm");

function onloadJS(){
	var password = document.getElementById("user.password");
	var newPassword = document.getElementById("user.newPassword");
	var reNewPassword = document.getElementById("user.reNewPassword");
	password.value="";
	newPassword.value="";
	reNewPassword.value="";
	password.focus()
}
//保存
function savePassword(){
	var password = document.getElementById("user.password");
	var newPassword = document.getElementById("user.newPassword");
	var reNewPassword = document.getElementById("user.reNewPassword");
	var save_Password = document.getElementById("save_Password");
	var reset = document.getElementById("reset");
	var execPw=/^(\w){6,16}$/; //只能输入6-16个字母、数字、下划线;
	
	//旧密码
	if(password.value==null || password.value==''){
		alert('请输入旧密码！');
		password.focus();
		return;
	}
	if (!execPw.exec(password.value)){
    	alert("旧密码只能输入6-16个字母、数字、下划线");
    	password.value="";
    	password.focus();
      	return false;
	}
	//新密码
	if(newPassword.value==null || newPassword.value==''){
		alert('请输入新密码！');
		newPassword.focus();
		return;
	}
	if (!execPw.exec(newPassword.value)){
    	alert("密码只能输入6-16个字母、数字、下划线");
    	newPassword.value="";
    	newPassword.focus();
      	return false;
	}
	//再次新密码
	if(reNewPassword.value==null || reNewPassword.value==''){
		alert('请再次输入新密码！');
		reNewPassword.focus();
		return;
	}
	if (!execPw.exec(reNewPassword.value)){
    	alert("再次新密码只能输入6-16个字母、数字、下划线");
    	reNewPassword.value="";
    	reNewPassword.focus();
      	return false;
	}
	if(newPassword.value == reNewPassword.value){
		form.action="passwordManage.action";
		form.submit();
		save_Password.disabled = true;
		reset.disabled = true;
	}else{
		alert("两次输入新密码不一致！");
		newPassword.value="";
		reNewPassword.value="";
		newPassword.focus();
		return false;
	}
}

function resetTable(){
	var password = document.getElementById("user.password");
	var newPassword = document.getElementById("user.newPassword");
	var reNewPassword = document.getElementById("user.reNewPassword");
	password.value = "";
	newPassword.value = "";
	reNewPassword.value = "";
	password.focus();
}
</script>
			<table style="border: 0 solid blue" >
				<tr>
					<td>
						<input type="button" name="save_Password" value="保  存" onclick="savePassword()"></input>
						&nbsp;
						<input type="button" id="reset" name="reset" value=" 重 置 " onclick="resetTable()"></input>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<table width="600" border=0 cellspacing="1" cellpadding="1" align="center" class="inputs">
							<tr bgcolor=#E0EFFC >
								<td align="center" colspan="2" style="height: 30px; font-weight: bold; font-size: 18px; color: #005AB5">
									修改用户密码
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right">
									请输入旧密码：<font color="red">*</font>
								</td>
								<td align="left">
									<input type="password" class="box" name="user.password"
										value="<s:property value="user.password"/>"
										onkeypress="javascript:if(event.keyCode==13){document.getElementById('user.newPassword').focus();}"></input>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right">
									请输入新密码：<font color="red">*</font>
								</td>
								<td align="left">
									<input type="password" class="box" name="user.newPassword"
										value="<s:property value="user.password"/>"
										onkeypress="javascript:if(event.keyCode==13){document.getElementById('user.reNewPassword').focus();}"></input>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right">
									请再次输入新密码：<font color="red">*</font>
								</td>
								<td align="left">
									<input type="password" class="box" name="user.reNewPassword"
										onkeypress="javascript:if(event.keyCode==13){savePassword();return false;}"></input>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>