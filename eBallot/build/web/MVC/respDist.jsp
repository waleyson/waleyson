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
        <c:if test="${not empty param.update}">
            <sql:query var="result" dataSource="jdbc/eBallot">
                SELECT * FROM district where district_id = ? <sql:param value="${param.selected}"/>
            </sql:query>
            <c:redirect url="..\webpage\updateDistrict.jsp">
                <c:forEach var="row" items="${result.rows}">
                    <c:param name="district_id" value="${param.selected}"/>
                    <c:param name="name" value="${row.name}"/>
                    <c:param name="population" value="${row.population}"/>
                    <c:param name="region" value="${row.region}"/>
                    <c:param name="country" value="${row.country}"/>
                </c:forEach>
            </c:redirect>
        </c:if>
            <c:if test="${not empty param.delete}">
                <c:redirect url="..\webpage\districtDisplay.jsp">
                <sql:update var="del" dataSource="jdbc/eBallot">
                DELETE FROM district
                WHERE district_id = ? <sql:param value="${param.selected}"/>
            </sql:update>
                </c:redirect>
            </c:if>
            
       <c:if test="${empty param.name && empty param.population && empty param.region && empty param.country}">
         <c:redirect url="..\webpage\updateDistrict.jsp" >
                <c:param name="errMsg" value="Please select the correct data" />
            </c:redirect>
        </c:if>

        <sql:update var="updateC" dataSource="jdbc/eBallot">
            UPDATE district
            SET name = ?, country = ?, region = ?, population = ?
            WHERE district_id = '${param.district_id}'
            <sql:param value="${param.name}" />
            <sql:param value="${param.country}" />
            <sql:param value="${param.region}" />
            <sql:param value="${param.population}" />
        </sql:update>
            <c:choose>
                <c:when test="${updateC >= 1}">
                   <c:redirect url="..\webpage\districtDisplay.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
                </c:when>
                <c:otherwise>
                    <c:redirect url="..\webpage\updateDistrict.jsp" >
                <c:param name="errMsg" value="Error ! Please check the data for correction." />
                    <c:param name="district_id" value="${param.district_id}"/>
                    <c:param name="name" value="${param.name}"/>
                    <c:param name="population" value="${param.population}"/>
                    <c:param name="region" value="${param.region}"/>
                    <c:param name="country" value="${param.country}"/>
                    </c:redirect>
                </c:otherwise>
            </c:choose>
    </body>
</html>