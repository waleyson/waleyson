<%-- 
    Document   : coalition_centrePro
    Created on : Sep 21, 2014, 8:24:25 PM
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
        <body>
            <c:if test="${empty param.master_id
                                   && empty param.candidate_id
                                    && empty param.station}">
            <c:redirect url="..\webpage\coalition_centre.jsp" >
                <c:param name="errMsg" value="Please candidate name must not be empty" />
            </c:redirect>
        </c:if>
        
        <sql:update var="coalition_centre" dataSource="jdbc/eBallot">
            INSERT INTO eballot.coalition_centre (master_id, candidate_id, station)
            VALUES (?, ?, ?)
            <sql:param value="${param.master_id}" />
            <sql:param value="${param.candidate_id}" />
            <sql:param value="${param.station}" />
        </sql:update>
           <c:if test="${coalition_centre>=1}">
                 <c:redirect url="..\webpage\coalition_centre.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if>
    </body>
</html>
