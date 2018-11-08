<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>汇总订单明细管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5"
		bgcolor="#CAFFFF" >
<s:actionmessage />
<form name="sumListViewForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById('sumListViewForm');

//复核、销复核
function checkAndUncheckClientList(){
	var checkStatus = document.getElementById('orderList.checkStatus'); 
	if(checkStatus.value == 0){
		if(confirm("确定复核吗？")==true){
			form.action='checkAndUncheckClientList.action';
			form.submit();
		}else{
			return;
		}
	}
	if(checkStatus.value == 1){
		if(confirm("确定销复核吗？")==true){
			form.action='checkAndUncheckClientList.action';
			form.submit();
		}else{
			return;
		}
	}
}

//返回查询页面
function goBack(){
	window.location.href='sumListManage.action';
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

			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<table width="600" border=0 cellspacing="1" cellpadding="1"
							align="center" class="inputs">
							<tr bgcolor=#E0EFFC>
								<td align="center" style="height: 30px; font-weight: bold; font-size: 18px; color: #005AB5" colspan="4">
									查看汇总订单明细
								</td>
							</tr>
							<tr>
								<td align="right" colspan="4">
									<input type="button" name="ExpExcel" value="导出Excel文件" onclick="ExpExcel()"></input>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="button" name="cancel" value="返  回" onclick="goBack()"></input>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td style="font-size: 12px; color: #005AB5" colspan="4">
								&nbsp;&nbsp;-主订单信息-
								</td>
							</tr>
							<tr>
								<td align="right" width=15%>
									订单号：
								</td>
								<td align="left" width=25%>
									<input id="orderListCode" name="orderList.orderListCode" type="text" class="box" 
									size="25" value="<s:property value="orderList.orderListCode"/>" readonly >
								</td>
								<td align="right" width=23%>
									汇总日期：
								</td>
								<td align="left" width=37%>
									<input id="sumDate" name="orderList.sumDate" type="text" class="box" 
									size="25" value="<s:date name="orderList.sumDate" format="yyyy-MM-dd"/>" readonly >
									
								</td>
							</tr>
							<tr>
								<td align="right" valign="middle">
									备注信息：<br>（限100字）
								</td>
								<td colspan="3" align="left" valign="middle" >
									<textarea cols="78" rows="3" name="orderList.memo" readonly="readonly" ><s:property  value="orderList.memo"/></textarea>
								</td>
							</tr>
							<tr >
								<td style="font-size: 12px; color: #005AB5" colspan="4">
								&nbsp;&nbsp;-订单明细列表-
								</td>
							</tr>
							<tr style="height:25px;">
								<td colspan="4">
									<div style="WIDTH:680; HEIGHT: 265; BACKGROUND-COLOR: transparent; OVERFLOW: scroll; scrollbar-face-color: #FFFFFF; scrollbar-shadow-color: #D2E5F4; scrollbar-highlight-color: #D2E5F4; scrollbar-3dlight-color: #FFFFFF; scrollbar-darkshadow-color: #FFFFFF; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #D2E5F4">
									<table width="660" border="1">
										<tr>
											<td align="center" width="5%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;序&nbsp;号&nbsp;
											</td>
											<td align="center" width="14%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;品&nbsp;&nbsp;&nbsp;牌&nbsp;
											</td>
											<td align="center" width="14%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;用&nbsp;&nbsp;&nbsp;途&nbsp;
											</td>
											<td align="center" width="14%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;系&nbsp;&nbsp;&nbsp;列&nbsp;
											</td>
											<td align="center" width="14%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;医用功能分类&nbsp;
											</td>
											<td align="center" width="25%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
												&nbsp;名&nbsp;&nbsp;&nbsp;称&nbsp;
											</td>
											<td align="center" width="14%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
												&nbsp;数&nbsp;&nbsp;&nbsp;量&nbsp;
											</td>
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
													<td align="center" >
														<s:property value="model.modelName" />
													</td>
													<td align="right" bgcolor=#E0EFFC>
														<s:property value="number" />&nbsp;&nbsp;
													</td>
												</tr>
											</s:iterator>
										</s:if>
										<s:else>
											<tr style="height:25px;" >
												<td width="100%" align="right" colspan="10" class="navigator" >
													暂时没有数据
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