<%-- 
    Document   : localPolPro
    Created on : Sep 19, 2014, 7:39:34 PM
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
        <title>eBallot Application</title>
    </head>
    <body><c:if test="${ empty param.name
                                   && empty param.population}">
            <c:redirect url="..\webpage\constituency.jsp" >
                <c:param name="errMsg" value="Please population details must not be empty" />
            </c:redirect>
        </c:if>

        <sql:update var="population" dataSource="jdbc/eBallot">
            INSERT INTO eballot.master (`name`, population, cname, region, district)
	VALUES (?, ?, ?, ?, ?)
            <sql:param value="${param.name}" />
            <sql:param value="${param.population}" />
            <sql:param value="${param.cname}" />
            <sql:param value="${param.region}" />
            <sql:param value="${param.district}" />
        </sql:update>

        <c:if test="${population>=1}">
                <c:redirect url="..\webpage\constituency.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if>
    </body>
</html>
