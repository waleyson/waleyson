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
                SELECT * FROM presidential where pre_id = ? <sql:param value="${param.selected}"/>
            </sql:query>
            <c:redirect url="..\webpage\updatePresident.jsp">
                <c:forEach var="row" items="${result.rows}">
                    <c:param name="pre_id" value="${param.selected}"/>
                    <c:param name="name" value="${row.name}"/>
                    <c:param name="position" value="${row.position}"/>
                    <c:param name="party_name" value="${row.party_name}"/>
                </c:forEach>
            </c:redirect>
        </c:if>
            <c:if test="${not empty param.delete}">
                <c:redirect url="..\webpage\presidentDisplay.jsp">
                <sql:update var="del" dataSource="jdbc/eBallot">
                DELETE FROM presidential
                WHERE pre_id = ? <sql:param value="${param.selected}"/>
            </sql:update>
                </c:redirect>
            </c:if>

       <c:if test="${ empty param.name && empty param.party_name && empty param.position}">
         <c:redirect url="..\webpage\updatePresident.jsp" >
                <c:param name="errMsg" value="Please select the correct data" />
            </c:redirect>
        </c:if>

        

            <sql:update var="updateC" dataSource="jdbc/eBallot">
            UPDATE presidential
            SET name = ?, position = ?, party_name = ?
            WHERE pre_id = '${param.pre_id}'
            <sql:param value="${param.name}" />
            <sql:param value="${param.position}" />
            <sql:param value="${param.party_name}" />
        </sql:update>
            <c:choose>
                <c:when test="${updateC >= 1}">
                   <c:redirect url="..\webpage\presidentDisplay.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
                </c:when>
                <c:otherwise>
                    <c:redirect url="..\webpage\updatePresident.jsp" >
                <c:param name="errMsg" value="Error ! Please check the data for correction." />
                    <c:param name="pre_id" value="${param.pre_id}"/>
                    <c:param name="name" value="${param.name}"/>
                    <c:param name="position" value="${param.position}" />
                    <c:param name="party_name" value="${param.party_name}"/>
                    </c:redirect>
                </c:otherwise>
            </c:choose>
    </body>
</html>