<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<s:if test=" client.id != null">
	<title>�޸Ĳ�ƷƷ��</title>
</s:if>
<s:else>
	<title>������ƷƷ��</title>
</s:else>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5"
		bgcolor="#CAFFFF"
		onload="javascript:document.getElementById('client.clientName').focus()">
<s:actionmessage />
<form name="addClientForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById("addClientForm");
//����
function saveClient(){
	var clientName=document.getElementById('client.clientName');
	if(clientName.value==null || clientName.value==''){
		alert('������Ʒ�����ƣ�');
		clientName.focus();
		return;
	}
	if(clientName.value.length>50){
		alert('����������ݹ�����');
		clientName.focus();
		return;
	}
	var saveBtn = document.getElementById('save_Client');
	var cancel = document.getElementById('cancel');
	form.action='saveClient.action';
	form.submit();
	saveBtn.disabled = true;
	cancel.disabled = true;
}

//���ز�ѯҳ��
function goBack(){
	window.location.href='clientManage.action';
}
</script>
<input type="hidden" name="client.id" value="<s:property value="client.id"/>" />
<input type="hidden" name="client.deleted" value="<s:property value="client.deleted"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<input type="button" name="save_Client" value="��  ��"
							onclick="saveClient()"></input>
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
								<td align="center" style="height: 30px; font-weight: bold; font-size: 18px; color: #005AB5">
									<s:if test=" client.id != null">�޸Ŀͻ���˾</s:if>
									<s:else>�����ͻ���˾</s:else>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="center">
									Ʒ�����ƣ�<font color="red">*</font>
									<input type=text class="box" name="client.clientName"
										value="<s:property value="client.clientName"/>"
										onkeypress="javascript:if(event.keyCode==13){saveClient();return false;}"></input>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>