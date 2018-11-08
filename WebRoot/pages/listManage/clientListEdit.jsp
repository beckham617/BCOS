<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>�ͻ�������ϸ����</title>
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
	
	//�ս���ҳ�棬������Ʒ����
	if(queryBrand.value<0){
		queryBrand.focus();
		return;
	}
	//ѡ��Ʒ�ƺ���;��ˢ��ҳ�棬������ϵ����
	if(queryBrand.value>0 && queryUsage.value>0 && querySeries.value<0){
		if(querySeries.disabled==false){
			querySeries.focus();
		}else{
			queryBrand.focus();
		}
		return;
	}
	//ѡ��ϵ�к�ҽ�ù��ܷ��࣬ˢ��ҳ�棬������������
	if(querySeries.value>0 && querySize.value>0 && queryModel.value<0){
		if(queryModel.disabled==false){
			queryModel.focus();
		}else{
			querySeries.focus();
		}
		return;
	}
	//ѡ�����ƣ�ˢ��ҳ�棬������������
	if(queryModel.value>0){
		number.focus();
		return;
	}
	
}
//����
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
	if(!(queryModel.value>0)){
		alert('��ѡ���Ʒ���ƣ�');
		queryModel.focus();
		return;
	}
    if(number.value.search("^[0-9]*[1-9][0-9]*$")!=0)
    {
    	alert('����ֻ��������������');
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

//���ز�ѯҳ��
function goBack(){
	window.location.href='clientListManage.action';
}

//ͨ��ѡȡ��Ʒ�ơ��롰��;����ɸѡ��ϵ�С�
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
	
	//ѡ��Ʒ�ơ�����;��:��һ��Ϊ-1����ϵ�С��ÿ�disable�������ơ��ÿ�disable�����۸��ÿ�
	if(queryBrand.value == -1 || queryUsage.value == -1){
		querySeries.value = -1;
		querySeries.disabled = true;
		queryModel.value = -1;
		queryModel.disabled = true;
		return;
	}else{//ѡ��Ʒ�ơ�����;��:����Ϊ-1ʱ�����ѯ��ϵ�С��б�
		//�����ǰ����������������ҪУ��
		if(number.value!="" && number.value!=0){
			if(number.value.search("^[0-9]*[1-9][0-9]*$")!=0)
	    	{
	    		alert('����ֻ��������������');
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

//ͨ��ѡȡ��ϵ�С��롰ҽ�ù��ܷ��ࡱ��ɸѡ�����ơ�
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
	
	//ѡ��ϵ�С���ҽ�ù��ܷ��ࡱ:��һ��Ϊ-1�������ơ��ÿ�disable�����۸��ÿ�
	if(querySeries.value == -1 || querySize.value == -1){
		queryModel.value = -1;
		queryModel.disabled = true;
		return;
	}else{//ѡ��ϵ�С���ҽ�ù��ܷ��ࡱ:����Ϊ-1ʱ�����ѯ�����ơ��б�
		//�����ǰ����������������ҪУ��
		if(number.value!="" && number.value!=0){
			if(number.value.search("^[0-9]*[1-9][0-9]*$")!=0)
	    	{
	    		alert('����ֻ��������������');
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


//ɾ��
function deleteDetail(obj){
	var selectDetailId = document.getElementById('selectDetailId');
	var checkStatus = document.getElementById('orderList.checkStatus'); 
	if(checkStatus.value == 1){
		alert("�Ѹ��϶��������޸���ϸ��");
		return;
	}
	selectDetailId.value = obj;
	if(confirm("ȷ��ɾ����")==true){
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
			alert("��������ȷ������");
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
									�ͻ�������ϸ����
								</td>
							</tr>
							<tr>
								<td style="font-size: 12px; color: #005AB5" colspan="4">
								&nbsp;&nbsp;-��������Ϣ-
								</td>
							</tr>
							<tr>
								<td align="right" width=15%>
									�����ţ�
								</td>
								<td align="left" width=25%>
									<input id="orderListCode" name="orderList.orderListCode" type="text" class="box" 
									size="25" value="<s:property  value="orderList.orderListCode"/>" readonly >
								</td>
								<td align="right" width=20%>
									�ͻ���˾��
								</td>
								<td align="left" width=40%>
									<input id="clientName" name="orderList.client.clientName" type="text" class="box" 
									size="25" value="<s:property  value="orderList.client.clientName"/>" readonly >
								</td>
							</tr>
							<tr>
								<td align="right">
									¼�����ڣ�
								</td>
								<td align="left">
									<input id="orderDate" name="orderList.orderDate" type="text" class="box" 
									size="25" value="<s:date name="orderList.orderDate" format="yyyy-MM-dd"/>" readonly >
									
								</td>
								<td align="right">
									¼���ˣ�
								</td>
								<td align="left">
									<input id="userName" name="orderList.inputUser.userName" type="text" class="box" 
									size="25" value="<s:property  value="orderList.inputUser.userName"/>" readonly >
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right">
									����״̬��
								</td>
								<td align="left">
									<input id="checkStatus" name="orderList.strCheckStatus" type="text" class="box" 
									size="25" value="<s:property  value="orderList.strCheckStatus"/>" readonly >
								</td>
								<td align="right">
									�������ͣ�
								</td>
								<td align="left">
									<input id="listType" name="orderList.strListType" type="text" class="box" 
									size="25" value="<s:property  value="orderList.strListType"/>" readonly >
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right" valign="middle">
									��ע��Ϣ��<br>����100�֣�
								</td>
								<td colspan="3" align="left" valign="middle" >
									<textarea cols="78" rows="3" name="orderList.memo" readonly="readonly" ><s:property  value="orderList.memo"/></textarea>
								</td>
							</tr>
							<s:if test="orderList.checkStatus == 0"><!-- δ����״̬ -->
							<tr>
								<td style="font-size: 12px; color: #005AB5" colspan="4">
								&nbsp;&nbsp;-����������ϸ-
								</td>
							</tr>
							<tr>
								<td align="right">
									Ʒ�����ƣ�<font color="red">*</font>
								</td>
								<td align="left">
									<s:select id="queryBrand" cssStyle="width:182px;height:20px"
										theme="simple" name="orderListDetail.brand.id" 
										list="brandList" listKey="id" headerKey="-1" 
										headerValue="��ѡ��" listValue="brandName"  onchange="displaySeriesList()">
									</s:select>
								</td>
								<td align="right">
									��;���ƣ�<font color="red">*</font>
								</td>
								<td align="left">
									<s:select id="queryUsage" cssStyle="width:182px;height:20px"
										theme="simple" name="orderListDetail.usage.id" 
										list="usageList" listKey="id" headerKey="-1" 
										headerValue="��ѡ��" listValue="usageName"  onchange="displaySeriesList()">
									</s:select>
								</td>
							</tr>
							<tr>
								<td align="right">
									ϵ�����ƣ�<font color="red">*</font>
								</td>
								<td align="left">
									<s:if test=" seriesList.size == 0 ">
										<s:select id="querySeries" cssStyle="width:182px;height:20px"
											theme="simple" name="orderListDetail.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="seriesName"  disabled="true">
										</s:select>
									</s:if>
									<s:else>
										<s:select id="querySeries" cssStyle="width:182px;height:20px"
											theme="simple" name="orderListDetail.series.id"
											list="seriesList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="seriesName" onchange="displayModelList()" >
										</s:select>
									</s:else>
								</td>
								<td align="right">
									ҽ�ù��ܷ������ƣ�<font color="red">*</font>
								</td>
								<td align="left">
									<s:select id="querySize" cssStyle="width:182px;height:20px"
										theme="simple" name="orderListDetail.size.id"
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
										<s:select id="queryModel" cssStyle="width:182px;height:20px"
											theme="simple" name="orderListDetail.model.id"
											list="modelList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="modelName"  disabled="true">
										</s:select>
									</s:if>
									<s:else>
										<s:select id="queryModel" cssStyle="width:182px;height:20px"
											theme="simple" name="orderListDetail.model.id"
											list="modelList" listKey="id" headerKey="-1"
											headerValue="��ѡ��" listValue="modelName" >
										</s:select>
									</s:else>
								</td>
								<td align="right">
									������<font color="red">*</font>
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
										<input type="button" name="save_Detail" value="��  ��"
											onclick="saveDetail()"></input>
									</s:if>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" name="cancel" value="��  ��" onclick="goBack()"></input>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr >
								<td style="font-size: 12px; color: #005AB5" colspan="4">
								&nbsp;&nbsp;-������ϸ�б�-
								</td>
							</tr>
							<tr style="height:25px;">
								<td colspan="4">
									<div style="WIDTH:680; HEIGHT: 265; BACKGROUND-COLOR: transparent; OVERFLOW: scroll; scrollbar-face-color: #FFFFFF; scrollbar-shadow-color: #D2E5F4; scrollbar-highlight-color: #D2E5F4; scrollbar-3dlight-color: #FFFFFF; scrollbar-darkshadow-color: #FFFFFF; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #D2E5F4">
									<table width="660" border="1">
										<tr>
											<td align="center" width="5%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;��&nbsp;��&nbsp;
											</td>
											<td align="center" width="12%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;Ʒ&nbsp;&nbsp;&nbsp;��&nbsp;
											</td>
											<td align="center" width="12%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;��&nbsp;&nbsp;&nbsp;;&nbsp;
											</td>
											<td align="center" width="12%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;ϵ&nbsp;&nbsp;&nbsp;��&nbsp;
											</td>
											<td align="center" width="16%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;ҽ�ù��ܷ���&nbsp;
											</td>
											<td align="center" width="30%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;
											</td>
											<td align="center" width="8%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 "  bgcolor=#E0EFFC>
												&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;
											</td>
											<s:if test="orderList.checkStatus == 0">
											<td align="center" width="5%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;
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
														<img alt="ɾ  ��" src="<%=path%>/treemenu/image/new/delete.gif" onclick="deleteDetail(<s:property value="id"/>)" />
													</td>
													</s:if>
												</tr>
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