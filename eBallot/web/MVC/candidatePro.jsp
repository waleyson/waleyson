<%-- 
    Document   : candidatePro
    Created on : Sep 19, 2014, 9:00:59 PM
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
                        && empty param.position}">
            <c:redirect url="..\webpage\candidates.jsp" >
                <c:param name="errMsg" value="Please candidate name must not be empty" />
            </c:redirect>
        </c:if>
        <sql:update var="candidate" dataSource="jdbc/eBallot">
            INSERT INTO eballot.candidate (party_id, master_id, name, position)
            VALUES (?, ?, ?,?)
            <sql:param value="${param.party_id}" />
            <sql:param value="${param.master_id}" />
            <sql:param value="${param.name}" />
            <sql:param value="${param.position}" />
        </sql:update>
            <c:if test="${candidate>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>

            <c:redirect url="..\webpage\candidates.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if>
    </body>
</html>
