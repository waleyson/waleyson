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
                SELECT * FROM region where region_id = ? <sql:param value="${param.selected}"/>
            </sql:query>
            <c:redirect url="..\webpage\updateRegion.jsp">
                <c:forEach var="row" items="${result.rows}">
                    <c:param name="region_id" value="${param.selected}"/>
                    <c:param name="region_name" value="${row.region_name}"/>
                    <c:param name="description" value="${row.description}"/>
                    <c:param name="cname" value="${row.cname}"/>
                </c:forEach>
            </c:redirect>
        </c:if>
            <c:if test="${not empty param.delete}">
                <c:redirect url="..\webpage\regionDisplay.jsp">
                <sql:update var="del" dataSource="jdbc/eBallot">
                DELETE FROM region
                WHERE region_id = ? <sql:param value="${param.selected}"/>
            </sql:update>
                </c:redirect>
            </c:if>

       <c:if test="${ empty param.cname && empty param.region_name && empty param.description}">
         <c:redirect url="..\webpage\updateRegion.jsp" >
                <c:param name="errMsg" value="Please select the correct data" />
            </c:redirect>
        </c:if>

        <sql:update var="updateC" dataSource="jdbc/eBallot">
            UPDATE region
            SET region_name = ?, description = ?, cname = ?
            WHERE region_id = '${param.region_id}'
            <sql:param value="${param.region_name}" />
            <sql:param value="${param.description}" />
            <sql:param value="${param.cname}" />
        </sql:update>
        <c:if test="${updateC >= 1}">
                <c:redirect url="..\webpage\regionDisplay.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if>
    </body>
</html>