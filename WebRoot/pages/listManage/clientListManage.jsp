<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>�ͻ���������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
<script language="javascript" src="<%=path%>/pages/js/Calendar1.js"></script>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5" style="background-image:url(<%=path%>/image/GrassinA.jpg);background-repeat:no-repeat;" >
<s:actionmessage/>
<form name="orderListManageForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById('orderListManageForm');

//��ѯ
function queryOrderList(){
	var query_OrderList = document.getElementById('query_OrderList');
	var add_OrderList = document.getElementById('add_OrderList');
	var sDate = document.getElementById('sQueryOrderDate');
	var eDate = document.getElementById('eQueryOrderDate');
	var checkStatus = document.getElementById('checkStatus');
	if(sDate.value != '' && eDate.value != ''){
		if(!compDate(eDate.value,sDate.value)){
			alert("��¼�����ڣ��������� ���� ��¼�����ڣ���ʼ����������������");
			sDate.focus();
			return false;
		}
	}
	form.action='clientListManage.action';
	form.submit();
	query_OrderList.disabled = true;
	add_OrderList.disabled = true;
	checkStatus.disabled = true;
}

//����
function addOrderList(){
	form.action='newClientList.action';
	form.submit();
}

//�޸�
function editOrderList(obj){
	document.location.href='editClientList.action?selectId='+obj;
}

//ɾ��
function deleteOrderList(obj){
	if(confirm("ȷ��ɾ����")==true){
		document.location.href='deleteClientList.action?selectId='+obj;
	}else{
		return;
	}
}

//�жϵ�һ�������Ƿ���ڻ���ڵڶ�������(��ʱ��)
function compDate(DateOne, DateTwo) {
	var OneMonth = DateOne.substring(5, DateOne.lastIndexOf("-"));
	var OneDay = DateOne.substring(DateOne.length, DateOne.lastIndexOf("-") + 1);
	var OneYear = DateOne.substring(0, DateOne.indexOf("-"));
	var TwoMonth = DateTwo.substring(5, DateTwo.lastIndexOf("-"));
	var TwoDay = DateTwo.substring(DateTwo.length, DateTwo.lastIndexOf("-") + 1);
	var TwoYear = DateTwo.substring(0, DateTwo.indexOf("-"));
	if (Date.parse(OneMonth + "-" + OneDay + "-" + OneYear) >= Date.parse(TwoMonth + "-" + TwoDay + "-" + TwoYear)) {
		return true;
	} else {
		return false;
	}
}
</script>
<input type="hidden" name="orderList.client.id" value="<s:property value="orderList.client.id"/>" />
	<table style="border:0 solid blue" >
			<tr> 
				<td colspan="4">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" class="button" name="query_OrderList" value="��  ѯ" onclick="queryOrderList()"></input>&nbsp;
					<input type="button" class="button" name="add_OrderList" value="��  ��" onclick="addOrderList()"></input>&nbsp;
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
				<td align="right" width="16%">
					¼�����ڣ���ʼ����
				</td>
				<td align="left" width="25%">
					<input id="sQueryOrderDate" name="orderList.sOrderDate" type="text" class="box" 
					maxlength="10" size="25" value="<s:date name='orderList.sOrderDate' format='yyyy-MM-dd' />" readonly >
					<img src="<%=path%>/treemenu/image/new/calendar.gif" width="18" height="18" align="middle" 
					onclick="setday(this,document.getElementById('sQueryOrderDate'))" style="cursor:hand"/>
				</td>
				<td align="right" width="20%">
					¼�����ڣ���������
				</td>
				<td align="left" width="39%">
					<input id="eQueryOrderDate" name="orderList.eOrderDate" type="text" class="box" 
					maxlength="10" size="25" value="<s:date name='orderList.eOrderDate' format='yyyy-MM-dd' />" readonly >
					<img src="<%=path%>/treemenu/image/new/calendar.gif" width="18" height="18" align="middle" 
					onclick="setday(this,document.getElementById('eQueryOrderDate'))" style="cursor:hand"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					�������ͣ�
				</td>
				<td align="left">
					<s:select id="listType" cssStyle="width:182px;height:20px"
						theme="simple" name="orderList.listType"
						list="listTypeList" listKey="listType" headerKey="-1"
						headerValue="��ѡ��" listValue="strListType" >
					</s:select>
				</td>
				<td align="right">
					����״̬��
				</td>
				<td align="left">
					<s:select id="checkStatus" cssStyle="width:182px;height:20px"
						theme="simple" name="orderList.checkStatus"
						list="checkStatusList" listKey="checkStatus" headerKey="-1"
						headerValue="��ѡ��" listValue="strCheckStatus" >
					</s:select>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<table width="100%" height="100%" border=1 cellspacing="1" cellpadding="1" align="left" class="inputs" bgcolor=#E0EFFC>
						<tr bgcolor=#E0EFFC >
							<td align="center"  style="height:30px;font-weight:bold;font-size:18px;color:#005AB5 "> 
								�ͻ���������
							</td>
						</tr>
						<tr style="height:25px;">
							<td>
								<div style="HEIGHT: 354; BACKGROUND-COLOR: transparent; OVERFLOW: scroll; scrollbar-face-color: #FFFFFF; scrollbar-shadow-color: #D2E5F4; scrollbar-highlight-color: #D2E5F4; scrollbar-3dlight-color: #FFFFFF; scrollbar-darkshadow-color: #FFFFFF; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #D2E5F4">
								<table width="100%" border=1>
									<tr>
										<td align="center" width="6%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;��&nbsp;��&nbsp;
										</td>
										<td align="center" width="28%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;��&nbsp;��&nbsp;��&nbsp;
										</td>
										<td align="center" width="16%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;��������&nbsp;
										</td>
										<td align="center" width="16%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;¼������&nbsp;
										</td>
										<td align="center" width="12%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;¼&nbsp;��&nbsp;��&nbsp;
										</td>
										<td align="center" width="12%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;����״̬&nbsp;
										</td>
										<td align="center" width="10%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;��&nbsp;&nbsp;��&nbsp;
										</td>
									</tr>
									<% int i = 0; %>
									<s:if test="resultList.size > 0">
										<s:iterator value="resultList">
											<% i += 1; %>
											<tr style="height:25px;" >
												<td align="center" class="navigator" bgcolor=#E0EFFC><%=i%></td>
												<td align="center" >
													<s:property value="orderListCode" />
												</td>
												<td align="center" bgcolor=#E0EFFC>
													<s:property value="strListType" />
												</td>
												<td align="center" >
													<s:date name="orderDate" format="yyyy-MM-dd"/>
												</td>
												<td align="center" bgcolor=#E0EFFC>
													<s:property value="inputUser.userName" />
												</td>
												<td align="center" >
													<s:property value="strCheckStatus" />
												</td>
												
												<td align=center nowrap bgcolor=#E0EFFC>
													<s:if test="checkStatus == 1">
														&nbsp;<img alt="��  ��" src="<%=path%>/treemenu/image/new/view.gif" onclick="editOrderList(<s:property value="id"/>)"/>
													</s:if>
													<s:elseif test="checkStatus == 0">
														&nbsp;<img alt="��  ��" src="<%=path%>/treemenu/image/new/edit.gif" onclick="editOrderList(<s:property value="id"/>)"/>
														&nbsp;<img alt="ɾ  ��" src="<%=path%>/treemenu/image/new/delete.gif" onclick="deleteOrderList(<s:property value="id"/>)"/>&nbsp;
													</s:elseif>
													
												</td>
											</tr>
										</s:iterator>
									</s:if>
									<s:else>
										<tr style="height:25px;" >
											<td width="100%" align="right" colspan="7" class="navigator" >
												��ʱû������
											</td>
										</tr>
									</s:else>
									<tr>
										<td colspan="7">
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