<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<s:if test=" user.id != null">
	<title>�޸��û�</title>
</s:if>
<s:else>
	<title>�����û�</title>
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
//����
function saveUser(){
	var clienName=document.getElementById('user.client.id');
	var userName = document.getElementById('user.userName');
	var userCode = document.getElementById('user.userCode');
	var password = document.getElementById('user.password');
	var userLevel = document.getElementById('user.userLevel');
	//�ͻ���˾
	if(!(clienName.value>0)){
		alert('��ѡ��ͻ���˾��');
		clienName.focus();
		return;
	}
	//�û���
	if(userName.value==null || userName.value==''){
		alert('�������û�����');
		userName.focus();
		return;
	}
	if(userName.value.length>50){
		alert('��������û���������');
		userName.focus();
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
	//�û�����
	if(!(userLevel.value>0)){
		alert('��ѡ���û����࣡');
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

//���ز�ѯҳ��
function goBack(){
	window.location.href='userManage.action';
}
</script>
<input type="hidden" name="user.id" value="<s:property value="user.id"/>" />
<input type="hidden" name="user.deleted" value="<s:property value="user.deleted"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<input type="button" name="save_User" value="��  ��"
							onclick="saveUser()"></input>
						&nbsp;
						<input type="button" name="cancel" value="ȡ  ��" onclick="goBack()"></input>
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
									<s:if test=" user.id != null">�޸��û�</s:if>
									<s:else>�����û�</s:else>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right" width=25%>
									&nbsp;�ͻ���˾��<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="queryClient" cssStyle="width:182px;height:20px"
										theme="simple" name="user.client.id"
										list="clientList" listKey="id" headerKey="-1"
										headerValue="��ѡ��" listValue="clientName" >
									</s:select>
								</td>
								<td align="right" width=20% >
									�û�����<font color="red">*</font>
								</td>
								<td align="left" width=30%>
									<input type=text class="box" id="user.userName" name="user.userName"
										value="<s:property value="user.userName"/>"
										onkeypress="javascript:if(event.keyCode==13){saveUser();return false;}"></input>
								</td>
							</tr>
							<tr>
								<td align="right" width=25% >
									��¼����<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<input type=text class="box" id="user.userCode" name="user.userCode"
										value="<s:property value="user.userCode"/>"
										onkeypress="javascript:if(event.keyCode==13){saveUser();return false;}"></input>
								</td>
								<td align="right" width=20% >
									���룺<font color="red">*</font>
								</td>
								<td align="left" width=30%>
									<input type=text class="box" id="user.password" name="user.password"
										value="<s:property value="user.password"/>"
										onkeypress="javascript:if(event.keyCode==13){saveUser();return false;}"></input>
								</td>
							</tr>
							<tr>
								<td align="right" width=25% >
									�û����ͣ�<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="userLevel" cssStyle="width:182px;height:20px"
										theme="simple" name="user.userLevel"
										list="userLevelList" listKey="userLevel" headerKey="-1"
										headerValue="��ѡ��" listValue="strUserLevel" >
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