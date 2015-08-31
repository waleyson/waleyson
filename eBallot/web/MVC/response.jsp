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
                SELECT cname FROM country where c_id = ? <sql:param value="${param.selected}"/>
            </sql:query>
            <c:redirect url="..\webpage\updateCountry.jsp">
                <c:forEach var="row" items="${result.rows}">
                    <c:param name="countryID" value="${param.selected}"/>
                    <c:param name="cname" value="${row.cname}"/>
                </c:forEach>
            </c:redirect>
        </c:if>
            <c:if test="${not empty param.delete}">
                <c:redirect url="..\webpage\countryDisplay.jsp">
                <sql:update var="del" dataSource="jdbc/eBallot">
                DELETE FROM country
                WHERE c_id = ? <sql:param value="${param.selected}"/>
            </sql:update>
                </c:redirect>
            </c:if>

       <c:if test="${ empty param.cname}">
         <c:redirect url="..\webpage\updateCountry.jsp" >
                <c:param name="errMsg" value="Please select the correct gender" />
            </c:redirect>
        </c:if>

        <sql:update var="updateC" dataSource="jdbc/eBallot">
            UPDATE country
            SET cname = ? 
            WHERE c_id = '${param.countryID}'
             <sql:param value="${param.cname}" />
        </sql:update>

        <c:if test="${updateC >= 1}">
                <c:redirect url="..\webpage\countryDisplay.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if>
    </body>
</html>
