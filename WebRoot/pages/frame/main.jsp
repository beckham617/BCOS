<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<% String path = request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<title>百畅医疗订货系统</title>

</head>
<frameset cols="235,*" frameborder="yes" border="0" framespacing="0">
	<s:if test="flag==1">
		<frame src="<%=path%>/pages/frame/menu1.jsp" name="leftFrame" id="leftFrame" scrolling="auto" />
	</s:if>
	<s:elseif test="flag==2">
		<frame src="<%=path%>/pages/frame/menu2.jsp" name="leftFrame" id="leftFrame" scrolling="auto" />
	</s:elseif>
	<s:elseif test="flag==3">
		<frame src="<%=path%>/pages/frame/menu3.jsp" name="leftFrame" id="leftFrame" scrolling="auto" />
	</s:elseif>
  	<frame src="<%=path%>/pages/frame/welcome.jsp" name="rightFrame" id="rightFrame" scrolling="auto" />
</frameset>
<noframes>
<body>
</body>
</noframes>
</html>
