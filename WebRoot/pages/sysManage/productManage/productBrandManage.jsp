<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>��ƷƷ�ƹ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5" bgcolor="#CAFFFF" >
<s:actionmessage/>
<form name="brandManageForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById('brandManageForm');
//��ѯ
function queryBrand(){
	var query_Brand = document.getElementById('query_Brand');
	var add_Brand = document.getElementById('add_Brand');
	form.action='productBrandManage.action';
	form.submit();
	query_Brand.disabled=true;
	add_Brand.disabled=true;
}

//����
function addBrand(){
	form.action='addBrand.action';
	form.submit();
}

//�޸�
function editBrand(obj){
	document.location.href='editBrand.action?selectId='+obj;
}

//ɾ��
function deleteBrand(obj){
	if(confirm("ȷ��ɾ����")==true){
		document.location.href='deleteBrand.action?selectId='+obj;
	}else{
		return;
	}
}
</script>
	<table style="border:0 solid blue" style="background-color:#CAFFFF" >
			<tr> 
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="button" name="query_Brand" value="��  ѯ" onclick="queryBrand()"></input>&nbsp;
					<input type="button" class="button" name="add_Brand" value="��  ��" onclick="addBrand()"></input>&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<table width="600" height="200" border=1 cellspacing="1" cellpadding="1" align="center" class="inputs" bgcolor=#E0EFFC>
						<tr bgcolor=#E0EFFC >
							<td align="center"  style="height:30px;font-weight:bold;font-size:18px;color:#005AB5 "> 
								��ƷƷ�ƹ���
							</td>
						</tr>
						<tr style="height:25px;">
							<td>
								<div style="WIDTH:620; HEIGHT: 400; BACKGROUND-COLOR: transparent; OVERFLOW: scroll; scrollbar-face-color: #FFFFFF; scrollbar-shadow-color: #D2E5F4; scrollbar-highlight-color: #D2E5F4; scrollbar-3dlight-color: #FFFFFF; scrollbar-darkshadow-color: #FFFFFF; scrollbar-track-color: #FFFFFF; scrollbar-arrow-color: #D2E5F4">
								<table width="600" border=1>
									<tr>
										<td align="center" width="5%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;��&nbsp;��&nbsp;
										</td>
										<td align="center" width="80%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;Ʒ&nbsp;&nbsp;&nbsp;��&nbsp;
										</td>
										<td align="center" width="15%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;
										</td>
									</tr>
									<% int i = 0; %>
									<s:if test="resultList.size > 0">
									<s:iterator value="resultList">
										<% i += 1; %>
										<tr style="height:25px;" >
											<td width="5%" align="center" class="navigator" bgcolor=#E0EFFC><%=i%></td>
											<td width="80%" align="center" >
												<s:property value="brandName" />
											</td>
											<td width="15%" align=center border=0 nowrap bgcolor=#E0EFFC>
												&nbsp;<img alt="��  ��" src="<%=path%>/treemenu/image/new/edit.gif" onclick="editBrand(<s:property value="id"/>)"/>
												&nbsp;
												&nbsp;<img alt="ɾ  ��" src="<%=path%>/treemenu/image/new/delete.gif" onclick="deleteBrand(<s:property value="id"/>)" />
											</td>
										</tr>
									</s:iterator>
									</s:if>
									<s:else>
										<tr style="height:25px;" >
											<td width="100%" align="right" colspan="3" class="navigator" >
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