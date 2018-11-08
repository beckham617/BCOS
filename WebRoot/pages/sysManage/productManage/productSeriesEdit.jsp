<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<s:if test=" series.id != null">
	<title>�޸Ĳ�Ʒϵ��</title>
</s:if>
<s:else>
	<title>������Ʒϵ��</title>
</s:else>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5"
		bgcolor="#CAFFFF"
		onload="javascript:document.getElementById('series.brand.id').focus()">
<s:actionmessage />
<form name="addSeriesForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById("addSeriesForm");
//����
function saveSeries(){
	var seriesName=document.getElementById('series.seriesName');
	var brandId = document.getElementById('series.brand.id');
	var usageId = document.getElementById('series.usage.id');
	if(!(brandId.value>0)){
		alert('��ѡ���ƷƷ�����ƣ�');
		brandId.focus();
		return;
	}
	if(!(usageId.value>0)){
		alert('��ѡ���Ʒ��;���ƣ�');
		usageId.focus();
		return;
	}
	if(seriesName.value==null || seriesName.value==''){
		alert('�������Ʒϵ�����ƣ�');
		seriesName.fucos();
		return;
	}
	if(seriesName.value.length>50){
		alert('����������ݹ�����');
		seriesName.focus();
		return;
	}
	var save_Series = document.getElementById('save_Series');
	var cancel = document.getElementById('cancel');
	form.action='saveSeries.action';
	form.submit();
	save_Series.disabled = true;
	cancel.disabled = true;
}

//���ز�ѯҳ��
function goBack(){
	window.location.href='productSeriesManage.action';
}
</script>
<input type="hidden" name="series.id" value="<s:property value="series.id"/>" />
<input type="hidden" name="series.deleted" value="<s:property value="series.deleted"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<input type="button" name="save_Series" value="��  ��"
							onclick="saveSeries()"></input>
						&nbsp;
						<input type="button" name="cancel" value="ȡ  ��" onclick="goBack()"></input>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<table width="600" border=0 cellspacing="1" cellpadding="1"
							align="center" class="inputs">
							<tr bgcolor=#E0EFFC>
								<td align="center"
									style="height: 30px; font-weight: bold; font-size: 18px; color: #005AB5" colspan="4">
									<s:if test=" series.id != null">�޸Ĳ�Ʒϵ��</s:if>
									<s:else>������Ʒϵ��</s:else>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right" width=25%>
									&nbsp;Ʒ�����ƣ�<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="brandName" cssStyle="width:150px;height:20px"
										theme="simple" name="series.brand.id" 
										list="brandList" listKey="id" headerKey="-1"
										headerValue="��ѡ��" listValue="brandName"  >
									</s:select>
								</td>
								<td align="right" width=20%>
									&nbsp;��;���ƣ�<font color="red">*</font>
								</td>
								<td align="left" width=30%>
									<s:select id="usageName" cssStyle="width:150px;height:20px"
										theme="simple" name="series.usage.id" 
										list="usageList" listKey="id" headerKey="-1"
										headerValue="��ѡ��" listValue="usageName" >
									</s:select>
								</td>
							</tr>
							<tr>
								<td align="right" width=25% >
									ϵ�����ƣ�<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<input type=text class="box" id="series.seriesName" name="series.seriesName"
										value="<s:property value="series.seriesName"/>"
										onkeypress="javascript:if(event.keyCode==13){saveSeries();return false;}"></input>
								</td>
								<td></td><td></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>