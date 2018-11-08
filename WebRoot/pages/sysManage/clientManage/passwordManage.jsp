<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>�޸��û�����</title>
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
//����
function savePassword(){
	var password = document.getElementById("user.password");
	var newPassword = document.getElementById("user.newPassword");
	var reNewPassword = document.getElementById("user.reNewPassword");
	var save_Password = document.getElementById("save_Password");
	var reset = document.getElementById("reset");
	var execPw=/^(\w){6,16}$/; //ֻ������6-16����ĸ�����֡��»���;
	
	//������
	if(password.value==null || password.value==''){
		alert('����������룡');
		password.focus();
		return;
	}
	if (!execPw.exec(password.value)){
    	alert("������ֻ������6-16����ĸ�����֡��»���");
    	password.value="";
    	password.focus();
      	return false;
	}
	//������
	if(newPassword.value==null || newPassword.value==''){
		alert('�����������룡');
		newPassword.focus();
		return;
	}
	if (!execPw.exec(newPassword.value)){
    	alert("����ֻ������6-16����ĸ�����֡��»���");
    	newPassword.value="";
    	newPassword.focus();
      	return false;
	}
	//�ٴ�������
	if(reNewPassword.value==null || reNewPassword.value==''){
		alert('���ٴ����������룡');
		reNewPassword.focus();
		return;
	}
	if (!execPw.exec(reNewPassword.value)){
    	alert("�ٴ�������ֻ������6-16����ĸ�����֡��»���");
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
		alert("�������������벻һ�£�");
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
						<input type="button" name="save_Password" value="��  ��" onclick="savePassword()"></input>
						&nbsp;
						<input type="button" id="reset" name="reset" value=" �� �� " onclick="resetTable()"></input>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<table width="600" border=0 cellspacing="1" cellpadding="1" align="center" class="inputs">
							<tr bgcolor=#E0EFFC >
								<td align="center" colspan="2" style="height: 30px; font-weight: bold; font-size: 18px; color: #005AB5">
									�޸��û�����
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right">
									����������룺<font color="red">*</font>
								</td>
								<td align="left">
									<input type="password" class="box" name="user.password"
										value="<s:property value="user.password"/>"
										onkeypress="javascript:if(event.keyCode==13){document.getElementById('user.newPassword').focus();}"></input>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right">
									�����������룺<font color="red">*</font>
								</td>
								<td align="left">
									<input type="password" class="box" name="user.newPassword"
										value="<s:property value="user.password"/>"
										onkeypress="javascript:if(event.keyCode==13){document.getElementById('user.reNewPassword').focus();}"></input>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right">
									���ٴ����������룺<font color="red">*</font>
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