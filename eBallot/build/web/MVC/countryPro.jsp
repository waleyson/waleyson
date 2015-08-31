<%-- 
    Document   : countryPro
    Created on : Sep 27, 2014, 9:43:46 PM
    Author     : AbdHafeez
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>eBallot Application</title>
    </head>
    <body>
        <c:if test="${ empty param.cname}">
            <c:redirect url="..\webpage\country.jsp" >
                <c:param name="errMsg" value="Please country name must not be empty" />
            </c:redirect>
        </c:if>
        <sql:update var="country" dataSource="jdbc/eBallot">
            INSERT INTO eballot.country (cname) VALUES (?)
            <sql:param value="${param.cname}" />
        </sql:update>
        <c:if test="${country>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
                successfully.</font>

            <c:redirect url="..\webpage\countryDisplay.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
                         successfully." />
            </c:redirect>
        </c:if>
    </body>
</html>
