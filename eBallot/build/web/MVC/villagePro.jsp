<%-- 
    Document   : villagePro
    Created on : Sep 29, 2014, 2:58:36 PM
    Author     : AbdHafeez
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>eBallot Application</title>
    </head>
    <body>
        <c:if test="${ empty param.name }">
            <c:redirect url="..\webpage\village.jsp" >
                <c:param name="errMsg" value="Please Village name must not be empty" />
            </c:redirect>
        </c:if>

        <sql:update var="dist" dataSource="jdbc/eBallot">
            INSERT INTO eballot.village (`name`, cname, region, district, population, constituency)
	VALUES (?, ?, ?, ?, ?, ?)
            <sql:param value="${param.name}" />
            <sql:param value="${param.country}" />
            <sql:param value="${param.state}" />
            <sql:param value="${param.district}" />
            <sql:param value="${param.pop}" />
            <sql:param value="${param.constituency}" />
        </sql:update>
            <c:if test="${dist>=1}">
                <c:redirect url="..\webpage\village.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if>
    </body>
</html>
