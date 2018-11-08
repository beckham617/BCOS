<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<s:if test=" clientToSeries.id != null">
	<title>修改客户-产品授权</title>
</s:if>
<s:else>
	<title>新增客户-产品授权</title>
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

//保存
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
		alert('请选择产品品牌名称！');
		queryBrand.focus();
		return;
	}
	if(!(queryUsage.value>0)){
		alert('请选择产品用途名称！');
		queryUsage.focus();
		return;
	}
	if(!(querySeries.value>0)){
		alert('请选择产品系列名称！');
		querySeries.focus();
		return;
	}
	if(!(querySize.value>0)){
		alert('请选择医用功能分类名称！');
		querySize.focus();
		return;
	}
	if(!(queryModel.value>0)){
		alert('请选择产品名称！');
		queryModel.focus();
		return;
	}
	if(!(queryClient.value>0)){
		alert('请选择客户公司名称！');
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

//通过选取“品牌”或“用途”来读取“系列”下拉框List
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

//通过选取“系列”与“医用功能分类”来筛选“名称”
function displayModelList(){
	var cancel = document.getElementById('cancel');
	var save_ClientToSeries = document.getElementById('save_ClientToSeries');
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
	var queryModel = document.getElementById('queryModel');
	var queryClient = document.getElementById('queryClient');
	
	//选“系列”或“医用功能分类”:有一个为-1，则“名称”置空disable、“价格”置空
	if(querySeries.value == -1 || querySize.value == -1){
		queryModel.value = -1;
		queryModel.disabled = true;
		return;
	}else{//选“系列”或“医用功能分类”:都不为-1时，则查询“名称”列表
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
//返回查询页面
function goBack(){
	window.location.href='clientToSeriesManage.action';
}
</script>
<input type="hidden" name="clientToSeries.id" value="<s:property value="clientToSeries.id"/>" />
<input type="hidden" name="clientToSeries.deleted" value="<s:property value="clientToSeries.deleted"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<input type="button" name="save_ClientToSeries" value="保  存"
							onclick="saveSeries()"></input>
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
									style="height: 30px; font-weight: bold; font-client: 18px; color: #005AB5" colspan="4">
									<s:if test=" series.id != null">修改客户-产品授权</s:if>
									<s:else>新增客户-产品授权</s:else>
								</td>
							</tr>
							<tr >
								<td align="right" width=25%>
									&nbsp;品牌名称：<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="queryBrand" cssStyle="width:150px;height:20px"
										theme="simple" name="clientToSeries.brand.id"
										list="brandList" listKey="id" headerKey="-1"
										headerValue="请选择" listValue="brandName"  onchange="displaySeriesList()">
									</s:select>
								</td>
								<td align="right" width=25%>
									&nbsp;用途名称：<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="queryUsage" cssStyle="width:150px;height:20px"
										theme="simple" name="clientToSeries.usage.id"
										list="usageList" listKey="id" headerKey="-1"
										headerValue="请选择" listValue="usageName"  onchange="displaySeriesList()">
									</s:select>
								</td>
							</tr>
							<tr>
								<td align="right" >
									系列名称：<font color="red">*</font>
								</td>
								<td align="left" >
									<s:if test=" seriesList.size == 0 ">
										<s:select id="querySeries" cssStyle="width:150px;height:20px"
											theme="simple" name="clientToSeries.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="请选择" listValue="seriesName"  disabled="true">
										</s:select>
									</s:if>
									<s:else>
										<s:select id="querySeries" cssStyle="width:150px;height:20px"
											theme="simple" name="clientToSeries.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="请选择" listValue="seriesName"  onchange="displayModelList()">
										</s:select>
									</s:else>
								</td>
								<td align="right">
									医用功能分类名称：<font color="red">*</font>
								</td>
								<td align="left">
									<s:select id="querySize" cssStyle="width:150px;height:20px"
										theme="simple" name="clientToSeries.size.id"
										list="sizeList" listKey="id" headerKey="-1" 
										headerValue="请选择" listValue="sizeName" onchange="displayModelList()">
									</s:select>
								</td>
							</tr>
							<tr>
								<td align="right">
									产品名称：<font color="red">*</font>
								</td>
								<td align="left">
									<s:if test=" modelList.size == 0 ">
										<s:select id="queryModel" cssStyle="width:150px;height:20px"
											theme="simple" name="clientToSeries.model.id"
											list="modelList" listKey="id" headerKey="-1"
											headerValue="请选择" listValue="modelName"  disabled="true">
										</s:select>
									</s:if>
									<s:else>
										<s:select id="queryModel" cssStyle="width:150px;height:20px"
											theme="simple" name="clientToSeries.model.id"
											list="modelList" listKey="id" headerKey="-1"
											headerValue="请选择" listValue="modelName"  >
										</s:select>
									</s:else>
								</td>
								<td align="right" >
									&nbsp;客户公司：<font color="red">*</font>
								</td>
								<td align="left" >
									<s:select id="queryClient" cssStyle="width:150px;height:20px"
										theme="simple" name="clientToSeries.client.id"
										list="clientList" listKey="id" headerKey="-1"
										headerValue="请选择" listValue="clientName" >
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