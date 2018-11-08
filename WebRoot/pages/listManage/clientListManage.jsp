<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>客户订单管理</title>
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

//查询
function queryOrderList(){
	var query_OrderList = document.getElementById('query_OrderList');
	var add_OrderList = document.getElementById('add_OrderList');
	var sDate = document.getElementById('sQueryOrderDate');
	var eDate = document.getElementById('eQueryOrderDate');
	var checkStatus = document.getElementById('checkStatus');
	if(sDate.value != '' && eDate.value != ''){
		if(!compDate(eDate.value,sDate.value)){
			alert("‘录入日期（结束）’ 早于 ‘录入日期（起始）’，请重新输入");
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

//新增
function addOrderList(){
	form.action='newClientList.action';
	form.submit();
}

//修改
function editOrderList(obj){
	document.location.href='editClientList.action?selectId='+obj;
}

//删除
function deleteOrderList(obj){
	if(confirm("确定删除吗？")==true){
		document.location.href='deleteClientList.action?selectId='+obj;
	}else{
		return;
	}
}

//判断第一个日期是否大于或等于第二个日期(无时间)
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
					<input type="button" class="button" name="query_OrderList" value="查  询" onclick="queryOrderList()"></input>&nbsp;
					<input type="button" class="button" name="add_OrderList" value="新  增" onclick="addOrderList()"></input>&nbsp;
				</td>
			</tr>
			<tr> 
				<td colspan="4">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="4">
					请选择查询过滤条件：
				</td>
			</tr>
			<tr>
				<td align="right" width="16%">
					录入日期（起始）：
				</td>
				<td align="left" width="25%">
					<input id="sQueryOrderDate" name="orderList.sOrderDate" type="text" class="box" 
					maxlength="10" size="25" value="<s:date name='orderList.sOrderDate' format='yyyy-MM-dd' />" readonly >
					<img src="<%=path%>/treemenu/image/new/calendar.gif" width="18" height="18" align="middle" 
					onclick="setday(this,document.getElementById('sQueryOrderDate'))" style="cursor:hand"/>
				</td>
				<td align="right" width="20%">
					录入日期（结束）：
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
					订单类型：
				</td>
				<td align="left">
					<s:select id="listType" cssStyle="width:182px;height:20px"
						theme="simple" name="orderList.listType"
						list="listTypeList" listKey="listType" headerKey="-1"
						headerValue="请选择" listValue="strListType" >
					</s:select>
				</td>
				<td align="right">
					复核状态：
				</td>
				<td align="left">
					<s:select id="checkStatus" cssStyle="width:182px;height:20px"
						theme="simple" name="orderList.checkStatus"
						list="checkStatusList" listKey="checkStatus" headerKey="-1"
						headerValue="请选择" listValue="strCheckStatus" >
					</s:select>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<table width="100%" height="100%" border=1 cellspacing="1" cellpadding="1" align="left" class="inputs" bgcolor=#E0EFFC>
						<tr bgcolor=#E0EFFC >
							<td align="center"  style="height:30px;font-weight:bold;font-size:18px;color:#005AB5 "> 
								客户订单管理
							</td>
						</tr>
						<tr style="height:25px;">
							<td>
								<div style="HEIGHT: 354; BACKGROUND-COLOR: transparent; OVERFLOW: scroll; scrollbar-face-color: #FFFFFF; scrollbar-shadow-color: #D2E5F4; scrollbar-highlight-color: #D2E5F4; scrollbar-3dlight-color: #FFFFFF; scrollbar-darkshadow-color: #FFFFFF; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #D2E5F4">
								<table width="100%" border=1>
									<tr>
										<td align="center" width="6%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;序&nbsp;号&nbsp;
										</td>
										<td align="center" width="28%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;订&nbsp;单&nbsp;号&nbsp;
										</td>
										<td align="center" width="16%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;订单类型&nbsp;
										</td>
										<td align="center" width="16%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;录入日期&nbsp;
										</td>
										<td align="center" width="12%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;录&nbsp;入&nbsp;人&nbsp;
										</td>
										<td align="center" width="12%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;复核状态&nbsp;
										</td>
										<td align="center" width="10%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;操&nbsp;&nbsp;作&nbsp;
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
														&nbsp;<img alt="查  看" src="<%=path%>/treemenu/image/new/view.gif" onclick="editOrderList(<s:property value="id"/>)"/>
													</s:if>
													<s:elseif test="checkStatus == 0">
														&nbsp;<img alt="修  改" src="<%=path%>/treemenu/image/new/edit.gif" onclick="editOrderList(<s:property value="id"/>)"/>
														&nbsp;<img alt="删  除" src="<%=path%>/treemenu/image/new/delete.gif" onclick="deleteOrderList(<s:property value="id"/>)"/>&nbsp;
													</s:elseif>
													
												</td>
											</tr>
										</s:iterator>
									</s:if>
									<s:else>
										<tr style="height:25px;" >
											<td width="100%" align="right" colspan="7" class="navigator" >
												暂时没有数据
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