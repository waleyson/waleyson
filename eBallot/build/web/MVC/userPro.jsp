<%-- 
    Document   : userPro
    Created on : Sep 27, 2014, 2:55:09 PM
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
        <title>eBallotApplication </title>
    </head>
    <body>
        <c:if test="${ empty param.firstname
              && empty param.lastname
              && empty param.userid
              && empty param.password
              }">
            <c:redirect url="user.jsp" >
                <c:param name="errMsg" value="Please complete the user registration details" />
            </c:redirect>
        </c:if>

        <sql:update var="users" dataSource="jdbc/eBallot">
            INSERT INTO eballot.`user` (userid, password, gender, firstname, lastname) VALUES (?, ?, ?, ?, ?)
            
            <sql:param value="${param.userid}" />
            <sql:param value="${param.password}" />
            <sql:param value="${param.gender}" />
            <sql:param value="${param.firstname}" />
            <sql:param value="${param.lastname}" />

        </sql:update>
            <c:if test="${users>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
            <c:redirect url="user.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if>
    </body>
</html>
