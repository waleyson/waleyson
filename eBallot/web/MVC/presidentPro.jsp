<%-- 
    Document   : presidentPro
    Created on : Sep 30, 2014, 9:12:12 PM
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
        <c:if test="${ empty param.name }">
            <c:redirect url="..\webpage\president.jsp" >
                <c:param name="errMsg" value="Please candidate name must not be empty" />
            </c:redirect>
        </c:if>

        <sql:update var="pres" dataSource="jdbc/eBallot">
            INSERT INTO eballot.presidential (`name`, `position`, party_id)
	VALUES (?, DEFAULT, ?)

            <sql:param value="${param.name}" />
            <sql:param value="${param.party}" />
        </sql:update>
            <c:if test="${pres>=1}">
                <c:redirect url="..\webpage\president.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if>
    </body>
</html>

