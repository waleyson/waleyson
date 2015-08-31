<%-- 
    Document   : regionPro
    Created on : Sep 28, 2014, 1:50:18 PM
    Author     : AbdHafeez
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <body>
        <c:if test="${ empty param.region_name }">
            <c:redirect url="..\webpage\region.jsp" >
                <c:param name="errMsg" value="Please region name must not be empty" />
            </c:redirect>
        </c:if>
            <sql:update var="reg" dataSource="jdbc/eBallot">
            INSERT INTO eballot.region (region_name, description, cname)
            VALUES (?, ?, ?)
            <sql:param value="${param.region_name}" />
            <sql:param value="${param.description}" />
            <sql:param value="${param.cname}" />
        </sql:update>
            <c:if test="${reg>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>

            <c:redirect url="..\webpage\region.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if>
    </body>
    </body>
</html>
