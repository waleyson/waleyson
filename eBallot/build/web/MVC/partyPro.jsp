<%-- 
    Document   : partyPro
    Created on : Sep 19, 2014, 8:50:05 PM
    Author     : AbdHafeez
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${ empty param.name && empty ptype && empty plogo}">
            <c:redirect url="..\webpage\party.jsp" >
                <c:param name="errMsg" value="Please candidate name must not be empty" />
            </c:redirect>
        </c:if>

        <sql:update var="party" dataSource="jdbc/eBallot">
            INSERT INTO eballot.party (name, ptype, plogo)
            VALUES (?, ?, ?)
            <sql:param value="${param.name}" />
            <sql:param value="${param.ptype}" />
            <sql:param value="${param.plogo}" />
        </sql:update>
           <c:if test="${dist>=1}">
                <c:redirect url="..\webpage\party.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if>
    </body>
</html>
