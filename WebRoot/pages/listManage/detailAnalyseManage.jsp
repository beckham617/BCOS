<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>��Ʒ����������ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
<script language="javascript" src="<%=path%>/pages/js/Calendar1.js"></script>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5" bgcolor="#CAFFFF" >
<s:actionmessage/>
<form name="detailAnalyseManageForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById('detailAnalyseManageForm');

//��ѯ
function queryOrderListDetail(){
	var query_OrderListDetail = document.getElementById('query_OrderListDetail');
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
	var queryModel = document.getElementById('queryModel');
	var queryClient = document.getElementById('queryClient');
	form.action='detailAnalyseManage.action';
	form.submit();
	query_OrderListDetail.disabled = true;
	queryBrand.disabled = true;
	queryUsage.disabled = true;
	querySeries.disabled = true;
	querySize.disabled = true;
	queryModel.disabled = true;
	queryClient.disabled = true;
}


//ͨ��ѡȡ��Ʒ�ơ��롰��;����ɸѡ��ϵ�С�
function displaySeriesList(){
	var query_OrderListDetail = document.getElementById('query_OrderListDetail');
	var queryBrand = document.getElementById('queryBrand');
	var queryUsage = document.getElementById('queryUsage');
	var querySeries = document.getElementById('querySeries');
	var querySize = document.getElementById('querySize');
	var queryModel = document.getElementById('queryModel');
	var queryClient = document.getElementById('queryClient');
	
	//ѡ��Ʒ�ơ�����;��:��һ��Ϊ-1����ϵ�С��ÿ�disable�������ơ��ÿ�disable�����۸��ÿ�
	if(queryBrand.value == -1 || queryUsage.value == -1){
		querySeries.value = -1;
		querySeries.disabled = true;
		queryModel.value = -1;
		queryModel.disabled = true;
		return;
	}else{//ѡ��Ʒ�ơ�����;��:����Ϊ-1ʱ�����ѯ��ϵ�С��б�
		form.action='displaySeriesList4Analyse.action';
		form.submit();
		query_OrderListDetail.disabled = true;
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
	var query_OrderListDetail = document.getElementById('query_OrderListDetail');
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
		form.action='displayModelList4Analyse.action';
		form.submit();
		query_OrderListDetail.disabled = true;
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
				<td colspan="4">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" class="button" name="query_OrderListDetail" value="��  ѯ" onclick="queryOrderListDetail()"></input>&nbsp;
				</td>
			</tr>
			<tr> 
				<td colspan="4">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="4">
					��ѡ���ѯ����������
				</td>
			</tr>
							<tr>
								<td align="right" width="20%">
									����¼�����ڣ���ʼ����
								</td>
								<td align="left" width="25%">
									<input id="sQueryOrderDate" name="orderListDetail.orderList.sOrderDate" type="text" class="box" 
									maxlength="10" size="25" value="<s:date name='orderListDetail.orderList.sOrderDate' format='yyyy-MM-dd' />" readonly >
									<img src="<%=path%>/treemenu/image/new/calendar.gif" width="18" height="18" align="middle" 
									onclick="setday(this,document.getElementById('sQueryOrderDate'))" style="cursor:hand"/>
								</td>
								<td align="right" width="20%">
									����¼�����ڣ���������
								</td>
								<td align="left" width="35%">
									<input id="eQueryOrderDate" name="orderListDetail.orderList.eOrderDate" type="text" class="box" 
									maxlength="10" size="25" value="<s:date name='orderListDetail.orderList.eOrderDate' format='yyyy-MM-dd' />" readonly >
									<img src="<%=path%>/treemenu/image/new/calendar.gif" width="18" height="18" align="middle" 
									onclick="setday(this,document.getElementById('eQueryOrderDate'))" style="cursor:hand"/>
								</td>
							</tr>
							<tr>
								<td align="right"  >
									Ʒ�����ƣ�
								</td>
								<td align="left" >
									<s:select id="queryBrand" cssStyle="width:150px;height:20px"
										theme="simple" name="orderListDetail.brand.id" 
										list="brandList" listKey="id" headerKey="-1" 
										headerValue="��ѡ��" listValue="brandName"  onchange="displaySeriesList()">
									</s:select>
								</td>
								<td align="right" >
									��;���ƣ�
								</td>
								<td align="left" >
									<s:select id="queryUsage" cssStyle="width:150px;height:20px"
										theme="simple" name="orderListDetail.usage.id" 
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
										<s:select id="querySeries" cssStyle="width:150px;height:20px"
											theme="simple" name="orderListDetail.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="seriesName"  disabled="true">
										</s:select>
									</s:if>
									<s:else>
										<s:select id="querySeries" cssStyle="width:150px;height:20px"
											theme="simple" name="orderListDetail.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="seriesName" onchange="displayModelList()" >
										</s:select>
									</s:else>
								</td>
								<td align="right">
									ҽ�ù��ܷ������ƣ�
								</td>
								<td align="left">
									<s:select id="querySize" cssStyle="width:150px;height:20px"
										theme="simple" name="orderListDetail.size.id"
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
										<s:select id="queryModel" cssStyle="width:150px;height:20px"
											theme="simple" name="orderListDetail.model.id"
											list="modelList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="modelName"  disabled="true">
										</s:select>
									</s:if>
									<s:else>
										<s:select id="queryModel" cssStyle="width:150px;height:20px"
											theme="simple" name="orderListDetail.model.id"
											list="modelList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="modelName"  >
										</s:select>
									</s:else>
								</td>
								<td align="right">
									�ͻ���˾��
								</td>
								<td align="left">
									<s:select id="queryClient" cssStyle="width:150px;height:20px"
										theme="simple" name="orderListDetail.orderList.client.id"
										list="clientList" listKey="id" headerKey="-1"
										headerValue="��ѡ��" listValue="clientName" >
									</s:select>
								</td>
							</tr>
						<tr>
				<td colspan="4">
					<table width="100%" height="100%" border=1 cellspacing="1" cellpadding="1" align="left" class="inputs" bgcolor=#E0EFFC>
						<tr bgcolor=#E0EFFC >
							<td align="center"  style="height:30px;font-weight:bold;font-size:18px;color:#005AB5 "> 
								��Ʒ����������ѯ
							</td>
						</tr>
						<tr style="height:25px;">
							<td>
								<div style="HEIGHT: 354; BACKGROUND-COLOR: transparent; OVERFLOW: scroll; scrollbar-face-color: #FFFFFF; scrollbar-shadow-color: #D2E5F4; scrollbar-highlight-color: #D2E5F4; scrollbar-3dlight-color: #FFFFFF; scrollbar-darkshadow-color: #FFFFFF; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #D2E5F4">
								<table width="100%" border=1>
									<tr>
											<td align="center" width="5%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;��&nbsp;��&nbsp;
											</td>
											<td align="center" width="15%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;����¼������&nbsp;
											</td>
											<td align="center" width="10%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;Ʒ&nbsp;&nbsp;&nbsp;��&nbsp;
											</td>
											<td align="center" width="10%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;��&nbsp;&nbsp;&nbsp;;&nbsp;
											</td>
											<td align="center" width="10%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;ϵ&nbsp;&nbsp;&nbsp;��&nbsp;
											</td>
											<td align="center" width="14%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;ҽ�ù��ܷ���&nbsp;
											</td>
											<td align="center" width="18%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;
											</td>
											<td align="center" width="8%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;
											</td>
											<td align="center" width="10%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;�ͻ���˾&nbsp;
											</td>
										</tr>
									<% int i = 0; %>
									<s:if test="detailResultList.size > 0">
											<s:iterator value="detailResultList">
												<% i += 1; %>
												<tr style="height:25px;" >
													<td align="center" class="navigator" bgcolor=#E0EFFC><%=i%></td>
													<td align="center" >
														<s:date name="orderList.orderDate" format="yyyy-MM-dd"/>
													</td>
													<td align="center" bgcolor=#E0EFFC>
														<s:property value="brand.brandName" />
													</td>
													<td align="center" >
														<s:property value="usage.usageName" />
													</td>
													<td align="center" bgcolor=#E0EFFC>
														<s:property value="series.seriesName" />
													</td>
													<td align="center" >
														<s:property value="size.sizeName" />
													</td>
													<td align="center" bgcolor=#E0EFFC>
														<s:property value="model.modelName" />
													</td>
													<td align="right" >
														<s:property value="number" />&nbsp;&nbsp;
													</td>
													<td align="center" bgcolor=#E0EFFC>
														<s:property value="orderList.client.clientName" />
													</td>
											</s:iterator>
										</s:if>
										<s:else>
											<tr style="height:25px;" >
												<td width="100%" align="right" colspan="10" class="navigator" >
													��ʱû������
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