<%-- 
    Document   : voterRegPro
    Created on : Sep 19, 2014, 6:05:20 PM
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
        <c:if test="${ empty param.votecount
              }">
            <c:redirect url="..\webpage\votepres.jsp" >
                <c:param name="errMsg" value="Please candidate name must not be empty" />
            </c:redirect>
        </c:if>
        
        <sql:update var="pres_vote" dataSource="jdbc/eBallot">
            INSERT INTO eballot.votepres (candidate, votecount, boot, master_name, electArea)
	VALUES (?, ?, ?, ?,?)

            <sql:param value="${param.candid}" />
            <sql:param value="${param.votecount}" />
            <sql:param value="${param.boot}" />
            <sql:param value="${param.constit}" />
            <sql:param value="${param.electArea}" />
        </sql:update>
            <c:if test="${pres_vote >= 1}">
            
            <c:redirect url="..\webpage\votepresDisplay.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if>

    </body>
</html>
