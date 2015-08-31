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
                SELECT * FROM party where party_id = ? <sql:param value="${param.selected}"/>
            </sql:query>
            <c:redirect url="..\webpage\updateParty.jsp">
                <c:forEach var="row" items="${result.rows}">
                    <c:param name="party_id" value="${param.selected}"/>
                    <c:param name="party_name" value="${row.name}"/>
                    <c:param name="party_type" value="${row.ptype}"/>
                    <c:param name="logon" value="${row.logo}"/>
                </c:forEach>
            </c:redirect>
        </c:if>
        <c:if test="${not empty param.delete}">
            <c:redirect url="..\webpage\partyDisplay.jsp">
                <sql:update var="del" dataSource="jdbc/eBallot">
                    DELETE FROM party
                    WHERE party_id = ? <sql:param value="${param.selected}"/>
                </sql:update>
            </c:redirect>
        </c:if>

        <c:if test="${ empty param.party_name && empty param.type}">
            <c:redirect url="..\webpage\updateParty.jsp" >
                <c:param name="errMsg" value="Please select the correct data" />
            </c:redirect>
        </c:if>



        <sql:update var="updateC" dataSource="jdbc/eBallot">
            UPDATE party
            SET name = ?, ptype = ?, plogo = ?
            WHERE party_id = '${param.party_id}'
            <sql:param value="${param.party_name}"/>
            <sql:param value="${param.party_type}"/>
            <sql:param value="${param.logo}"/>
        </sql:update>
        <c:choose>
            <c:when test="${updateC >= 1}">
                <c:redirect url="..\webpage\partyDisplay.jsp" >
                    <c:param name="susMsg" value="Congratulations ! Data inserted
                             successfully." />
                </c:redirect>
            </c:when>
            <c:otherwise>
                <c:redirect url="..\webpage\updateParty.jsp" >
                    <c:param name="errMsg" value="Error ! Please check the data for correction." />
                    <c:param name="party_id" value="${param.party_id}"/>
            <c:param name="party_name" value="${param.party_name}"/>
            <c:param name="party_type" value="${param.party_type}"/>
            <c:param name="logo" value="${param.logo}"/>
                </c:redirect>
            </c:otherwise>
        </c:choose>
    </body>
</html>