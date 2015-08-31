<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%-- 
    Document   : loginPro
    Created on : Sep 27, 2014, 4:14:56 PM
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
    <body><c:if test="${ empty param.userid
                         && empty param.password}">
              <c:redirect url="..\webpage\login.jsp" >
                  <c:param name="errMsg" value="Please userid or password is incorrect" />
              </c:redirect>
          </c:if>
          <sql:query var="result" dataSource="jdbc/eBallot">
              SELECT * FROM user where userid = ? and password = ?
              <sql:param value="${param.userid}" />
              <sql:param value="${param.password}" />
          </sql:query>
          <c:choose>
              <c:when test="${result.rowCount == 0}">
                  <c:redirect url="..\webpage\login.jsp">
                      <c:param name="errMsg" value="Please userid or password is incorrect" />
                  </c:redirect>
              </c:when>
              <c:otherwise>
                  <c:forEach var="row" items="${result.rows}">
                  <c:choose>
                      <c:when test="${row.previlege == 'user'}">
                          <c:redirect url="..\webpage\index.jsp">
                              <c:set var="login" scope="session" value="${row.firstname}"/>
                          </c:redirect>
                      </c:when>
                      <c:otherwise>
                          <c:redirect url="..\webpage\countryDisplay.jsp">
                              <c:set var="login" scope="session" value="${row.firstname}"/>
                          </c:redirect>
                      </c:otherwise>
                  </c:choose>
                  </c:forEach>
              </c:otherwise>
          </c:choose>
    </body>
</html>
