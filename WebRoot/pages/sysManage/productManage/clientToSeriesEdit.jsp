<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<s:if test=" clientToSeries.id != null">
	<title>�޸Ŀͻ�-��Ʒ��Ȩ</title>
</s:if>
<s:else>
	<title>�����ͻ�-��Ʒ��Ȩ</title>
</s:else>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5"
		bgcolor="#CAFFFF"
		onload="javascript:document.getElementById('clientToSeries.brand.id').focus()">
<s:actionmessage />
<form name="addClientToSeriesForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById("addClientToSeriesForm");

//����
function saveSeries(){
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
	var queryModel = document.getElementById('queryModel');
	var queryClient = document.getElementById('queryClient');
	var save_ClientToSeries = document.getElementById('save_ClientToSeries');
	var cancel = document.getElementById('cancel');
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
		alert('��ѡ��ҽ�ù��ܷ������ƣ�');
		querySize.focus();
		return;
	}
	if(!(queryModel.value>0)){
		alert('��ѡ���Ʒ���ƣ�');
		queryModel.focus();
		return;
	}
	if(!(queryClient.value>0)){
		alert('��ѡ��ͻ���˾���ƣ�');
		queryClient.focus();
		return;
	}
	
	form.action='saveClientToSeries.action';
	form.submit();
	cancel.disabled = true;
	save_ClientToSeries.disabled = true;
	queryBrand.disabled = true;
	queryUsage.disabled = true;
	querySeries.disabled = true;
	querySize.disabled = true;
	queryModel.disabled = true;
	queryClient.disabled = true;
}

//ͨ��ѡȡ��Ʒ�ơ�����;������ȡ��ϵ�С�������List
function displaySeriesList(){
	var cancel = document.getElementById('cancel');
	var save_ClientToSeries = document.getElementById('save_ClientToSeries');
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
	var queryModel = document.getElementById('queryModel');
	var queryClient = document.getElementById('queryClient');
	if(queryBrand.value == -1 || queryUsage.value == -1){
		querySeries.value = -1;
		querySeries.disabled = true;
		queryModel.value = -1;
		queryModel.disabled = true;
		return;
	}else{
		form.action='displaySeriesList4CTS.action';
		form.submit();
		cancel.disabled = true;
		save_ClientToSeries.disabled = true;
		queryBrand.disabled = true;
		queryUsage.disabled = true;
		querySeries.disabled = true;
		querySize.disabled = true;
		queryModel.disabled = true;
		queryClient.disabled = true;
	}
}

//ͨ��ѡȡ��ϵ�С��롰ҽ�ù��ܷ��ࡱ��ɸѡ�����ơ�
function displayModelList(){
	var cancel = document.getElementById('cancel');
	var save_ClientToSeries = document.getElementById('save_ClientToSeries');
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
	var queryModel = document.getElementById('queryModel');
	var queryClient = document.getElementById('queryClient');
	
	//ѡ��ϵ�С���ҽ�ù��ܷ��ࡱ:��һ��Ϊ-1�������ơ��ÿ�disable�����۸��ÿ�
	if(querySeries.value == -1 || querySize.value == -1){
		queryModel.value = -1;
		queryModel.disabled = true;
		return;
	}else{//ѡ��ϵ�С���ҽ�ù��ܷ��ࡱ:����Ϊ-1ʱ�����ѯ�����ơ��б�
		form.action='displayModelList4CTS.action';
		form.submit();
		cancel.disabled = true;
		save_ClientToSeries.disabled = true;
		queryBrand.disabled = true;
		queryUsage.disabled = true;
		querySeries.disabled = true;
		querySize.disabled = true;
		queryModel.disabled = true;
		queryClient.disabled = true;
	}
}
//���ز�ѯҳ��
function goBack(){
	window.location.href='clientToSeriesManage.action';
}
</script>
<input type="hidden" name="clientToSeries.id" value="<s:property value="clientToSeries.id"/>" />
<input type="hidden" name="clientToSeries.deleted" value="<s:property value="clientToSeries.deleted"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<input type="button" name="save_ClientToSeries" value="��  ��"
							onclick="saveSeries()"></input>
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
									style="height: 30px; font-weight: bold; font-client: 18px; color: #005AB5" colspan="4">
									<s:if test=" series.id != null">�޸Ŀͻ�-��Ʒ��Ȩ</s:if>
									<s:else>�����ͻ�-��Ʒ��Ȩ</s:else>
								</td>
							</tr>
							<tr >
								<td align="right" width=25%>
									&nbsp;Ʒ�����ƣ�<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="queryBrand" cssStyle="width:150px;height:20px"
										theme="simple" name="clientToSeries.brand.id"
										list="brandList" listKey="id" headerKey="-1"
										headerValue="��ѡ��" listValue="brandName"  onchange="displaySeriesList()">
									</s:select>
								</td>
								<td align="right" width=25%>
									&nbsp;��;���ƣ�<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="queryUsage" cssStyle="width:150px;height:20px"
										theme="simple" name="clientToSeries.usage.id"
										list="usageList" listKey="id" headerKey="-1"
										headerValue="��ѡ��" listValue="usageName"  onchange="displaySeriesList()">
									</s:select>
								</td>
							</tr>
							<tr>
								<td align="right" >
									ϵ�����ƣ�<font color="red">*</font>
								</td>
								<td align="left" >
									<s:if test=" seriesList.size == 0 ">
										<s:select id="querySeries" cssStyle="width:150px;height:20px"
											theme="simple" name="clientToSeries.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="seriesName"  disabled="true">
										</s:select>
									</s:if>
									<s:else>
										<s:select id="querySeries" cssStyle="width:150px;height:20px"
											theme="simple" name="clientToSeries.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="seriesName"  onchange="displayModelList()">
										</s:select>
									</s:else>
								</td>
								<td align="right">
									ҽ�ù��ܷ������ƣ�<font color="red">*</font>
								</td>
								<td align="left">
									<s:select id="querySize" cssStyle="width:150px;height:20px"
										theme="simple" name="clientToSeries.size.id"
										list="sizeList" listKey="id" headerKey="-1" 
										headerValue="��ѡ��" listValue="sizeName" onchange="displayModelList()">
									</s:select>
								</td>
							</tr>
							<tr>
								<td align="right">
									��Ʒ���ƣ�<font color="red">*</font>
								</td>
								<td align="left">
									<s:if test=" modelList.size == 0 ">
										<s:select id="queryModel" cssStyle="width:150px;height:20px"
											theme="simple" name="clientToSeries.model.id"
											list="modelList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="modelName"  disabled="true">
										</s:select>
									</s:if>
									<s:else>
										<s:select id="queryModel" cssStyle="width:150px;height:20px"
											theme="simple" name="clientToSeries.model.id"
											list="modelList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="modelName"  >
										</s:select>
									</s:else>
								</td>
								<td align="right" >
									&nbsp;�ͻ���˾��<font color="red">*</font>
								</td>
								<td align="left" >
									<s:select id="queryClient" cssStyle="width:150px;height:20px"
										theme="simple" name="clientToSeries.client.id"
										list="clientList" listKey="id" headerKey="-1"
										headerValue="��ѡ��" listValue="clientName" >
									</s:select>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>