<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>�ͻ�-��Ʒ��Ȩ</title>
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

//��ѯ
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

//����
function addClientToSeries(){
	form.action='addClientToSeries.action';
	form.submit();
}

//�޸�
function editClientToSeries(obj){
	document.location.href='editClientToSeries.action?selectId='+obj;
}

//ɾ��
function deleteClientToSeries(obj){
	if(confirm("ȷ��ɾ����")==true){
		document.location.href='deleteClientToSeries.action?selectId='+obj;
	}else{
		return;
	}
}

//ͨ��ѡȡ��Ʒ�ơ�����;������ȡ��ϵ�С�������List
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

//ͨ��ѡȡ��ϵ�С��롰ҽ�ù��ܷ��ࡱ��ɸѡ�����ơ�
function displayModelList(){
	var query_ClientToSeries = document.getElementById('query_ClientToSeries');
	var add_ClientToSeries = document.getElementById('add_ClientToSeries');
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
					<input type="button" class="button" name="query_ClientToSeries" value="��  ѯ" onclick="queryClientToSeries()"></input>&nbsp;
					<input type="button" class="button" name="add_ClientToSeries" value="��  ��" onclick="addClientToSeries()"></input>&nbsp;
				</td>
			</tr>
			<tr> 
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					��ѡ���ѯ����������
				</td>
			</tr>
			<tr>
				<td align="right" width="20%">
					Ʒ�����ƣ�
				</td>
				<td align="left" width="25%">
					<s:select id="queryBrand" cssStyle="width:182px;height:20px"
						theme="simple" name="clientToSeries.brand.id"
						list="brandList" listKey="id" headerKey="-1"
						headerValue="��ѡ��" listValue="brandName"  onchange="displaySeriesList()">
					</s:select>
				</td>
				<td align="right" width="20%">
					��;���ƣ�
				</td>
				<td align="left" width="35%">
					<s:select id="queryUsage" cssStyle="width:182px;height:20px"
						theme="simple" name="clientToSeries.usage.id"
						list="usageList" listKey="id" headerKey="-1"
						headerValue="��ѡ��" listValue="usageName"  onchange="displaySeriesList()">
					</s:select>
				</td>
			</tr>
			<tr>
				<td align="right">
					ϵ�����ƣ�
				</td>
				<td align="left">
					<s:if test=" seriesList.size == 0 ">
						<s:select id="querySeries" cssStyle="width:182px;height:20px"
							theme="simple" name="clientToSeries.series.id"
							list="seriesList" listKey="id" headerKey="-1"
							headerValue="��ѡ��" listValue="seriesName"  disabled="true">
						</s:select>
					</s:if>
					<s:else>
						<s:select id="querySeries" cssStyle="width:182px;height:20px"
							theme="simple" name="clientToSeries.series.id"
							list="seriesList" listKey="id" headerKey="-1"
							headerValue="��ѡ��" listValue="seriesName"  onchange="displayModelList()">
						</s:select>
					</s:else>
				</td>
				<td align="right">
					ҽ�ù��ܷ������ƣ�
				</td>
				<td align="left">
					<s:select id="querySize" cssStyle="width:182px;height:20px"
						theme="simple" name="clientToSeries.size.id"
						list="sizeList" listKey="id" headerKey="-1" 
						headerValue="��ѡ��" listValue="sizeName" onchange="displayModelList()">
					</s:select>
				</td>
			</tr>
			<tr>
				<td align="right">
					��Ʒ���ƣ�
				</td>
				<td align="left">
					<s:if test=" modelList.size == 0 ">
						<s:select id="queryModel" cssStyle="width:182px;height:20px"
							theme="simple" name="clientToSeries.model.id"
							list="modelList" listKey="id" headerKey="-1"
							headerValue="��ѡ��" listValue="modelName"  disabled="true">
						</s:select>
					</s:if>
					<s:else>
						<s:select id="queryModel" cssStyle="width:182px;height:20px"
							theme="simple" name="clientToSeries.model.id"
							list="modelList" listKey="id" headerKey="-1"
							headerValue="��ѡ��" listValue="modelName"  >
						</s:select>
					</s:else>
				</td>
				<td align="right">
					�ͻ���˾��
				</td>
				<td align="left">
					<s:select id="queryClient" cssStyle="width:182px;height:20px"
						theme="simple" name="clientToSeries.client.id"
						list="clientList" listKey="id" headerKey="-1"
						headerValue="��ѡ��" listValue="clientName" >
					</s:select>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<table width="680" height="200" border=1 cellspacing="1" cellpadding="1" align="center" class="inputs" bgcolor=#E0EFFC>
						<tr bgcolor=#E0EFFC >
							<td align="center"  style="height:30px;font-weight:bold;font-client:18px;color:#005AB5 "> 
								�ͻ�-��Ʒϵ����Ȩ����
							</td>
						</tr>
						<tr style="height:25px;">
							<td>
								<div style="WIDTH:680; HEIGHT: 400; BACKGROUND-COLOR: transparent; OVERFLOW: scroll; scrollbar-face-color: #FFFFFF; scrollbar-shadow-color: #D2E5F4; scrollbar-highlight-color: #D2E5F4; scrollbar-3dlight-color: #FFFFFF; scrollbar-darkshadow-color: #FFFFFF; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #D2E5F4">
								<table width="660" border=1>
									<tr>
										<td align="center" width="5%" style="height:8px;font-weight:bold;font-client:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;��&nbsp;��&nbsp;
										</td>
										<td align="center" width="12%" style="height:8px;font-weight:bold;font-client:12px;color:#005AB5 " >
											&nbsp;Ʒ&nbsp;&nbsp;&nbsp;��&nbsp;
										</td>
										<td align="center" width="14%" style="height:8px;font-weight:bold;font-client:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;��&nbsp;&nbsp;&nbsp;;&nbsp;
										</td>
										<td align="center" width="14%" style="height:8px;font-weight:bold;font-client:12px;color:#005AB5 " >
											&nbsp;ϵ&nbsp;&nbsp;&nbsp;��&nbsp;
										</td>
										<td align="center" width="16%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;ҽ�ù��ܷ���&nbsp;
										</td>
										<td align="center" width="20%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;
										</td>
										<td align="center" width="14%" style="height:8px;font-weight:bold;font-client:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;�ͻ���˾&nbsp;
										</td>
										<td align="center" width="5%" style="height:8px;font-weight:bold;font-client:12px;color:#005AB5 " >
											&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;
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
													&nbsp;<img alt="��  ��" src="<%=path%>/treemenu/image/new/edit.gif" onclick="editClientToSeries(<s:property value="id"/>)"/>
													&nbsp;
													&nbsp;<img alt="ɾ  ��" src="<%=path%>/treemenu/image/new/delete.gif" onclick="deleteClientToSeries(<s:property value="id"/>)" />
												</td>
											</tr>
										</s:iterator>
									</s:if>
									<s:else>
										<tr style="height:25px;" >
											<td width="100%" align="right" colspan="8" class="navigator" >
												��ʱû������
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