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
                SELECT * FROM parliamentary where parl_id = ? <sql:param value="${param.selected}"/>
            </sql:query>
            <c:redirect url="..\webpage\updateParliamentary.jsp">
                <c:forEach var="row" items="${result.rows}">
                    <c:param name="parl_id" value="${param.selected}"/>
                    <c:param name="parl_name" value="${row.parl_name}"/>
                    <c:param name="party_name" value="${row.party_name}"/>
                    <c:param name="region" value="${row.region}"/>
                    <c:param name="district" value="${row.district}"/>
                    <c:param name="master_name" value="${row.master_name}"/>
                    <c:param name="electarea" value="${row.electarea}"/>
                    <c:param name="boot_name" value="${row.boot_name}"/>
                    
                </c:forEach>
            </c:redirect>
        </c:if>
        <c:if test="${not empty param.delete}">
            <c:redirect url="..\webpage\parliamentaryDisplay.jsp">
                <sql:update var="del" dataSource="jdbc/eBallot">
                    DELETE FROM parliamentary
                    WHERE parl_id = ? <sql:param value="${param.selected}"/>
                </sql:update>
            </c:redirect>
        </c:if>

        <c:if test="${ empty param.parl_name && empty param.party_name}">
            <c:redirect url="..\webpage\updatePartiamentary.jsp" >
                <c:param name="errMsg" value="Please select the correct data" />
            </c:redirect>
        </c:if>



        <sql:update var="updateC" dataSource="jdbc/eBallot">
            UPDATE parliamentary
            SET parl_name = ?, party_name = ?, district = ?, region = ?, master_name = ?, electarea = ?, boot_name = ?
            WHERE parl_id = '${param.parl_id}'
            <sql:param value="${param.parl_name}"/>
            <sql:param value="${param.party_name}"/>
            <sql:param value="${param.district}"/>
            <sql:param value="${param.region}"/>
            <sql:param value="${param.master_name}"/>
            <sql:param value="${param.electarea}"/>
            <sql:param value="${param.boot_name}"/>
        </sql:update>
        <c:choose>
            <c:when test="${updateC >= 1}">
                <c:redirect url="..\webpage\parliamentaryDisplay.jsp" >
                    <c:param name="susMsg" value="Congratulations ! Data inserted
                             successfully." />
                </c:redirect>
            </c:when>
            <c:otherwise>
                <c:redirect url="..\webpage\updateParliamentary.jsp" >
                    <c:param name="errMsg" value="Error ! Please check the data for correction." />
                    <c:param name="parl_id" value="${param.partl_id}"/>
                    <c:param name="parl_name" value="${param.parl_name}"/>
                    <c:param name="party_name" value="${param.party_name}"/>
                    <c:param name="region" value="${param.region}"/>
                    <c:param name="district" value="${param.district}"/>
                    <c:param name="master_name" value="${param.master_name}"/>
                    <c:param name="electarea" value="${param.electarea}"/>
                    <c:param name="boot_name" value="${param.boot_name}"/>
                </c:redirect>
            </c:otherwise>
        </c:choose>
    </body>
</html>