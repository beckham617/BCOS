<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<s:if test=" model.id != null">
	<title>修改产品名称</title>
</s:if>
<s:else>
	<title>新增产品名称</title>
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
//保存
function saveModel(){
	var modelName=document.getElementById('model.modelName');
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
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
		alert('请选择产品医用功能分类名称！');
		querySize.focus();
		return;
	}
	if(modelName.value==null || modelName.value==''){
		alert('请输入产品名称！');
		modelName.fucos();
		return;
	}
	if(modelName.value.length>50){
		alert('您输入的内容过长！');
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

//通过选取“品牌”或“用途”来读取“系列”下拉框List
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

//返回查询页面
function goBack(){
	window.location.href='productModelManage.action';
}
</script>
<input type="hidden" name="model.id" value="<s:property value="model.id"/>" />
<input type="hidden" name="model.deleted" value="<s:property value="model.deleted"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<input type="button" name="save_Model" value="保  存"
							onclick="saveModel()"></input>
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
									style="height: 30px; font-weight: bold; font-size: 18px; color: #005AB5" colspan="4">
									<s:if test=" model.id != null">修改产品名称</s:if>
									<s:else>新增产品名称</s:else>
								</td>
							</tr>
							<tr>
								<td align="right" width=25%>
									&nbsp;品牌名称：<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="queryBrand" cssStyle="width:150px;height:20px"
										theme="simple" name="model.brand.id" 
										list="brandList" listKey="id" headerKey="-1" 
										headerValue="请选择" listValue="brandName"  onchange="displaySeriesList()">
									</s:select>
								</td>
								<td align="right" width=25%>
									&nbsp;用途名称：<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="queryUsage" cssStyle="width:150px;height:20px"
										theme="simple" name="model.usage.id" 
										list="usageList" listKey="id" headerKey="-1" 
										headerValue="请选择" listValue="usageName"  onchange="displaySeriesList()">
									</s:select>
								</td>
							</tr>
							<tr>
								<td align="right" width=25%>
									系列名称：<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:if test=" seriesList.size == 0 ">
										<s:select id="querySeries" cssStyle="width:182px;height:20px"
											theme="simple" name="model.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="请选择" listValue="seriesName"  disabled="true">
										</s:select>
									</s:if>
									<s:else>
										<s:select id="querySeries" cssStyle="width:182px;height:20px"
											theme="simple" name="model.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="请选择" listValue="seriesName"  >
										</s:select>
									</s:else>
								</td>
								<td align="right" width=25%>
									医用功能分类名称：<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="querySize" cssStyle="width:182px;height:20px"
										theme="simple" name="model.size.id"
										list="sizeList" listKey="id" headerKey="-1" 
										headerValue="请选择" listValue="sizeName" >
									</s:select>
								</td>
							</tr>
							<tr>
								<td align="right" width=25% >
									产品名称：<font color="red">*</font>
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