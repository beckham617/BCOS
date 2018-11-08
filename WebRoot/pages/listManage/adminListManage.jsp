<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>管理员订单管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
<script language="javascript" src="<%=path%>/pages/js/Calendar1.js"></script>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5" style="background-image:url(<%=path%>/image/GrassinA.jpg);background-repeat:no-repeat;" >
<s:actionmessage/>
<form name="adminListManageForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById('adminListManageForm');

//查询
function queryOrderList(){
	var query_OrderList = document.getElementById('query_OrderList');
	var add_OrderList = document.getElementById('add_OrderList');
	var sDate = document.getElementById('sQueryOrderDate');
	var eDate = document.getElementById('eQueryOrderDate');
	var checkStatus = document.getElementById('checkStatus');
	var queryClient = document.getElementById('queryClient');
	var sumStatus = document.getElementById('sumStatus');
	if(sDate.value != '' && eDate.value != ''){
		if(!compDate(eDate.value,sDate.value)){
			alert("‘录入日期（结束）’ 早于 ‘录入日期（起始）’，请重新输入");
			sDate.focus();
			return false;
		}
	}
	form.action='queryAdminList.action';
	form.submit();
	query_OrderList.disabled = true;
	add_OrderList.disabled = true;
	checkStatus.disabled = true;
	queryClient.disabled = true;
	sumStatus.disabled = true;
}

//汇总
function sumOrderList(){
	var strCheckedIds = document.getElementById("strCheckedIds");
	var chks = document.getElementsByName("chk");
	var strChk = "";
		for(var i=0;i<chks.length;i++){
			if(chks[i].checked == true){
				strChk = strChk + "," + chks[i].value;
			}
		}
		strChk = strChk.substring(1,strChk.length);
		if(strChk==""){
			alert('请选择要汇总的记录！');
			return;
		}
		strCheckedIds.value = strChk;
		if(confirm("确定汇总客户订单吗？")==true){
			form.action='sumClientList.action';
			form.submit();
		}else{
			return;
		}
		
		
}

//查看
function viewOrderList(obj){
	document.location.href='viewClientList.action?selectId='+obj;
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

//全选、反选
function selectAll(){
	var chk_all = document.getElementById("chk_all");
	var chk_child = document.getElementsByName("chk");
	if(chk_all.checked == false){
		for(var i=0;i<chk_child.length;i++){
			chk_child[i].checked = false;
		}
	}else if(chk_all.checked == true){
		for(var i=0;i<chk_child.length;i++){
			chk_child[i].checked = true;
		}
	}
}

</script>
<input type="hidden" name="strCheckedIds" value="<s:property value="strCheckedIds"/>" />
	<table style="border:0 solid blue"  >
			<tr> 
				<td colspan="4">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" class="button" name="query_OrderList" value="查  询" onclick="queryOrderList()"></input>&nbsp;
					<input type="button" class="button" name="add_OrderList" value="汇  总" onclick="sumOrderList()"></input>&nbsp;
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
					maxlength="10" size="25" value="<s:date name='orderList.sOrderDate' format='yyyy-MM-dd' />" readonly />
					<img alt="录入日期（起始）" src="<%=path%>/treemenu/image/new/calendar.gif" width="18" height="18" align="middle" 
					onclick="setday(this,document.getElementById('sQueryOrderDate'))" style="cursor:hand"/>
				</td>
				<td align="right" width="20%">
					录入日期（结束）：
				</td>
				<td align="left" width="39%">
					<input id="eQueryOrderDate" name="orderList.eOrderDate" type="text" class="box" 
					maxlength="10" size="25" value="<s:date name='orderList.eOrderDate' format='yyyy-MM-dd' />" readonly />
					<img alt="录入日期（结束）" src="<%=path%>/treemenu/image/new/calendar.gif" width="18" height="18" align="middle" 
					onclick="setday(this,document.getElementById('eQueryOrderDate'))" style="cursor:hand"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					客户公司：
				</td>
				<td align="left">
					<s:select id="queryClient" cssStyle="width:182px;height:20px"
						theme="simple" name="orderList.client.id"
						list="clientList" listKey="id" headerKey="-1"
						headerValue="请选择" listValue="clientName" >
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
				<td align="right" >
					汇总日期：
				</td>
				<td align="left" >
					<input id="sumDate" name="orderList.sumDate" type="text" class="box" 
					maxlength="10" size="25" value="<s:date name='orderList.sumDate' format='yyyy-MM-dd' />" readonly />
					<img alt="汇总日期" src="<%=path%>/treemenu/image/new/calendar.gif" width="18" height="18" align="middle" 
					onclick="setday(this,document.getElementById('sumDate'))" style="cursor:hand"/>
				</td>
				<td align="right" >
					汇总状态：
				</td>
				<td align="left">
					<s:select id="sumStatus" cssStyle="width:182px;height:20px"
						theme="simple" name="orderList.sumStatus"
						list="sumStatusList" listKey="sumStatus" headerKey="-1"
						headerValue="请选择" listValue="strSumStatus" >
					</s:select>
				</td>
			</tr>
			<tr>
				<td align="right" >
					订单类型：
				</td>
				<td align="left">
					<s:select id="listType" cssStyle="width:182px;height:20px"
						theme="simple" name="orderList.listType"
						list="listTypeList" listKey="listType" headerKey="-1"
						headerValue="请选择" listValue="strListType" >
					</s:select>
				</td>
				<td align="right" >
					&nbsp;
				</td>
				<td align="left">
					&nbsp;
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
								<div style=" HEIGHT: 371; BACKGROUND-COLOR: transparent; OVERFLOW: scroll; scrollbar-face-color: #FFFFFF; scrollbar-shadow-color: #D2E5F4; scrollbar-highlight-color: #D2E5F4; scrollbar-3dlight-color: #FFFFFF; scrollbar-darkshadow-color: #FFFFFF; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #D2E5F4">
								<table width="100%" border=1>
									<tr>
										<td align="center" width="3%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;序&nbsp;号&nbsp;
										</td>
										<td align="center" width="4%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											<input id="chk_all" name="chk_all" type="checkbox" onclick="selectAll()" />
										</td>
										<td align="center" width="11%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;订&nbsp;单&nbsp;号&nbsp;
										</td>
										<td align="center" width="11%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;订单类型&nbsp;
										</td>
										<td align="center" width="11%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;录入日期&nbsp;
										</td>
										<td align="center" width="11%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;客户公司&nbsp;
										</td>
										<td align="center" width="11%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;录&nbsp;入&nbsp;人&nbsp;
										</td>
										<td align="center" width="11%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;复核状态&nbsp;
										</td>
										<td align="center" width="11%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;汇总状态&nbsp;
										</td>
										<td align="center" width="11%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;汇总日期&nbsp;
										</td>
										<td align="center" width="5%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;操&nbsp;&nbsp;作&nbsp;
										</td>
									</tr>
									<% int i = 0; %>
									<s:if test="resultList.size > 0">
										<s:iterator value="resultList">
											<% i += 1; %>
											<tr style="height:25px;" >
												<td align="center" class="navigator" bgcolor=#E0EFFC><%=i%></td>
												<td align="center" class="navigator" >
													<s:if test=" checkStatus==1 && sumStatus==0 ">
														<input id="chk" name="chk" type="checkbox" 
														value="<s:property value="id"/>" />
													</s:if>
													<s:else>
														&nbsp;
													</s:else>
												</td>
												<td align="center" bgcolor=#E0EFFC>
													<s:property value="orderListCode" />
												</td>
												<td align="center" >
													<s:property value="strListType" />
												</td>
												<td align="center" bgcolor=#E0EFFC>
													<s:date name="orderDate" format="yyyy-MM-dd"/>
												</td>
												<td align="center" >
													<s:property value="client.clientName" />
												</td>
												<td align="center" bgcolor=#E0EFFC>
													<s:property value="inputUser.userName" />
												</td>
												<td align="center" >
													<s:property value="strCheckStatus" />
												</td>
												<td align="center" bgcolor=#E0EFFC>
													<s:property value="strSumStatus" />
												</td>
												<td align="center"  >
													<s:if test="sumDate!=null">
														<s:date name="sumDate" format="yyyy-MM-dd"/>
													</s:if>
													<s:else>
														无
													</s:else>
												</td>
												<td align="center" bgcolor=#E0EFFC>
													<img alt="查看/复核" src="<%=path%>/treemenu/image/new/view.gif" onclick="viewOrderList(<s:property value="id"/>)"/> 
												</td>
											</tr>
										</s:iterator>
									</s:if>
									<s:else>
										<tr style="height:25px;" >
											<td width="100%" align="right" colspan="11" class="navigator" >
												暂时没有数据，请输入查询条件进行查询。
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