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
                SELECT * FROM votepres where id = ? <sql:param value="${param.selected}"/>
            </sql:query>
            <c:redirect url="..\webpage\updateVotePres.jsp">
                <c:forEach var="row" items="${result.rows}">
                    <c:param name="id" value="${param.selected}"/>
                    <c:param name="party_name" value="${row.party_name}"/>
                    <c:param name="candidate" value="${row.candidate}"/>
                    <c:param name="votecount" value="${row.votecount}"/>
                    <c:param name="boot" value="${row.boot}"/>
                    
                </c:forEach>
            </c:redirect>
        </c:if>
        <c:if test="${not empty param.delete}">
            <c:redirect url="..\webpage\votepresDisplay.jsp">
                <sql:update var="del" dataSource="jdbc/eBallot">
                    DELETE FROM votepres
                    WHERE id = ? <sql:param value="${param.selected}"/>
                </sql:update>
            </c:redirect>
        </c:if>

        <c:if test="${ empty param.candidate && empty param.votecount}">
            <c:redirect url="..\webpage\updateVotePres.jsp" >
                <c:param name="errMsg" value="Please select the correct data" />
            </c:redirect>
        </c:if>



        <sql:update var="updateC" dataSource="jdbc/eBallot">
            UPDATE votepres
            SET party_name = ?, candidate = ?, votecount = ?, boot = ?
            WHERE id = '${param.id}'
            <sql:param value="${param.party_name}"/>
            <sql:param value="${param.candidate}"/>
            <sql:param value="${param.votecount}"/>
            <sql:param value="${param.boot}"/>
        </sql:update>
        <c:choose>
            <c:when test="${updateC >= 1}">
                <c:redirect url="..\webpage\votepresDisplay.jsp" >
                    <c:param name="susMsg" value="Congratulations ! Data inserted
                             successfully." />
                </c:redirect>
            </c:when>
            <c:otherwise>
                <c:redirect url="..\webpage\updateVotePres.jsp" >
                    <c:param name="errMsg" value="Error ! Please check the data for correction." />
                    <c:param name="id" value="${param.id}"/>
                    <c:param name="party_name" value="${param.party_name}"/>
                    <c:param name="candidate" value="${param.candidate}"/>
                    <c:param name="vote_count" value="${param.votecount}"/>
                    <c:param name="boot" value="${param.boot}"/>
                </c:redirect>
            </c:otherwise>
        </c:choose>
    </body>
</html>