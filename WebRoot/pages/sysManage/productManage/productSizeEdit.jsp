<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<s:if test=" size.id != null">
	<title>修改产品医用功能分类</title>
</s:if>
<s:else>
	<title>新增产品医用功能分类</title>
</s:else>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path%>/treemenu/css/main1.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/style.css" type="text/css" />
<link rel="stylesheet" href="<%=path%>/treemenu/css/page.css" type="text/css"/>
</head>
<body leftmargin="5" topmargin="5" marginwidth="5" marginheight="5"
		bgcolor="#CAFFFF"
		onload="javascript:document.getElementById('size.sizeName').focus()">
<s:actionmessage />
<form name="addSizeForm">
<script language="JavaScript" type="text/JavaScript">
var form = document.getElementById("addSizeForm");
//保存
function saveSize(){
	var sizeName=document.getElementById('size.sizeName');
	if(sizeName.value==null || sizeName.value==''){
		alert('请输入医用功能分类名称！');
		sizeName.focus();
		return;
	}
	if(sizeName.value.length>50){
		alert('您输入的内容过长！');
		sizeName.focus();
		return;
	}
	var save_Size = document.getElementById('save_Size');
	var cancel = document.getElementById('cancel');
	form.action='saveSize.action';
	form.submit();
	save_Size.disabled = true;
	cancel.disabled = true;
}

//返回查询页面
function goBack(){
	window.location.href='productSizeManage.action';
}
</script>
<input type="hidden" name="size.id" value="<s:property value="size.id"/>" />
<input type="hidden" name="size.deleted" value="<s:property value="size.deleted"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<input type="button" name="save_Size" value="保  存"
							onclick="saveSize()"></input>
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
									<s:if test=" size.id != null">修改产品医用功能分类</s:if>
									<s:else>新增产品医用功能分类</s:else>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="center">
									医用功能分类名称：<font color="red">*</font>
									<input type=text class="box" name="size.sizeName"
										value="<s:property value="size.sizeName"/>"
										onkeypress="javascript:if(event.keyCode==13){saveSize();return false;}"></input>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>