<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>新增客户订单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5"
		bgcolor="#CAFFFF"
		onload="javascript:document.getElementById('orderList.memo').focus()">
<s:actionmessage />
<form name="addClientList">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById("addClientList");
//保存订单，并跳转到明细页面
function saveClientList(){
	var saveBtn = document.getElementById('save_ClientList');
	var cancel = document.getElementById('cancel');
	var listType = document.getElementById('orderList.listType');
	var memo = document.getElementById('orderList.memo');
	if(!(listType.value>0)){
		alert('请选择订单类型！');
		listType.focus();
		return;
	}
	if(memo.value.length>200){
		alert('备注信息仅限100个汉字！')
		memo.focus();
		return;
	}
	if(confirm("主订单信息生成后则不可修改，确定生成订单吗？")==true){
		form.action='saveClientList.action';
		form.submit();
		saveBtn.disabled = true;
		cancel.disabled = true;
	}else{
		return;
	}
}
//返回查询页面
function goBack(){
	window.location.href='clientListManage.action';
}
</script>
<input type="hidden" name="orderList.id" value="<s:property value="orderList.id"/>" />
<input type="hidden" name="orderList.deleted" value="<s:property value="orderList.deleted"/>" />
<input type="hidden" name="orderList.checkStatus" value="<s:property value="orderList.checkStatus"/>" />
<input type="hidden" name="orderList.sumStatus" value="<s:property value="orderList.sumStatus"/>" />
<input type="hidden" name="orderList.client.id" value="<s:property value="orderList.client.id"/>" />
<input type="hidden" name="orderList.inputUser.id" value="<s:property value="orderList.inputUser.id"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<input type="button" name="save_ClientList" value="保  存"
							onclick="saveClientList()"></input>
						&nbsp;
						<input type="button" name="cancel" value="取  消" onclick="goBack()"></input>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<table width="600" border="0" cellspacing="1" cellpadding="1"
							align="center" class="inputs">
							<tr bgcolor=#E0EFFC>
								<td align="center" colspan="4" style="height: 30px; font-weight: bold; font-size: 18px; color: #005AB5">
									新增客户订单
								</td>
							</tr>
							<tr>
								<td align="right" width="25%">
									订单号：
								</td>
								<td align="left" width="25%">
									<input id="orderListCode" name="orderList.orderListCode" type="text" class="box" 
									size="25" value="<s:property  value="orderList.orderListCode"/>" readonly >
								</td>
								<td align="right" width="20%">
									客户公司：
								</td>
								<td align="left" width="30%">
									<input id="clientName" name="orderList.client.clientName" type="text" class="box" 
									size="25" value="<s:property  value="orderList.client.clientName"/>" readonly >
								</td>
							</tr>
							<tr>
								<td align="right" >
									录入日期：
								</td>
								<td align="left" >
									<input id="orderDate" name="orderList.orderDate" type="text" class="box" 
									size="25" value="<s:date name="orderList.orderDate" format="yyyy-MM-dd"/>" readonly >
									
								</td>
								<td align="right" >
									录入人：
								</td>
								<td align="left" >
									<input id="userName" name="orderList.inputUser.userName" type="text" class="box" 
									size="25" value="<s:property  value="orderList.inputUser.userName"/>" readonly >
								</td>
							</tr>
							<tr>
								<td align="right">
									订单类型：<font color="red">*</font>
								</td>
								<td align="left">
									<s:select id="listType" cssStyle="width:182px;height:20px"
										theme="simple" name="orderList.listType"
										list="listTypeList" listKey="listType" headerKey="-1"
										headerValue="请选择" listValue="strListType" >
									</s:select>
								</td>
								<td></td><td></td>
							</tr>
							<tr style="height: 30px">
								<td align="right" valign="middle" >
									备注信息：<br>（限100字）
								</td>
								<td colspan="3" align="left" valign="middle" >
									<textarea cols="78" rows="3" name="orderList.memo">${orderList.memo}</textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>