<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<s:if test=" usage.id != null">
	<title>�޸Ĳ�Ʒ��;</title>
</s:if>
<s:else>
	<title>������Ʒ��;</title>
</s:else>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5"
		bgcolor="#CAFFFF"
		onload="javascript:document.getElementById('usage.usageName').focus()">
<s:actionmessage />
<form name="addUsageForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById("addUsageForm");
//����
function saveUsage(){
	var usageName=document.getElementById('usage.usageName');
	if(usageName.value==null || usageName.value==''){
		alert('��������;���ƣ�');
		usageName.focus();
		return;
	}
	if(usageName.value.length>50){
		alert('����������ݹ�����');
		usageName.focus();
		return;
	}
	var save_Usage = document.getElementById('save_Usage');
	var cancel = document.getElementById('cancel');
	form.action='saveUsage.action';
	form.submit();
	save_Usage.disabled = true;
	cancel.disabled = true;
}

//���ز�ѯҳ��
function goBack(){
	window.location.href='productUsageManage.action';
}
</script>
<input type="hidden" name="usage.id" value="<s:property value="usage.id"/>" />
<input type="hidden" name="usage.deleted" value="<s:property value="usage.deleted"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<input type="button" name="save_Usage" value="��  ��"
							onclick="saveUsage()"></input>
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
									<s:if test=" usage.id != null">�޸Ĳ�Ʒ��;</s:if>
									<s:else>������Ʒ��;</s:else>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="center">
									��;���ƣ�<font color="red">*</font>
									<input type=text class="box" name="usage.usageName"
										value="<s:property value="usage.usageName"/>"
										onkeypress="javascript:if(event.keyCode==13){saveUsage();return false;}"></input>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>