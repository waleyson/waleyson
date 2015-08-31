<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : country_test
    Created on : Sep 28, 2014, 11:51:37 AM
    Author     : AbdHafeez
--%>
<sql:query var="country" dataSource="jdbc/eBallot">
            SELECT cname  FROM country
</sql:query>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
</html>
<%@page import="java.sql.*"%>
<html>
    <head>
        <script language="javascript" type="text/javascript">
            var xmlHttp
            var xmlHttp
            function showState(str){
                xmlHttp=GetXmlHttpObject();
                if (xmlHttp==null)
                {
                    alert ("Browser does not support HTTP Request")
                    return
                }
                var url="region_test.jsp";
                url +="?count=" +str;
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }

            function stateChange(){
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
                    document.getElementById("state").innerHTML=xmlHttp.responseText
                }
            }

            function GetXmlHttpObject()
            {
                var xmlHttp=null;
                try
                {
                    // Firefox, Opera 8.0+, Safari
                    xmlHttp=new XMLHttpRequest();
                }
                catch (e)
                {
                    //Internet Explorer
                    try
                    {
                        xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
                    }
                    catch (e)
                    {
                        xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }
                }
                return xmlHttp;
            }
        </script>
    </head>
    <body>

        <select name='country' onchange="showState(this.value)">
            <option value="none">Select</option>
            <c:forEach var="row" items="${country.rowsByIndex}">

                <c:forEach var="column" items="${row}">
                    <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                </c:forEach>

            </c:forEach>

        </select>
        <br>
        <div id='state'>
            <select name='state' >
                <option value='-1'></option>
            </select>
        </div>
    </body>
</html>