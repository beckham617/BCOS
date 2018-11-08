<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<s:if test=" model.id != null">
	<title>�޸Ĳ�Ʒ����</title>
</s:if>
<s:else>
	<title>������Ʒ����</title>
</s:else>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5"
		bgcolor="#CAFFFF" >
<s:actionmessage />
<form name="addModelForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById("addModelForm");
//����
function saveModel(){
	var modelName=document.getElementById('model.modelName');
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
	if(!(queryBrand.value>0)){
		alert('��ѡ���ƷƷ�����ƣ�');
		queryBrand.focus();
		return;
	}
	if(!(queryUsage.value>0)){
		alert('��ѡ���Ʒ��;���ƣ�');
		queryUsage.focus();
		return;
	}
	if(!(querySeries.value>0)){
		alert('��ѡ���Ʒϵ�����ƣ�');
		querySeries.focus();
		return;
	}
	if(!(querySize.value>0)){
		alert('��ѡ���Ʒҽ�ù��ܷ������ƣ�');
		querySize.focus();
		return;
	}
	if(modelName.value==null || modelName.value==''){
		alert('�������Ʒ���ƣ�');
		modelName.fucos();
		return;
	}
	if(modelName.value.length>50){
		alert('����������ݹ�����');
		modelName.focus();
		return;
	}
	
	var save_Model = document.getElementById('save_Model');
	var cancel = document.getElementById('cancel');
	form.action='saveModel.action';
	form.submit();
	save_Model.disabled = true;
	cancel.disabled = true;
	
}

//ͨ��ѡȡ��Ʒ�ơ�����;������ȡ��ϵ�С�������List
function displaySeriesList(){
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
	var save_Model = document.getElementById('save_Model');
	var cancel = document.getElementById('cancel');
	if(queryBrand.value == -1 && queryUsage.value == -1){
		querySeries.value = -1;
		querySeries.disabled = true;
		return;
	}else{
		form.action='displaySeriesList.action';
		form.submit();
		save_Model.disabled = true;
		cancel.disabled = true;
		queryBrand.disabled = true;
		queryUsage.disabled = true;
		querySeries.disabled = true;
		querySize.disabled = true;
	}

}

//���ز�ѯҳ��
function goBack(){
	window.location.href='productModelManage.action';
}
</script>
<input type="hidden" name="model.id" value="<s:property value="model.id"/>" />
<input type="hidden" name="model.deleted" value="<s:property value="model.deleted"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<input type="button" name="save_Model" value="��  ��"
							onclick="saveModel()"></input>
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
									<s:if test=" model.id != null">�޸Ĳ�Ʒ����</s:if>
									<s:else>������Ʒ����</s:else>
								</td>
							</tr>
							<tr>
								<td align="right" width=25%>
									&nbsp;Ʒ�����ƣ�<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="queryBrand" cssStyle="width:150px;height:20px"
										theme="simple" name="model.brand.id" 
										list="brandList" listKey="id" headerKey="-1" 
										headerValue="��ѡ��" listValue="brandName"  onchange="displaySeriesList()">
									</s:select>
								</td>
								<td align="right" width=25%>
									&nbsp;��;���ƣ�<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="queryUsage" cssStyle="width:150px;height:20px"
										theme="simple" name="model.usage.id" 
										list="usageList" listKey="id" headerKey="-1" 
										headerValue="��ѡ��" listValue="usageName"  onchange="displaySeriesList()">
									</s:select>
								</td>
							</tr>
							<tr>
								<td align="right" width=25%>
									ϵ�����ƣ�<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:if test=" seriesList.size == 0 ">
										<s:select id="querySeries" cssStyle="width:182px;height:20px"
											theme="simple" name="model.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="seriesName"  disabled="true">
										</s:select>
									</s:if>
									<s:else>
										<s:select id="querySeries" cssStyle="width:182px;height:20px"
											theme="simple" name="model.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="seriesName"  >
										</s:select>
									</s:else>
								</td>
								<td align="right" width=25%>
									ҽ�ù��ܷ������ƣ�<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="querySize" cssStyle="width:182px;height:20px"
										theme="simple" name="model.size.id"
										list="sizeList" listKey="id" headerKey="-1" 
										headerValue="��ѡ��" listValue="sizeName" >
									</s:select>
								</td>
							</tr>
							<tr>
								<td align="right" width=25% >
									��Ʒ���ƣ�<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<input type=text class="box" id="queryModel" name="model.modelName"
										value="<s:property value="model.modelName"/>"
										onkeypress="javascript:if(event.keyCode==13){saveModel();return false;}"></input>
								</td>
								<td align="right" width=25% >
									&nbsp;
								</td>
								<td align="left" width=25%>
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>