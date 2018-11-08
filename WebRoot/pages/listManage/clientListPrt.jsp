<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	response.setHeader("Pragma","No-cache");
	response.setHeader("Cache-Control","no-cache");
	response.setDateHeader("Expires", 0);
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>《 客 户 订 单 》</title>

		<style>
			.Debtor-table {  border: 2px #000000 solid; font-size: 14px;}
			.tds-cube {  border-color: black black #000000; border-style: solid; border-top-width: 1px;
							border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px;font-size: 14px;}
			.tds-lefttopright {  border-color: black black #000000; border-style: solid; border-top-width: 1px;
							border-right-width: 1px; border-bottom-width: 0px; border-left-width: 1px;font-size: 14px;}
			.tds-topright {  border-color: black black #000000; border-style: solid; border-top-width: 1px;
							border-right-width: 1px; border-bottom-width: 0px; border-left-width: 0px;font-size: 14px;}
			.tds-rightbottom {  border-color: black black #000000; border-style: solid; border-top-width: 0px;
							border-right-width: 1px; border-bottom-width: 1px; border-left-width: 0px;font-size: 14px;}
			.tds-topbottom {  border-color: black black #000000; border-style: solid; border-top-width: 1px;
							border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px;font-size: 14px;}
			.tds-toprightbottom {  border-color: black black #000000; border-style: solid; border-top-width: 1px;
							border-right-width: 1px; border-bottom-width: 1px; border-left-width: 0px;font-size: 14px;}
			.tds-top {  border-color: black black #000000; border-style: solid; border-top-width: 1px;
						 border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px;font-size: 14px;}
			.tds-bottom {  border-color: black black #000000; border-style: solid; border-top-width: 0px;
						 border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px;font-size: 14px;}
			.tds-right {  border-color: black black black #000000; border-style: solid; border-top-width: 0px; 
						border-right-width: 1px; border-bottom-width: 0px; border-left-width: 0px;font-size: 14px;}
			.ths-lefttopright {  border-color: black black #000000; border-style: solid; border-top-width: 1px;
							border-right-width: 1px; border-bottom-width: 0px; border-left-width: 1px; font-weight:bold;font-size: 14px;}
			.ths-topright {  border-color: black black #000000; border-style: solid; border-top-width: 1px;
							border-right-width: 1px; border-bottom-width: 0px; border-left-width: 0px; font-weight:bold;font-size: 14px;}
			.fontTitle { font-weight: bold; font-size: 16px;}    
			.fontWord { font-size: 11px;}
		</style>
	</head>
	<body>
			<br>
				<div align="right">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<s:if test="orderList.listType==1">
							<td align="center" class="fontTitle"> 《 客 户 配 送 订 单 》 </td>
						</s:if>
						<s:elseif test="orderList.listType==3">
							<td align="center" class="fontTitle"> 《 客 户 集 中 订 货 订 单 》 </td>
						</s:elseif>
					</tr>
					<tr style="height: 10px"><td>&nbsp;</td></tr>
				</table>
	            <table width="100%" border="0" cellpadding="0" cellspacing="0"  >
	            		<tr style="height: 45px">
								<td style="font-size: 15px; " colspan="3">
									&nbsp;&nbsp;-主订单信息-
								</td>
								<td style="font-size:12px" align="right" >
									<b>操作员：</b><s:property  value="opUserName"/>&nbsp;&nbsp;&nbsp;&nbsp;
									<b>打印日期：</b><s:property  value="currentDate"/>&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr style="height:30px;">
								<td align="center" width=15% class="tds-lefttopright">
									订单号
								</td>
								<td align="left" width=25% class="tds-topright">
									&nbsp;&nbsp;<s:property  value="orderList.orderListCode"/>
								</td>
								<td align="center" width=20% class="tds-topright">
									客户公司
								</td>
								<td align="left" width=40% class="tds-topright">
									&nbsp;&nbsp;<s:property  value="orderList.client.clientName"/>
								</td>
							</tr>
							<tr style="height:30px;">
								<td align="center" class="tds-lefttopright">
									录入日期
								</td>
								<td align="left" class="tds-topright">
									&nbsp;&nbsp;<s:date name="orderList.orderDate" format="yyyy-MM-dd"/>
								</td>
								<td align="center" class="tds-topright">
									录入人
								</td>
								<td align="left" class="tds-topright">
									&nbsp;&nbsp;<s:property  value="orderList.inputUser.userName"/>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="center" class="tds-lefttopright">
									复核状态
								</td>
								<td align="left" class="tds-topright">
									&nbsp;&nbsp;<s:property  value="orderList.strCheckStatus"/>
								</td>
								<td align="center" class="tds-topright">
									汇总状态
								</td>
								<td align="left" class="tds-topright">
									&nbsp;&nbsp;<s:property  value="orderList.strSumStatus"/>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="center" class="tds-lefttopright">
									订单类型
								</td>
								<td align="left" class="tds-top">
									&nbsp;&nbsp;<s:property  value="orderList.strListType"/>
								</td>
								<td align="right" class="tds-top">
									&nbsp;
								</td>
								<td align="left" class="tds-topright">
									&nbsp;
								</td>
							</tr>
							<tr style="height: 60px">
								<td align="center" valign="middle" class="tds-cube">
									备注信息<br>（限100字）
								</td>
								<td colspan="3" align="left" valign="middle" class="tds-toprightbottom">
									&nbsp;&nbsp;<s:property  value="orderList.memo"/>
								</td>
							</tr>
							<tr style="height: 45px">
								<td style="font-size: 15px; " colspan="4">
									&nbsp;&nbsp;-订单明细列表-
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr style="height:30px;">
											<td align="center" width="5%" class="ths-lefttopright" >
												&nbsp;序&nbsp;号&nbsp;
											</td>
											<td align="center" width="15%" class="ths-topright" >
												&nbsp;品&nbsp;&nbsp;&nbsp;牌&nbsp;
											</td>
											<td align="center" width="15%" class="ths-topright" >
												&nbsp;用&nbsp;&nbsp;&nbsp;途&nbsp;
											</td>
											<td align="center" width="15%" class="ths-topright" >
												&nbsp;系&nbsp;&nbsp;&nbsp;列&nbsp;
											</td>
											<td align="center" width="15%" class="ths-topright" >
												&nbsp;医用功能分类&nbsp;
											</td>
											<td align="center" width="25%" class="ths-topright" >
												&nbsp;名&nbsp;&nbsp;&nbsp;称&nbsp;
											</td>
											<td align="center" width="10%" class="ths-topright" >
												&nbsp;数&nbsp;&nbsp;&nbsp;量&nbsp;
											</td>
										</tr>
										<% int i = 0; %>
										<s:if test="detailResultList.size > 0">
											<s:iterator value="detailResultList">
												<% i += 1; %>
												<tr style="height:25px;" >
													<td align="center" class="tds-lefttopright" ><%=i%></td>
													<td align="center" class="tds-topright">
														<s:property value="brand.brandName" />
													</td>
													<td align="center" class="tds-topright">
														<s:property value="usage.usageName" />
													</td>
													<td align="center" class="tds-topright">
														<s:property value="series.seriesName" />
													</td>
													<td align="center" class="tds-topright">
														<s:property value="size.sizeName" />
													</td>
													<td align="center" class="tds-topright">
														<s:property value="model.modelName" />
													</td>
													<td align="right" class="tds-topright">
														<s:property value="number" />&nbsp;&nbsp;
													</td>
												</tr>
											</s:iterator>
												<tr style="height:25px;" >
													<td align="center" class="tds-top" >&nbsp;</td>
													<td align="center" class="tds-top">&nbsp;</td>
													<td align="center" class="tds-top">&nbsp;</td>
													<td align="center" class="tds-top">&nbsp;</td>
													<td align="center" class="tds-top">&nbsp;</td>
													<td align="center" class="tds-top">&nbsp;</td>
													<td align="center" class="tds-top">&nbsp;</td>
												</tr>
										</s:if>
										<s:else>
											<tr style="height:25px;" >
												<td width="100%" align="right" colspan="10" class="tds-cube" >
													暂时没有数据
												</td>
											</tr>
										</s:else>
									</table>
								</td>
							</tr>
                </table>
		</div>
	</body>
</html>	