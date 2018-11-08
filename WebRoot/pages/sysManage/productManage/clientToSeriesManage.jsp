<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>客户-产品授权</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5" bgcolor="#CAFFFF" >
<s:actionmessage/>
<form name="clientToSeriesManageForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById('clientToSeriesManageForm');

//查询
function queryClientToSeries(){
	var query_ClientToSeries = document.getElementById('query_ClientToSeries');
	var add_ClientToSeries = document.getElementById('add_ClientToSeries');
	var brandId = document.getElementById('clientToSeries.brand.id');
	var usageId = document.getElementById('clientToSeries.usage.id');
	var seriesId = document.getElementById('clientToSeries.series.id');
	var clientId = document.getElementById('clientToSeries.client.id');
	form.action='clientToSeriesManage.action';
	form.submit();
	query_ClientToSeries.disabled = true;
	add_ClientToSeries.disabled = true;
	brandId.disabled = true;
	usageId.disabled = true;
	seriesId.disabled = true;
	clientId.disabled = true;
}

//新增
function addClientToSeries(){
	form.action='addClientToSeries.action';
	form.submit();
}

//修改
function editClientToSeries(obj){
	document.location.href='editClientToSeries.action?selectId='+obj;
}

//删除
function deleteClientToSeries(obj){
	if(confirm("确定删除吗？")==true){
		document.location.href='deleteClientToSeries.action?selectId='+obj;
	}else{
		return;
	}
}

//通过选取“品牌”或“用途”来读取“系列”下拉框List
function displaySeriesList(){
	var query_ClientToSeries = document.getElementById('query_ClientToSeries');
	var add_ClientToSeries = document.getElementById('add_ClientToSeries');
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
		form.action='displaySeriesList4CTSManage.action';
		form.submit();
		query_ClientToSeries.disabled = true;
		add_ClientToSeries.disabled = true;
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
	var query_ClientToSeries = document.getElementById('query_ClientToSeries');
	var add_ClientToSeries = document.getElementById('add_ClientToSeries');
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
		form.action='displayModelList4CTSManage.action';
		form.submit();
		query_ClientToSeries.disabled = true;
		add_ClientToSeries.disabled = true;
		queryBrand.disabled = true;
		queryUsage.disabled = true;
		querySeries.disabled = true;
		querySize.disabled = true;
		queryModel.disabled = true;
		queryClient.disabled = true;
	}
}
</script>
	<table style="border:0 solid blue" style="background-color:#CAFFFF" >
			<tr> 
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="button" name="query_ClientToSeries" value="查  询" onclick="queryClientToSeries()"></input>&nbsp;
					<input type="button" class="button" name="add_ClientToSeries" value="新  增" onclick="addClientToSeries()"></input>&nbsp;
				</td>
			</tr>
			<tr> 
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					请选择查询过滤条件：
				</td>
			</tr>
			<tr>
				<td align="right" width="20%">
					品牌名称：
				</td>
				<td align="left" width="25%">
					<s:select id="queryBrand" cssStyle="width:182px;height:20px"
						theme="simple" name="clientToSeries.brand.id"
						list="brandList" listKey="id" headerKey="-1"
						headerValue="请选择" listValue="brandName"  onchange="displaySeriesList()">
					</s:select>
				</td>
				<td align="right" width="20%">
					用途名称：
				</td>
				<td align="left" width="35%">
					<s:select id="queryUsage" cssStyle="width:182px;height:20px"
						theme="simple" name="clientToSeries.usage.id"
						list="usageList" listKey="id" headerKey="-1"
						headerValue="请选择" listValue="usageName"  onchange="displaySeriesList()">
					</s:select>
				</td>
			</tr>
			<tr>
				<td align="right">
					系列名称：
				</td>
				<td align="left">
					<s:if test=" seriesList.size == 0 ">
						<s:select id="querySeries" cssStyle="width:182px;height:20px"
							theme="simple" name="clientToSeries.series.id"
							list="seriesList" listKey="id" headerKey="-1"
							headerValue="请选择" listValue="seriesName"  disabled="true">
						</s:select>
					</s:if>
					<s:else>
						<s:select id="querySeries" cssStyle="width:182px;height:20px"
							theme="simple" name="clientToSeries.series.id"
							list="seriesList" listKey="id" headerKey="-1"
							headerValue="请选择" listValue="seriesName"  onchange="displayModelList()">
						</s:select>
					</s:else>
				</td>
				<td align="right">
					医用功能分类名称：
				</td>
				<td align="left">
					<s:select id="querySize" cssStyle="width:182px;height:20px"
						theme="simple" name="clientToSeries.size.id"
						list="sizeList" listKey="id" headerKey="-1" 
						headerValue="请选择" listValue="sizeName" onchange="displayModelList()">
					</s:select>
				</td>
			</tr>
			<tr>
				<td align="right">
					产品名称：
				</td>
				<td align="left">
					<s:if test=" modelList.size == 0 ">
						<s:select id="queryModel" cssStyle="width:182px;height:20px"
							theme="simple" name="clientToSeries.model.id"
							list="modelList" listKey="id" headerKey="-1"
							headerValue="请选择" listValue="modelName"  disabled="true">
						</s:select>
					</s:if>
					<s:else>
						<s:select id="queryModel" cssStyle="width:182px;height:20px"
							theme="simple" name="clientToSeries.model.id"
							list="modelList" listKey="id" headerKey="-1"
							headerValue="请选择" listValue="modelName"  >
						</s:select>
					</s:else>
				</td>
				<td align="right">
					客户公司：
				</td>
				<td align="left">
					<s:select id="queryClient" cssStyle="width:182px;height:20px"
						theme="simple" name="clientToSeries.client.id"
						list="clientList" listKey="id" headerKey="-1"
						headerValue="请选择" listValue="clientName" >
					</s:select>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<table width="680" height="200" border=1 cellspacing="1" cellpadding="1" align="center" class="inputs" bgcolor=#E0EFFC>
						<tr bgcolor=#E0EFFC >
							<td align="center"  style="height:30px;font-weight:bold;font-client:18px;color:#005AB5 "> 
								客户-产品系列授权管理
							</td>
						</tr>
						<tr style="height:25px;">
							<td>
								<div style="WIDTH:680; HEIGHT: 400; BACKGROUND-COLOR: transparent; OVERFLOW: scroll; scrollbar-face-color: #FFFFFF; scrollbar-shadow-color: #D2E5F4; scrollbar-highlight-color: #D2E5F4; scrollbar-3dlight-color: #FFFFFF; scrollbar-darkshadow-color: #FFFFFF; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #D2E5F4">
								<table width="660" border=1>
									<tr>
										<td align="center" width="5%" style="height:8px;font-weight:bold;font-client:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;序&nbsp;号&nbsp;
										</td>
										<td align="center" width="12%" style="height:8px;font-weight:bold;font-client:12px;color:#005AB5 " >
											&nbsp;品&nbsp;&nbsp;&nbsp;牌&nbsp;
										</td>
										<td align="center" width="14%" style="height:8px;font-weight:bold;font-client:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;用&nbsp;&nbsp;&nbsp;途&nbsp;
										</td>
										<td align="center" width="14%" style="height:8px;font-weight:bold;font-client:12px;color:#005AB5 " >
											&nbsp;系&nbsp;&nbsp;&nbsp;列&nbsp;
										</td>
										<td align="center" width="16%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;医用功能分类&nbsp;
										</td>
										<td align="center" width="20%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;名&nbsp;&nbsp;&nbsp;称&nbsp;
										</td>
										<td align="center" width="14%" style="height:8px;font-weight:bold;font-client:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;客户公司&nbsp;
										</td>
										<td align="center" width="5%" style="height:8px;font-weight:bold;font-client:12px;color:#005AB5 " >
											&nbsp;操&nbsp;&nbsp;&nbsp;作&nbsp;
										</td>
									</tr>
									<% int i = 0; %>
									<s:if test="resultList.size > 0">
										<s:iterator value="resultList">
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
												<td align="center" >
													<s:property value="model.modelName" />
												</td>
												<td align="center" bgcolor=#E0EFFC>
													<s:property value="client.clientName" />&nbsp;&nbsp;
												</td>
												<td align="center" nowrap >
													&nbsp;<img alt="修  改" src="<%=path%>/treemenu/image/new/edit.gif" onclick="editClientToSeries(<s:property value="id"/>)"/>
													&nbsp;
													&nbsp;<img alt="删  除" src="<%=path%>/treemenu/image/new/delete.gif" onclick="deleteClientToSeries(<s:property value="id"/>)" />
												</td>
											</tr>
										</s:iterator>
									</s:if>
									<s:else>
										<tr style="height:25px;" >
											<td width="100%" align="right" colspan="8" class="navigator" >
												暂时没有数据
											</td>
										</tr>
									</s:else>
									<tr>
										<td colspan="8">
		                 					 <pt:pageInfo pageCount="${pageBean.pageCount}"    
		                               			currPage="${pageBean.currPage}"   
		                                    	param="currPage"   
		                                      	path="${urlPath}"  
		                                       	totalPage="${pageBean.lastPage}"   
		                                      	pageSize="${pageBean.pageSize}"   
		                                      	totalSize="${pageBean.totalSize}"   
		                                  	/>     
										</td>
									</tr>
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