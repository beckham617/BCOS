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
		<title>�� �� �� �� �� ��</title>

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
							<td align="center" class="fontTitle"> �� �� �� �� �� �� �� �� </td>
						</s:if>
						<s:elseif test="orderList.listType==3">
							<td align="center" class="fontTitle"> �� �� �� �� �� �� �� �� �� �� </td>
						</s:elseif>
					</tr>
					<tr style="height: 10px"><td>&nbsp;</td></tr>
				</table>
	            <table width="100%" border="0" cellpadding="0" cellspacing="0"  >
	            		<tr style="height: 45px">
								<td style="font-size: 15px; " colspan="3">
									&nbsp;&nbsp;-��������Ϣ-
								</td>
								<td style="font-size:12px" align="right" >
									<b>����Ա��</b><s:property  value="opUserName"/>&nbsp;&nbsp;&nbsp;&nbsp;
									<b>��ӡ���ڣ�</b><s:property  value="currentDate"/>&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
							<tr style="height:30px;">
								<td align="center" width=15% class="tds-lefttopright">
									������
								</td>
								<td align="left" width=25% class="tds-topright">
									&nbsp;&nbsp;<s:property  value="orderList.orderListCode"/>
								</td>
								<td align="center" width=20% class="tds-topright">
									�ͻ���˾
								</td>
								<td align="left" width=40% class="tds-topright">
									&nbsp;&nbsp;<s:property  value="orderList.client.clientName"/>
								</td>
							</tr>
							<tr style="height:30px;">
								<td align="center" class="tds-lefttopright">
									¼������
								</td>
								<td align="left" class="tds-topright">
									&nbsp;&nbsp;<s:date name="orderList.orderDate" format="yyyy-MM-dd"/>
								</td>
								<td align="center" class="tds-topright">
									¼����
								</td>
								<td align="left" class="tds-topright">
									&nbsp;&nbsp;<s:property  value="orderList.inputUser.userName"/>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="center" class="tds-lefttopright">
									����״̬
								</td>
								<td align="left" class="tds-topright">
									&nbsp;&nbsp;<s:property  value="orderList.strCheckStatus"/>
								</td>
								<td align="center" class="tds-topright">
									����״̬
								</td>
								<td align="left" class="tds-topright">
									&nbsp;&nbsp;<s:property  value="orderList.strSumStatus"/>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="center" class="tds-lefttopright">
									��������
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
									��ע��Ϣ<br>����100�֣�
								</td>
								<td colspan="3" align="left" valign="middle" class="tds-toprightbottom">
									&nbsp;&nbsp;<s:property  value="orderList.memo"/>
								</td>
							</tr>
							<tr style="height: 45px">
								<td style="font-size: 15px; " colspan="4">
									&nbsp;&nbsp;-������ϸ�б�-
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<table width="100%" border="0" cellpadding="0" cellspacing="0">
										<tr style="height:30px;">
											<td align="center" width="5%" class="ths-lefttopright" >
												&nbsp;��&nbsp;��&nbsp;
											</td>
											<td align="center" width="15%" class="ths-topright" >
												&nbsp;Ʒ&nbsp;&nbsp;&nbsp;��&nbsp;
											</td>
											<td align="center" width="15%" class="ths-topright" >
												&nbsp;��&nbsp;&nbsp;&nbsp;;&nbsp;
											</td>
											<td align="center" width="15%" class="ths-topright" >
												&nbsp;ϵ&nbsp;&nbsp;&nbsp;��&nbsp;
											</td>
											<td align="center" width="15%" class="ths-topright" >
												&nbsp;ҽ�ù��ܷ���&nbsp;
											</td>
											<td align="center" width="25%" class="ths-topright" >
												&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;
											</td>
											<td align="center" width="10%" class="ths-topright" >
												&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;
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
													��ʱû������
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