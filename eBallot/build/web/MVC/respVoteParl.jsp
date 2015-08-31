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
                SELECT * FROM voteparl where voteparl_id = ? <sql:param value="${param.selected}"/>
            </sql:query>
            <c:redirect url="..\webpage\updateVoteParl.jsp">
                <c:forEach var="row" items="${result.rows}">
                    <c:param name="voteparl_id" value="${param.selected}"/>
                    <c:param name="party_name" value="${row.party_name}"/>
                    <c:param name="master_name" value="${row.master_name}"/>
                    <c:param name="vote_count" value="${row.vote_count}"/>
                    <c:param name="parl_name" value="${row.parl_name}"/>
                    <c:param name="station" value="${row.station}"/>
                </c:forEach>
            </c:redirect>
        </c:if>
        <c:if test="${not empty param.delete}">
            <c:redirect url="..\webpage\voteparlDisplay.jsp">
                <sql:update var="del" dataSource="jdbc/eBallot">
                    DELETE FROM voteparl
                    WHERE voteparl_id = ? <sql:param value="${param.selected}"/>
                </sql:update>
            </c:redirect>
        </c:if>

        <c:if test="${ empty param.parl_name && empty param.votecount}">
            <c:redirect url="..\webpage\updateVoteParl.jsp" >
                <c:param name="errMsg" value="Please select the correct data" />
            </c:redirect>
        </c:if>



        <sql:update var="updateC" dataSource="jdbc/eBallot">
            UPDATE voteparl
            SET party_name = ?, master_name = ?, vote_count = ?, parl_name = ?, station = ?
            WHERE voteparl_id = '${param.voteparl_id}'
            <sql:param value="${param.party_name}"/>
            <sql:param value="${param.master_name}"/>
            <sql:param value="${param.vote_count}"/>
            <sql:param value="${param.parl_name}"/>
            <sql:param value="${param.station}"/>
        </sql:update>
        <c:choose>
            <c:when test="${updateC >= 1}">
                <c:redirect url="..\webpage\voteparlDisplay.jsp" >
                    <c:param name="susMsg" value="Congratulations ! Data inserted
                             successfully." />
                </c:redirect>
            </c:when>
            <c:otherwise>
                <c:redirect url="..\webpage\updateVoteParl.jsp" >
                    <c:param name="errMsg" value="Error ! Please check the data for correction." />
                    <c:param name="voteparl_id" value="${param.voteparl_id}"/>
                    <c:param name="party_name" value="${param.party_name}"/>
                    <c:param name="master_name" value="${param.master_name}"/>
                    <c:param name="vote_count" value="${param.vote_count}"/>
                    <c:param name="parl_name" value="${param.parl_name}"/>
                    <c:param name="station" value="${param.station}"/>
                </c:redirect>
            </c:otherwise>
        </c:choose>
    </body>
</html>