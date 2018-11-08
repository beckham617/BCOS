<%@ page language="java" contentType="text/html; charset=gb2312" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/pagetag.tld" prefix="pt"%>  
<html>
<% String path = request.getContextPath(); %>
<head>
<s:if test=" series.id != null">
	<title>修改产品系列</title>
</s:if>
<s:else>
	<title>新增产品系列</title>
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
//保存
function saveSeries(){
	var seriesName=document.getElementById('series.seriesName');
	var brandId = document.getElementById('series.brand.id');
	var usageId = document.getElementById('series.usage.id');
	if(!(brandId.value>0)){
		alert('请选择产品品牌名称！');
		brandId.focus();
		return;
	}
	if(!(usageId.value>0)){
		alert('请选择产品用途名称！');
		usageId.focus();
		return;
	}
	if(seriesName.value==null || seriesName.value==''){
		alert('请输入产品系列名称！');
		seriesName.fucos();
		return;
	}
	if(seriesName.value.length>50){
		alert('您输入的内容过长！');
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

//返回查询页面
function goBack(){
	window.location.href='productSeriesManage.action';
}
</script>
<input type="hidden" name="series.id" value="<s:property value="series.id"/>" />
<input type="hidden" name="series.deleted" value="<s:property value="series.deleted"/>" />
			<table style="border: 0 solid blue" style="background-color:#CAFFFF">
				<tr>
					<td>
						<input type="button" name="save_Series" value="保  存"
							onclick="saveSeries()"></input>
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
								<td align="center"
									style="height: 30px; font-weight: bold; font-size: 18px; color: #005AB5" colspan="4">
									<s:if test=" series.id != null">修改产品系列</s:if>
									<s:else>新增产品系列</s:else>
								</td>
							</tr>
							<tr style="height: 30px">
								<td align="right" width=25%>
									&nbsp;品牌名称：<font color="red">*</font>
								</td>
								<td align="left" width=25%>
									<s:select id="brandName" cssStyle="width:150px;height:20px"
										theme="simple" name="series.brand.id" 
										list="brandList" listKey="id" headerKey="-1"
										headerValue="请选择" listValue="brandName"  >
									</s:select>
								</td>
								<td align="right" width=20%>
									&nbsp;用途名称：<font color="red">*</font>
								</td>
								<td align="left" width=30%>
									<s:select id="usageName" cssStyle="width:150px;height:20px"
										theme="simple" name="series.usage.id" 
										list="usageList" listKey="id" headerKey="-1"
										headerValue="请选择" listValue="usageName" >
									</s:select>
								</td>
							</tr>
							<tr>
								<td align="right" width=25% >
									系列名称：<font color="red">*</font>
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