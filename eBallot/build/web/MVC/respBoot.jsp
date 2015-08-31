<%-- 
    Document   : response
    Created on : Nov 21, 2014, 3:37:31 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${not empty param.update  && not empty param.selected}">
            <sql:query var="result" dataSource="jdbc/eBallot">
                SELECT * FROM polling_boot where station = ? <sql:param value="${param.selected}"/>
            </sql:query>
            <c:redirect url="..\webpage\updateBoot.jsp">
                <c:forEach var="row" items="${result.rows}">
                    <c:param name="station" value="${param.selected}"/>
                    <c:param name="enum_voters" value="${row.enum_voters}"/>
                    <c:param name="district" value="${row.district}"/>
                    <c:param name="region" value="${row.region}"/>
                    <c:param name="country" value="${row.country}"/>
                    <c:param name="electArea" value="${row.electArea}"/>
                    <c:param name="constituency" value="${row.constituency}"/>
                </c:forEach>
            </c:redirect>
        </c:if>
            <c:if test="${not empty param.delete}">
                <c:redirect url="..\webpage\polling_bootDisplay.jsp">
                <sql:update var="del" dataSource="jdbc/eBallot">
                DELETE FROM polling_boot
                WHERE station = ? <sql:param value="${param.selected}"/>
            </sql:update>
                </c:redirect>
            </c:if>
            
       <c:if test="${empty param.station && empty param.enum_voters }">
         <c:redirect url="..\webpage\updateBoot.jsp" >
                <c:param name="errMsg" value="Please select the correct data" />
            </c:redirect>
        </c:if>

        <sql:update var="updateC" dataSource="jdbc/eBallot">
            UPDATE polling_boot
            SET enum_voters = ?, district = ?, region = ?, country = ?, electArea = ?, constituency = ?
            WHERE station = '${param.station}'
            <sql:param value="${param.enum_voters}" />
            <sql:param value="${param.district}" />
            <sql:param value="${param.region}" />
            <sql:param value="${param.country}" />
            <sql:param value="${param.electArea}" />
            <sql:param value="${param.constituency}" />
        </sql:update>
            <c:choose>
                <c:when test="${updateC >= 1}">
                   <c:redirect url="..\webpage\polling_bootDisplay.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
                </c:when>
                <c:otherwise>
                    <c:redirect url="..\webpage\updateBoot.jsp" >
                <c:param name="errMsg" value="Error ! Please check the data for correction." />
                    <c:param name="station" value="${param.station}"/>
                    <c:param name="enum_voters" value="${param.enum_voters}"/>
                    <c:param name="district" value="${param.district}"/>
                    <c:param name="region" value="${param.region}"/>
                    <c:param name="country" value="${param.country}"/>
                    <c:param name="electArea" value="${param.electArea}"/>
                    <c:param name="constituency" value="${param.constituency}"/>
                    </c:redirect>
                </c:otherwise>
            </c:choose>
    </body>
</html>