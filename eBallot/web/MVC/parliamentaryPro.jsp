<%-- 
    Document   : parliamentaryPro
    Created on : Sep 30, 2014, 9:08:45 PM
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
    <body>
        <c:if test="${ empty param.name
              }">
            <c:redirect url="..\webpage\parliamentary.jsp" >
                <c:param name="errMsg" value="Please name must not empty" />
            </c:redirect>
        </c:if>
        <sql:update var="parl" dataSource="jdbc/eBallot">
            INSERT INTO eballot.parliamentary (parl_name, party_name,region, district, master_name, electarea, boot_name )
	VALUES (?, ?, ?, ?,?,?,? )
            <sql:param value="${param.name}" />
            <sql:param value="${param.party}" />
            <sql:param value="${param.state}" />
            <sql:param value="${param.district}" />
            <sql:param value="${param.constituency}" />
            <sql:param value="${param.electarea}" />
            <sql:param value="${param.boot}" />
        </sql:update>
            <c:if test="${parl>=1}">
                <c:redirect url="..\webpage\parliamentaryDisplay.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if>
    </body>
</html>

