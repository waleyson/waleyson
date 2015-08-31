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
        <c:if test="${ empty param.first_name
              && empty param.last_name
              && empty param.Surname
              && empty param.dob
              && empty param.gender
              }">
            <c:redirect url="..\webpage\voterReg.jsp" >
                <c:param name="errMsg" value="Please candidate name must not be empty" />
            </c:redirect>
        </c:if>
        
        <sql:update var="voterReg" dataSource="jdbc/eBallot">
            INSERT INTO eballot.voter (first_name, last_name, address, `Surname`, region, profession_school, gender, dob, maidname, nationality, pob, home_town)
	VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)
            <sql:param value="${param.first_name}" />
            <sql:param value="${param.last_name}" />
            <sql:param value="${param.address}" />
            <sql:param value="${param.Surname}" />
            <sql:param value="${param.state}" />
            <sql:param value="${param.profession_school}" />
            <sql:param value="${param.gender}" />
            <sql:param value="${param.dob}" />
            <sql:param value="${param.maidname}" />
            <sql:param value="${param.country}" />
            <sql:param value="${param.pob}" />
            <sql:param value="${param.home_town}" />
        </sql:update>
            <c:if test="${voterReg>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>

            <c:redirect url="..\webpage\voterReg.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if>
        <c:if test="${voterReg<1}">
            <font size="5" color='red'> Please check and correct the missing data below.</font>

            <c:redirect url="..\webpage\voterReg.jsp" >
                <c:param name="errMsg" value="Please check and correct the missing data below." />
            </c:redirect>
        </c:if>
    </body>
</html>
