<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>产品名称管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5" bgcolor="#CAFFFF" >
<s:actionmessage/>
<form name="modelManageForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById('modelManageForm');

//查询
function queryModel(){
	var query_Model = document.getElementById('query_Model');
	var add_Model = document.getElementById('add_Model');
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
	form.action='productModelManage.action';
	form.submit();
	query_Model.disabled = true;
	add_Model.disabled = true;
	queryBrand.disabled = true;
	queryUsage.disabled = true;
	querySeries.disabled = true;
	querySize.disabled = true;
}

//新增
function addModel(){
	form.action='addModel.action';
	form.submit();
}

//修改
function editModel(obj){
	document.location.href='editModel.action?selectId='+obj;
}

//删除
function deleteModel(obj){
	if(confirm("确定删除吗？")==true){
		document.location.href='deleteModel.action?selectId='+obj;
	}else{
		return;
	}
}

//通过选取“品牌”或“用途”来读取“系列”下拉框List
function displaySeriesList(){
	var brandId = document.getElementById('model.brand.id');
	var usageId = document.getElementById('model.usage.id');
	if(brandId.value == -1 && usageId.value == -1){
		var querySeries = document.getElementById('querySeries');
		querySeries.value = -1;
		querySeries.disabled = true;
		return;
	}else{
		var query_Model = document.getElementById('query_Model');
		var add_Model = document.getElementById('add_Model');
		var queryBrand = document.getElementById('queryBrand');
		var queryUsage = document.getElementById('queryUsage');
		var querySeries = document.getElementById('querySeries');
		var querySize = document.getElementById('querySize');
		form.action='productModelManage.action';
		form.submit();
		query_Model.disabled = true;
		add_Model.disabled = true;
		queryBrand.disabled = true;
		queryUsage.disabled = true;
		querySeries.disabled = true;
		querySize.disabled = true;
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
					<input type="button" class="button" name="query_Model" value="查  询" onclick="queryModel()"></input>&nbsp;
					<input type="button" class="button" name="add_Model" value="新  增" onclick="addModel()"></input>&nbsp;
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
				<td align="left">
					品牌名称：
					<s:select id="queryBrand" cssStyle="width:182px;height:20px"
						theme="simple" name="model.brand.id"
						list="brandList" listKey="id" headerKey="-1"
						headerValue="请选择" listValue="brandName"  onchange="displaySeriesList()">
					</s:select>
					&nbsp;&nbsp;&nbsp;&nbsp;
					用途名称：
					<s:select id="queryUsage" cssStyle="width:182px;height:20px"
						theme="simple" name="model.usage.id"
						list="usageList" listKey="id" headerKey="-1"
						headerValue="请选择" listValue="usageName"  onchange="displaySeriesList()">
					</s:select>
				</td>
			</tr>
			<tr>
				<td align="left">
					系列名称：
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
					&nbsp;&nbsp;&nbsp;&nbsp;
					医用功能分类名称：
					<s:select id="querySize" cssStyle="width:182px;height:20px"
						theme="simple" name="model.size.id"
						list="sizeList" listKey="id" headerKey="-1"
						headerValue="请选择" listValue="sizeName" >
					</s:select>
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" border=1 cellspacing="1" cellpadding="1" align="center" class="inputs" bgcolor=#E0EFFC>
						<tr bgcolor=#E0EFFC >
							<td align="center"  style="height:30px;font-weight:bold;font-size:18px;color:#005AB5 "> 
								产品名称管理
							</td>
						</tr>
						<tr style="height:25px;">
							<td>
								<div style="WIDTH:680; HEIGHT: 400; BACKGROUND-COLOR: transparent; OVERFLOW: scroll; scrollbar-face-color: #FFFFFF; scrollbar-shadow-color: #D2E5F4; scrollbar-highlight-color: #D2E5F4; scrollbar-3dlight-color: #FFFFFF; scrollbar-darkshadow-color: #FFFFFF; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #D2E5F4">
								<table width="100%" border=1>
									<tr>
										<td align="center" width="5%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;序&nbsp;号&nbsp;
										</td>
										<td align="center" width="15%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;品&nbsp;&nbsp;&nbsp;牌&nbsp;
										</td>
										<td align="center" width="15%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;用&nbsp;&nbsp;&nbsp;途&nbsp;
										</td>
										<td align="center" width="15%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;系&nbsp;&nbsp;&nbsp;列&nbsp;
										</td>
										<td align="center" width="15%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;医用功能分类&nbsp;
										</td>
										<td align="center" width="25%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;名&nbsp;&nbsp;&nbsp;称&nbsp;
										</td>
										<td align="center" width="10%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;操&nbsp;&nbsp;&nbsp;作&nbsp;
										</td>
									</tr>
									<% int i = 0; %>
									<s:if test="resultList.size > 0">
										<s:iterator value="resultList">
											<% i += 1; %>
											<tr style="height:25px;" >
												<td width="5%" align="center" class="navigator" bgcolor=#E0EFFC><%=i%></td>
												<td width="15%" align="center" >
													<s:property value="brand.brandName" />
												</td>
												<td width="15%" align="center" bgcolor=#E0EFFC>
													<s:property value="usage.usageName" />
												</td>
												<td width="15%" align="center" >
													<s:property value="series.seriesName" />
												</td>
												<td width="15%" align="center" bgcolor=#E0EFFC>
													<s:property value="size.sizeName" />
												</td>
												<td width="15%" align="center" >
													<s:property value="modelName" />
												</td>
												<td width="5%" align="center" bgcolor=#E0EFFC nowrap>
													&nbsp;<img alt="修  改" src="<%=path%>/treemenu/image/new/edit.gif" onclick="editModel(<s:property value="id"/>)"/>
													&nbsp;
													&nbsp;<img alt="删  除" src="<%=path%>/treemenu/image/new/delete.gif" onclick="deleteModel(<s:property value="id"/>)" />
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
											<%out.print("<pt:pageInfo pageCount=\"");%><s:property value="pageBean.pageCount"/><%out.print("\" currPage=\"");%><s:property value="pageBean.currPage"/><%out.print("\" param=\"currPage\" path=\"");%><s:property value="urlPath"/><%out.print("\" totalPage=\"");%><s:property value="pageBean.lastPage"/><%out.print("\" pageSize=\"");%><s:property value="pageBean.pageSize"/><%out.print("\" totalSize=\"");%><s:property value="pageBean.totalSize"/><%out.print("\" /> ");%>
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