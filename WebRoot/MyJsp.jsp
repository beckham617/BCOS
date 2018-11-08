<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!--  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
-->
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>百畅医疗订货系统</title>
        <link rel="stylesheet" href="<s:property value="skin"/>css/style1.css" type="text/css" />
        <script language="javascript" src="<s:url value="/js/common.js"/>"></script>
        <script language="javascript">
            function init(){
                try{
                    window.opener = null;var pop=null;
                        pop = window.open('login.jsp','_blank','top=0,left=0,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=no');
                        if(pop!=null){
                            /*if(document.layers){
                                var larg=pop.screen.availWidth-10;
                                var altez=pop.screen.availHeight-20;
                            }
                            else{
                                var larg=pop.screen.availWidth-2;
                                var altez=pop.screen.availHeight;
                            }
                            pop.resizeTo(larg,altez);
                            pop.moveTo(0,0);*/
                            pop.resizeTo(1000,700);
							pop.moveTo((window.screen.availWidth-1000)/2,(window.screen.availHeight-700)/2);
                        }
                    if(window.parent){
                        window.parent.open("","_self");
                        window.parent.opener=null;
                        window.parent.close();
                    }
                    if(pop!=null){
                        window.open("","_self");
                        window.opener=null;
                        window.close();
                    }
                    else{
                        alert("系统阻止了弹出窗口，请关闭弹出窗口阻止程序或设置允许本站弹出窗口！");
                    }
                }
                catch(err){
                    
                }
            }
        </script>
    </head>

    <body onload="init()" style="color:#FFF">
    </body>
</html>