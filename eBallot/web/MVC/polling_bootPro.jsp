<%-- 
    Document   : polling_bootPro
    Created on : Sep 21, 2014, 7:33:30 PM
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
        <c:if test="${
                       empty param.station && empty param.enum_voters
              }">
            <c:redirect url="..\webpage\polling_boot.jsp" >
                <c:param name="errMsg" value="Please name must not empty" />
            </c:redirect>
        </c:if>
        <sql:update var="polling_boot" dataSource="jdbc/eBallot">
            INSERT INTO eballot.polling_boot (station, enum_voters, district, region, country, electArea, constituency)
	VALUES (?, ?, ?, ?, ?, ?, ?)
            <sql:param value="${param.station}" />
            <sql:param value="${param.enum_voters}" />
            <sql:param value="${param.district}" />
            <sql:param value="${param.state}" />
            <sql:param value="${param.country}" />
            <sql:param value="${param.electArea}" />
            <sql:param value="${param.constituency}" />


        </sql:update>
            <c:if test="${polling_boot >= 1}">
                <c:redirect url="..\webpage\polling_bootDisplay.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
          </c:if>
    </body>
</html>
