<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<title>��Ʒϵ�й���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5" bgcolor="#CAFFFF" >
<s:actionmessage/>
<form name="userManageForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById('userManageForm');
//��ѯ
function queryUser(){
	var query_User = document.getElementById('query_User');
	var add_User = document.getElementById('add_User');
	form.action='userManage.action';
	form.submit();
	query_User.disabled=true;
	add_User.disabled=true;
}

//����
function addUser(){
	form.action='addUser.action';
	form.submit();
}

//�޸�
function editUser(obj){
	document.location.href='editUser.action?selectId='+obj;
}

//ɾ��
function deleteUser(obj){
	if(confirm("ȷ��ɾ����")==true){
		document.location.href='deleteUser.action?selectId='+obj;
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
					<input type="button" class="button" name="query_User" value="��  ѯ" onclick="queryUser()"></input>&nbsp;
					<input type="button" class="button" name="add_User" value="��  ��" onclick="addUser()"></input>&nbsp;
				</td>
			</tr>
			<tr> 
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					��ѡ���ѯ����������
				</td>
			</tr>
			<tr>
				<td align="left">
					�ͻ���˾��
					<s:select id="queryClient" cssStyle="width:182px;height:20px"
						theme="simple" name="user.client.id"
						list="clientList" listKey="id" headerKey="-1"
						headerValue="��ѡ��" listValue="clientName" >
					</s:select>
					&nbsp;&nbsp;&nbsp;&nbsp;
					�û����ͣ�
					<s:select id="userLevel" cssStyle="width:182px;height:20px"
						theme="simple" name="user.userLevel"
						list="userLevelList" listKey="userLevel" headerKey="-1"
						headerValue="��ѡ��" listValue="strUserLevel" >
					</s:select>
				</td>
			</tr>
			<tr>
				<td>
					<table width="600" height="200" border=1 cellspacing="1" cellpadding="1" align="center" class="inputs" bgcolor=#E0EFFC>
						<tr bgcolor=#E0EFFC >
							<td align="center"  style="height:30px;font-weight:bold;font-size:18px;color:#005AB5 "> 
								�û�����
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
										<td align="center" width="20%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;�ͻ���˾&nbsp;
										</td>
										<td align="center" width="20%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;��&nbsp;��&nbsp;��&nbsp;
										</td>
										<td align="center" width="20%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;��&nbsp;¼&nbsp;��&nbsp;
										</td>
										<td align="center" width="20%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " bgcolor=#E0EFFC>
											&nbsp;�û��ȼ�&nbsp;
										</td>
										<td align="center" width="15%" style="height:8px;font-weight:bold;font-size:12px;color:#005AB5 " >
											&nbsp;��&nbsp;&nbsp;&nbsp;��&nbsp;
										</td>
									</tr>
									<% int i = 0; %>
									<s:if test="resultList.size > 0">
									<s:iterator value="resultList">
										<% i += 1; %>
										<tr style="height:25px;" >
											<td width="5%" align="center" class="navigator" bgcolor=#E0EFFC><%=i%></td>
											<td width="20%" align="center" >
												<s:property value="client.clientName" />
											</td>
											<td width="20%" align="center" bgcolor=#E0EFFC>
												<s:property value="userName" />
											</td>
											<td width="20%" align="center" >
												<s:property value="userCode" />
											</td>
											<td width="20%" align="center" bgcolor=#E0EFFC>
												<s:property value="strUserLevel" />
											</td>
											<td width="15%" align=center border=0 nowrap >
												&nbsp;<img alt="��  ��" src="<%=path%>/treemenu/image/new/edit.gif" onclick="editUser(<s:property value="id"/>)"/>
												&nbsp;
												&nbsp;<img alt="ɾ  ��" src="<%=path%>/treemenu/image/new/delete.gif" onclick="deleteUser(<s:property value="id"/>)" />
											</td>
										</tr>
									</s:iterator>
									</s:if>
									<s:else>
										<tr style="height:25px;" >
											<td width="100%" align="right" colspan="6" class="navigator" >
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