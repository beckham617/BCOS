<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>客户订单明细管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5"
		bgcolor="#CAFFFF"
		onload="onloadFunction()">
<s:actionmessage />
<form name="clientListEditForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById("clientListEditForm");
String.prototype.Trim = function()   
{   
  return this.replace(/(^\s*)|(\s*$)/g,   "");   
}
function onloadFunction(){
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
	var queryModel = document.getElementById('queryModel');
	var number = document.getElementById('number');
	
	//刚进入页面，焦点在品牌上
	if(queryBrand.value<0){
		queryBrand.focus();
		return;
	}
	//选好品牌和用途，刷新页面，焦点在系列上
	if(queryBrand.value>0 && queryUsage.value>0 && querySeries.value<0){
		if(querySeries.disabled==false){
			querySeries.focus();
		}else{
			queryBrand.focus();
		}
		return;
	}
	//选好系列和医用功能分类，刷新页面，焦点在名称上
	if(querySeries.value>0 && querySize.value>0 && queryModel.value<0){
		if(queryModel.disabled==false){
			queryModel.focus();
		}else{
			querySeries.focus();
		}
		return;
	}
	//选好名称，刷新页面，焦点在数量上
	if(queryModel.value>0){
		number.focus();
		return;
	}
	
}
//保存
function saveDetail(){
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
	var queryModel = document.getElementById('queryModel');
	var number = document.getElementById('number');
	var saveBtn = document.getElementById('save_Detail');
	var cancel = document.getElementById('cancel');
	number.value = number.value.Trim();
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
	if(!(queryModel.value>0)){
		alert('请选择产品名称！');
		queryModel.focus();
		return;
	}
    if(number.value.search("^[0-9]*[1-9][0-9]*$")!=0)
    {
    	alert('数量只能输入正整数！');
		number.focus();
    	return;
    }
	
	form.action='saveClientListDetail.action';
	form.submit();
	saveBtn.disabled = true;
	cancel.disabled = true;
	queryBrand.disabled = true;
	queryUsage.disabled = true;
	querySeries.disabled = true;
	querySize.disabled = true;
	queryModel.disabled = true;
	number.disabled = true;
}

//返回查询页面
function goBack(){
	window.location.href='clientListManage.action';
}

//通过选取“品牌”与“用途”来筛选“系列”
function displaySeriesList(){
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
	var queryModel = document.getElementById('queryModel');
	var number = document.getElementById('number');
	var saveBtn = document.getElementById('save_Detail');
	var cancel = document.getElementById('cancel');
	number.value = number.value.Trim();
	
	//选“品牌”或“用途”:有一个为-1，则“系列”置空disable、“名称”置空disable、“价格”置空
	if(queryBrand.value == -1 || queryUsage.value == -1){
		querySeries.value = -1;
		querySeries.disabled = true;
		queryModel.value = -1;
		queryModel.disabled = true;
		return;
	}else{//选“品牌”或“用途”:都不为-1时，则查询“系列”列表
		//如果提前输入了数量，则需要校验
		if(number.value!="" && number.value!=0){
			if(number.value.search("^[0-9]*[1-9][0-9]*$")!=0)
	    	{
	    		alert('数量只能输入正整数！');
				number.focus();
	    		return;
	    	}
    	}
		form.action='displaySeriesList4Detail.action';
		form.submit();
		saveBtn.disabled = true;
		cancel.disabled = true;
		queryBrand.disabled = true;
		queryUsage.disabled = true;
		querySeries.disabled = true;
		querySize.disabled = true;
		queryModel.disabled = true;
		number.disabled = true;
	}
}

//通过选取“系列”与“医用功能分类”来筛选“名称”
function displayModelList(){
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
	var queryModel = document.getElementById('queryModel');
	var number = document.getElementById('number');
	var saveBtn = document.getElementById('save_Detail');
	var cancel = document.getElementById('cancel');
	number.value = number.value.Trim();
	
	//选“系列”或“医用功能分类”:有一个为-1，则“名称”置空disable、“价格”置空
	if(querySeries.value == -1 || querySize.value == -1){
		queryModel.value = -1;
		queryModel.disabled = true;
		return;
	}else{//选“系列”或“医用功能分类”:都不为-1时，则查询“名称”列表
		//如果提前输入了数量，则需要校验
		if(number.value!="" && number.value!=0){
			if(number.value.search("^[0-9]*[1-9][0-9]*$")!=0)
	    	{
	    		alert('数量只能输入正整数！');
				number.focus();
	    		return;
	    	}
    	}
		form.action='displayModelList4Detail.action';
		form.submit();
		saveBtn.disabled = true;
		cancel.disabled = true;
		queryBrand.disabled = true;
		queryUsage.disabled = true;
		querySeries.disabled = true;
		querySize.disabled = true;
		queryModel.disabled = true;
		number.disabled = true;
	}
}


//删除
function deleteDetail(obj){
	var selectDetailId = document.getElementById('selectDetailId');
	var checkStatus = document.getElementById('orderList.checkStatus'); 
	if(checkStatus.value == 1){
		alert("已复合订单不可修改明细！");
		return;
	}
	selectDetailId.value = obj;
	if(confirm("确定删除吗？")==true){
		form.action='deleteClientListDetail.action';
		form.submit();
	}else{
		return;
	}
}

function checkNum(obj){
	var num = obj.value;
	if(num!=""){
		if(isNaN(num)){
			alert("请输入正确的数字");
			obj.value = "";
			return false;
		}
	}
}
</script>

<input type="hidden" name="orderList.id" value="<s:property value="orderList.id"/>" />
<input type="hidden" name="orderList.deleted" value="<s:property value="orderList.deleted"/>" />
<input type="hidden" name="orderList.listType" value="<s:property value="orderList.listType"/>" />
<input type="hidden" name="orderList.checkStatus" value="<s:property value="orderList.checkStatus"/>" />
<input type="hidden" name="orderList.sumStatus" value="<s:property value="orderList.sumStatus"/>" />
<input type="hidden" name="orderList.client.id" value="<s:property value="orderList.client.id"/>" />
<input type="hidden" name="orderList.inputUser.id" value="<s:property value="orderList.inputUser.id"/>" />
<input type="hidden" name="orderList.sumDate" value="<s:date name="orderList.sumDate" format="yyyy-MM-dd"/>" />
<input type="hidden" name="selectDetailId" value="<s:property value="selectDetailId"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<table width="600" border=0 cellspacing="1" cellpadding="1"
							align="center" class="inputs">
							<tr bgcolor=#E0EFFC>
								<td align="center" style="height: 30px; font-weight: bold; font-size: 18px; color: #005AB5" colspan="4">
									客户订单明细管理
								</td>
							</tr>
							<tr>
								<td style="font-size: 12px; color: #005AB5" colspan="4">
								&nbsp;&nbsp;-主订单信息-
								</td>
							</tr>
							<tr>
								<td align="right" width=15%>
									订单号：
								</td>
								<td align="left" width=25%>
									<input id="orderListCode" name="orderList.orderListCode" type="text" class="box" 
									size="25" value="<s:property  value="orderList.orderListCode"/>" readonly >
								</td>
								<td align="right" width=20%>
									客户公司：
								</td>
								<td align="left" width=40%>
									<input id="clientName" name="orderList.client.clientName" type="text" class="box" 
									size="25" value="<s:property  value="orderList.client.clientName"/>" readonly >
								</td>
							</tr>
							<tr>
								<td align="right">
									录入日期：
								</td>
								<td align="left">
									<input id="orderDate" name="orderList.orderDate" type="text" class="box" 
									size="25" value="<s:date name="orderList.orderDate" format="yyyy-MM-dd"/>" readonly >
									
								</td>
								<td align="right">
									录入人：
								</td>
								<td align="left">
									<input id="userName" name="orderList.inputUser.userName" type="text" class="box" 
									size="25" value="<s:property  value="orderList.inputUser.userName"/>" readonly >
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right">
									复核状态：
								</td>
								<td align="left">
									<input id="checkStatus" name="orderList.strCheckStatus" type="text" class="box" 
									size="25" value="<s:property  value="orderList.strCheckStatus"/>" readonly >
								</td>
								<td align="right">
									订单类型：
								</td>
								<td align="left">
									<input id="listType" name="orderList.strListType" type="text" class="box" 
									size="25" value="<s:property  value="orderList.strListType"/>" readonly >
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right" valign="middle">
									备注信息：<br>（限100字）
								</td>
								<td colspan="3" align="left" valign="middle" >
									<textarea cols="78" rows="3" name="orderList.memo" readonly="readonly" ><s:property  value="orderList.memo"/></textarea>
								</td>
							</tr>
							<s:if test="orderList.checkStatus == 0"><!-- 未复核状态 -->
							<tr>
								<td style="font-size: 12px; color: #005AB5" colspan="4">
								&nbsp;&nbsp;-新增订单明细-
								</td>
							</tr>
							<tr>
								<td align="right">
									品牌名称：<font color="red">*</font>
								</td>
								<td align="left">
									<s:select id="queryBrand" cssStyle="width:182px;height:20px"
										theme="simple" name="orderListDetail.brand.id" 
										list="brandList" listKey="id" headerKey="-1" 
										headerValue="请选择" listValue="brandName"  onchange="displaySeriesList()">
									</s:select>
								</td>
								<td align="right">
									用途名称：<font color="red">*</font>
								</td>
								<td align="left">
									<s:select id="queryUsage" cssStyle="width:182px;height:20px"
										theme="simple" name="orderListDetail.usage.id" 
										list="usageList" listKey="id" headerKey="-1" 
										headerValue="请选择" listValue="usageName"  onchange="displaySeriesList()">
									</s:select>
								</td>
							</tr>
							<tr>
								<td align="right">
									系列名称：<font color="red">*</font>
								</td>
								<td align="left">
									<s:if test=" seriesList.size == 0 ">
										<s:select id="querySeries" cssStyle="width:182px;height:20px"
											theme="simple" name="orderListDetail.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="请选择" listValue="seriesName"  disabled="true">
										</s:select>
									</s:if>
									<s:else>
										<s:select id="querySeries" cssStyle="width:182px;height:20px"
											theme="simple" name="orderListDetail.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="请选择" listValue="seriesName" onchange="displayModelList()" >
										</s:select>
									</s:else>
								</td>
								<td align="right">
									医用功能分类名称：<font color="red">*</font>
								</td>
								<td align="left">
									<s:select id="querySize" cssStyle="width:182px;height:20px"
										theme="simple" name="orderListDetail.size.id"
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
										<s:select id="queryModel" cssStyle="width:182px;height:20px"
											theme="simple" name="orderListDetail.model.id"
											list="modelList" listKey="id" headerKey="-1"
											headerValue="请选择" listValue="modelName"  disabled="true">
										</s:select>
									</s:if>
									<s:else>
										<s:select id="queryModel" cssStyle="width:182px;height:20px"
											theme="simple" name="orderListDetail.model.id"
											list="modelList" listKey="id" headerKey="-1"
											headerValue="请选择" listValue="modelName" >
										</s:select>
									</s:else>
								</td>
								<td align="right">
									数量：<font color="red">*</font>
								</td>
								<td align="left">
									<input id="number" name="orderListDetail.number" type="text" class="box" 
									size="28" value="<s:property  value="orderListDetail.number"/>" onchange="return checkNum(this);">
								</td>
							</tr>
							</s:if>
							<tr>
								<td align="right" colspan="4">
									<s:if test="orderList.checkStatus == 0">
										<input type="button" name="save_Detail" value="保  存"
											onclick="saveDetail()"></input>
									</s:if>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" name="cancel" value="结  束" onclick="goBack()"></input>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr >
								<td style="font-size: 12px; color: #005AB5" colspan="4">
								&nbsp;&nbsp;-订单明细列表-
								</td>
							</tr>
							<tr style="height:25px;">
								<td colspan="4">
									<div style="WIDTH:680; HEIGHT: 265; BACKGROUND-COLOR: transparent; OVERFLOW: scroll; scrollbar-face-color: #FFFFFF; scrollbar-shadow-color: #D2E5F4; scrollbar-highlight-color: #D2E5F4; scrollbar-3dlight-color: #FFFFFF; scrollbar-darkshadow-color: #FFFFFF; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #D2E5F4">
									<table width="660" border="1">
										<tr>
											<td align="center" width="5%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;序&nbsp;号&nbsp;
											</td>
											<td align="center" width="12%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;品&nbsp;&nbsp;&nbsp;牌&nbsp;
											</td>
											<td align="center" width="12%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;用&nbsp;&nbsp;&nbsp;途&nbsp;
											</td>
											<td align="center" width="12%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;系&nbsp;&nbsp;&nbsp;列&nbsp;
											</td>
											<td align="center" width="16%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;医用功能分类&nbsp;
											</td>
											<td align="center" width="30%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;名&nbsp;&nbsp;&nbsp;称&nbsp;
											</td>
											<td align="center" width="8%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 "  bgcolor=#E0EFFC>
												&nbsp;数&nbsp;&nbsp;&nbsp;量&nbsp;
											</td>
											<s:if test="orderList.checkStatus == 0">
											<td align="center" width="5%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;操&nbsp;&nbsp;&nbsp;作&nbsp;
											</td>
											</s:if>
										</tr>
										<% int i = 0; %>
										<s:if test="detailResultList.size > 0">
											<s:iterator value="detailResultList">
												<% i += 1; %>
												<tr style="height:25px;" >
													<td align="center" class="navigator" bgcolor=#E0EFFC><%=i%></td>
													<td align="center" >
														<s:property value="brand.brandName" />
													</td>
													<td align="center" bgcolor=#E0EFFC>
														<s:property value="usage.usageName" />
													</td>
													<td align="center" >
														<s:property value="series.seriesName" />
													</td>
													<td align="center" bgcolor=#E0EFFC>
														<s:property value="size.sizeName" />
													</td>
													<td align="center">
														<s:property value="model.modelName" />
													</td>
													<td align="right" bgcolor=#E0EFFC>
														<s:property value="number" />&nbsp;&nbsp;
													</td>
													<s:if test="orderList.checkStatus == 0">
													<td align=center >
														<img alt="删  除" src="<%=path%>/treemenu/image/new/delete.gif" onclick="deleteDetail(<s:property value="id"/>)" />
													</td>
													</s:if>
												</tr>
											</s:iterator>
										</s:if>
										<s:else>
											<tr style="height:25px;" >
												<td width="100%" align="right" colspan="10" class="navigator" >
													暂时没有数据
												</td>
											</tr>
										</s:else>
									</table>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>