<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>目录树</title>
<link href="../../treemenu/css/tree.css" rel="stylesheet" type="text/css" />
<link href="../../treemenu/css/dtree.css" rel="stylesheet" type="text/css" />
<link href="../../treemenu/css/main1.css" rel="stylesheet" type="text/css" />
</head>
<body leftmargin="10" topmargin="5" marginwidth="0" marginheight="0" >
<table width="180" border="0" cellspacing="0" cellpadding="0" >
  <tr>
  	<td>
  		<img src="../../image/BestChance_logo_1.gif"></img>
  	</td>
  </tr>
  <tr>
  	<td align="center">
  		<a href="../../MyJsp.jsp"><font size="2px">退出系统</font></a>
  	</td>
  </tr>
  <tr><td>&nbsp;</td></tr>
  <tr>
    <td>
		<p>
		<script type="text/javascript" src="../../treemenu/js/dtree.js"></script>
		<script type="text/javascript">
			tree = new dTree('tree');
			//菜单树根节点，标题
			tree.add("0","-1","百畅医疗订货系统","","","","","",false);
				//订单管理
				tree.add("1","0","订单管理","","","rightFrame");
					tree.add("13","1","汇总订单管理","sumListManage.action","","rightFrame");//汇总订单管理（管理员、采购员）
				//系统管理			
				tree.add("2","0","系统管理","","","","","",false);
					tree.add("223","2","密码管理","../../pages/sysManage/clientManage/passwordManage.jsp","","rightFrame");//密码管理（客户）
				//关于			
				tree.add("3","0","关于","","","","","",false);	
					tree.add("31","3","联系我们","../../pages/about/contactUs.jsp","","rightFrame");//联系我们
					tree.add("32","3","关于","../../pages/about/about.jsp","","rightFrame");//关于
			document.write(tree);
		</script>
		</p>
	</td>
  </tr>
</table>
</body>
</html>
