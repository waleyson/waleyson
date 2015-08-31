<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
    Document   : deleteData
    Created on : Oct 22, 2014, 6:29:15 PM
    Author     : AbdHafeez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${empty param.selected}">
            <c:redirect url="..\webpage\countryDisplay.jsp">
                <c:param name="errMsg" value="Please selected which data to delete!"/>
            </c:redirect>
        </c:if>
    <sql:update var="del" dataSource="jdbc/eBallot">
        DELETE FROM country
        WHERE c_id = ? <sql:param value="${param.selected}"/>
    </sql:update>
    <c:if test="${del >= 1}">
        <c:redirect url="..\webpage\countryDisplay.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data deleted
            successfully." />
            </c:redirect>
    </c:if>

    </body>
</html>
