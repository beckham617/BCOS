<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript" type="text/JavaScript">
</script>
<head>
<% String path = request.getContextPath(); %>
</head>
<style type="text/css"> 
/* CSS Document */

body { 
    font: normal 11px auto "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
    color: #4f6b72; 
    background: #E6EAE9; 
}

a { 
    color: #c75f3e; 
}

#mytable { 
    width: 700px; 
    padding: 0; 
    margin: 0; 
}

caption { 
    padding: 0 0 5px 0; 
    width: 700px;      
    font: italic 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
    text-align: right; 
}

th { 
    font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
    color: #4f6b72; 
    border-right: 1px solid #C1DAD7; 
    border-bottom: 1px solid #C1DAD7; 
    border-top: 1px solid #C1DAD7; 
    letter-spacing: 2px; 
    text-transform: uppercase; 
    text-align: left; 
    padding: 6px 6px 6px 12px; 
    background: #CAE8EA url(images/bg_header.jpg) no-repeat; 
}

th.nobg { 
    border-top: 0; 
    border-left: 0; 
    border-right: 1px solid #C1DAD7; 
    background: none; 
}

td { 
    border-right: 1px solid #C1DAD7; 
    border-bottom: 1px solid #C1DAD7; 
    background: #fff; 
    font-size:11px; 
    padding: 6px 6px 6px 12px; 
    color: #4f6b72; 
}


td.alt { 
    background: #F5FAFA; 
    color: #797268; 
}

th.spec { 
    border-left: 1px solid #C1DAD7; 
    border-top: 0; 
    background: #fff url(images/bullet1.gif) no-repeat; 
    font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
}

th.specalt { 
    border-left: 1px solid #C1DAD7; 
    border-top: 0; 
    background: #f5fafa url(images/bullet2.gif) no-repeat; 
    font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif; 
    color: #797268; 
} 
/*---------for IE 5.x bug*/ 
html>body td{ font-size:11px;} 
</style> 
<body bgcolor="#84C1FF"  style="background-image:url(<%=path%>/image/GrassinA.jpg);background-repeat:no-repeat;" >
<s:actionmessage />
<table id="mytable" cellspacing="0" summary="The technical specifications of the Apple PowerMac G5 series"> 
<caption> </caption> 
  <tr> 
    <th scope="col" abbr="Configurations" class="nobg">源码爱好者</th>

    <th scope="col" abbr="Dual 1.8">Dual 1.8GHz</th> 
    <th scope="col" abbr="Dual 2">Dual 2GHz</th> 
    <th scope="col" abbr="Dual 2.5">Dual 2.5GHz</th> 
  </tr> 
  <tr> 
    <th scope="row" abbr="Model" class="spec">lipeng</th> 
    <td>M9454LL/A</td>

    <td>M9455LL/A</td> 
    <td>M9457LL/A</td> 
  </tr> 
  <tr> 
    <th scope="row" abbr="G5 Processor" class="specalt">mapabc</th> 
    <td class="alt">Dual 1.8GHz PowerPC G5</td> 
    <td class="alt">Dual 2GHz PowerPC G5</td>

    <td class="alt">Dual 2.5GHz PowerPC G5</td> 
  </tr> 
  <tr> 
    <th scope="row" abbr="Frontside bus" class="spec">源码下载</th> 
    <td>900MHz per processor</td> 
    <td>1GHz per processor</td> 
    <td>1.25GHz per processor</td>

  </tr> 
  <tr> 
    <th scope="row" abbr="L2 Cache" class="specalt">网页特效</th> 
    <td class="alt">512K per processor</td> 
    <td class="alt">512K per processor</td> 
    <td class="alt">512K per processor</td> 
  </tr> 
</table> 
<!--  bgcolor="#FF9966" -->
  <!-- 
  <tr>
    <td align="left" valign="top"><img src="../treemenu/image/tishi/tishi_01.gif" width="400" height="107"></td>
  </tr>
  <tr>
    <td align="left" valign="top"><img src="../treemenu/image/tishi/tishi_02.gif" width="400" height="22"></td>
  </tr>
  <tr>
    <td align="center" valign="top" background="../treemenu/image/tishi/tishi_03.gif"><table width="300" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="left" valign="top" class="font12pxgreen">欢迎您使用PC机配置单及报价系统</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="left" valign="top"><img src="../treemenu/image/tishi/tishi_04.gif" width="400" height="52"></td>
  </tr>
   
  	<table border=1>
  		<tr>
  			<td>1</td>
  			<td>2</td>
  			<td>3</td>
  		</tr>
		<tr>
			<td>4</td>
			<td height=100>
				<img src="<%=path%>/treemenu/image/new/title.bmp" >
			</td>
			<td>6</td>
		</tr>
		<tr>
  			<td>7</td>
  			<td>8</td>
  			<td>9</td>
  		</tr>
	</table>
	-->			 
</body>
</html>