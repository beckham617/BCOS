<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<s:if test=" brand.id != null">
	<title>修改产品品牌</title>
</s:if>
<s:else>
	<title>新增产品品牌</title>
</s:else>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5"
		bgcolor="#CAFFFF"
		onload="javascript:document.getElementById('brand.brandName').focus()">
<s:actionmessage />
<form name="addBrandForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById("addBrandForm");
//保存
function saveBrand(){
	var brandName=document.getElementById('brand.brandName');
	if(brandName.value==null || brandName.value==''){
		alert('请输入品牌名称！');
		brandName.focus();
		return;
	}
	if(brandName.value.length>50){
		alert('您输入的内容过长！');
		brandName.focus();
		return;
	}
	var saveBtn = document.getElementById('save_Brand');
	var cancel = document.getElementById('cancel');
	form.action='saveBrand.action';
	form.submit();
	saveBtn.disabled = true;
	cancel.disabled = true;
}

//返回查询页面
function goBack(){
	window.location.href='productBrandManage.action';
}
</script>
<input type="hidden" name="brand.id" value="<s:property value="brand.id"/>" />
<input type="hidden" name="brand.deleted" value="<s:property value="brand.deleted"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<input type="button" name="save_Brand" value="保  存"
							onclick="saveBrand()"></input>
						&nbsp;
						<input type="button" name="cancel" value="取  消" onclick="goBack()"></input>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						<table width="600" border=0 cellspacing="1" cellpadding="1"
							align="center" class="inputs">
							<tr bgcolor=#E0EFFC>
								<td align="center" style="height: 30px; font-weight: bold; font-size: 18px; color: #005AB5">
									<s:if test=" brand.id != null">修改产品品牌</s:if>
									<s:else>新增产品品牌</s:else>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="center">
									品牌名称：<font color="red">*</font>
									<input type=text class="box" name="brand.brandName"
										value="<s:property value="brand.brandName"/>"
										onkeypress="javascript:if(event.keyCode==13){saveBrand();return false;}"></input>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>