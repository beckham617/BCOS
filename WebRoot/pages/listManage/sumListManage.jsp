<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>汇总订单管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
<script language="javascript" src="<%=path%>/pages/js/Calendar1.js"></script>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5" bgcolor="#CAFFFF" >
<s:actionmessage/>
<form name="sumListManageForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById('sumListManageForm');

//查询
function querySumList(){
	var query_SumList = document.getElementById('query_SumList');
	var sDate = document.getElementById('sQuerySumDate');
	var eDate = document.getElementById('eQuerySumDate');
	if(sDate.value != '' && eDate.value != ''){
		if(!compDate(eDate.value,sDate.value)){
			alert("‘汇总日期（结束）’ 早于 ‘汇总日期（起始）’，请重新输入");
			sDate.focus();
			return false;
		}
	}
	form.action='sumListManage.action';
	form.submit();
	query_SumList.disabled = true;
}

//查看
function viewSumList(obj){
	document.location.href='viewSumList.action?selectId='+obj;
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
	<table style="border:0 solid blue" style="background-color:#CAFFFF" >
			<tr> 
				<td colspan="4">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" class="button" name="query_SumList" value="查  询" onclick="querySumList()"></input>&nbsp;
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
					汇总日期（起始）：
				</td>
				<td align="left" width="25%">
					<input id="sQuerySumDate" name="orderList.sSumDate" type="text" class="box" 
					maxlength="10" size="25" value="<s:date name='orderList.sSumDate' format='yyyy-MM-dd' />" readonly >
					<img src="<%=path%>/treemenu/image/new/calendar.gif" width="18" height="18" align="middle" 
					onclick="setday(this,document.getElementById('sQuerySumDate'))" style="cursor:hand"/>
				</td>
				<td align="right" width="20%">
					汇总日期（结束）：
				</td>
				<td align="left" width="39%">
					<input id="eQuerySumDate" name="orderList.eSumDate" type="text" class="box" 
					maxlength="10" size="25" value="<s:date name='orderList.eSumDate' format='yyyy-MM-dd' />" readonly >
					<img src="<%=path%>/treemenu/image/new/calendar.gif" width="18" height="18" align="middle" 
					onclick="setday(this,document.getElementById('eQuerySumDate'))" style="cursor:hand"/>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<table width="100%" height="100%" border=1 cellspacing="1" cellpadding="1" align="left" class="inputs" bgcolor=#E0EFFC>
						<tr bgcolor=#E0EFFC >
							<td align="center"  style="height:30px;font-weight:bold;font-size:18px;color:#005AB5 "> 
								汇总订单管理
							</td>
						</tr>
						<tr style="height:25px;">
							<td>
								<div style=" HEIGHT: 400; BACKGROUND-COLOR: transparent; OVERFLOW: scroll; scrollbar-face-color: #FFFFFF; scrollbar-shadow-color: #D2E5F4; scrollbar-highlight-color: #D2E5F4; scrollbar-3dlight-color: #FFFFFF; scrollbar-darkshadow-color: #FFFFFF; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #D2E5F4">
								<table width="100%" border=1>
									<tr>
										<td align="center" width="15%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;序&nbsp;号&nbsp;
										</td>
										<td align="center" width="35%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;订&nbsp;单&nbsp;号&nbsp;
										</td>
										<td align="center" width="35%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;汇总日期&nbsp;
										</td>
										<td align="center" width="15%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
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
													<s:date name="sumDate" format="yyyy-MM-dd"/>
												</td>
												<td align="center" >
													<img alt="查看" src="<%=path%>/treemenu/image/new/view.gif" onclick="viewSumList(<s:property value="id"/>)"/> 
												</td>
											</tr>
										</s:iterator>
									</s:if>
									<s:else>
										<tr style="height:25px;" >
											<td width="100%" align="right" colspan="5" class="navigator" >
												暂时没有数据，请输入查询条件进行查询。
											</td>
										</tr>
									</s:else>
									<tr>
										<td colspan="5">
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