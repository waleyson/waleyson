<%-- 
    Document   : president
    Created on : Sep 30, 2014, 9:13:16 PM
    Author     : AbdHafeez
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:query var="party" dataSource="jdbc/eBallot">
    select party_id from party
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<div class="wrapper">

    <div class="grids top">

        <div class="grid-6 grid">
            <div class="green bottom">
                <h3>Quick Links</h3>
                <ul id="nav" class="dropdown cf"> <!-- Apply the clearfix so we can remove the overflow:hidden; later on. -->
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="voterReg.jsp">Master Voter Registration</a></li>
                    <li>
                        <a href="#">General setup</a>
                        <ul>
                            <li><a href="countryDisplay.jsp">Country setup</a></li>
                            <li><a href="regionDisplay.jsp">Region setup</a></li>
                            <li><a href="districtDisplay.jsp">District setup</a></li>
                            <li><a href="constituencyDisplay.jsp">Constituency setup</a></li>
                            <li><a href="electAreaDisplay.jsp">Electoral Area setup</a></li>
                            <li><a href="villageDisplay.jsp">Village setup</a></li>
                            <li><a href="polling_bootDisplay.jsp">Polling station setup</a></li>
                            <li><a href="userControl.jsp">User admin setup</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Operational setup</a>
                        <ul>
                            <li><a href="parliamentaryDispplay.jsp">Member of parliament setup</a></li>
                            <li><a href="partyDispplay.jsp">Party setup</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Election operations setup</a>
                        <ul>
                            <li><a href="voteparlDisplay.jsp">Member of parliament Result</a></li>
                            <li><a href="votepresDisplay.jsp">Presidential result</a></li>
                            <li><a href="coalition_centre.jsp">Coalition center setup</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Electoral system</a></li>
                    <li><a href="#">Contact</a></li>
                    <li>
                        <a href="#">About</a>
                        <ul>
                            <li><a href="#">About us</a></li>
                            <li><a href="#">The board</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>

        <!--===============================================================  Contact form =====================================================================================-->
        <div class="grid-10 grid">
            <h4>Please enter presidential candidate Information Here</h4>
            <label for="name">
                                <font color="red"><c:if test="${not empty param.errMsg}">
                                        <c:out value="${param.errMsg}" />
                                    </c:if></font>
                                <font color="green"><c:if test="${not empty param.susMsg}">
                                        <c:out value="${param.susMsg}" />
                                    </c:if></font>
                            </label>
            <form name="village"
                  action="${pageContext.request.contextPath}/MVC/presidentPro.jsp"
                  method="POST">
                <table class="form">
                    <tr>
                        <th>
                            
                        </th>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Party ID</td>
                        <td><select name="party">
                                <c:forEach var="row" items="${party.rowsByIndex}">
                                    <c:forEach var="column" items="${row}">
                                        <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                    </c:forEach>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><center><input type="submit" value="Submit" />
                                <input type="reset" value="Reset" /></center></td>
                    </tr>
                </table>
            </form>

        </div><!--end of grid-10-->
    </div><!--end of grids-->
</div><!--end of wrapper-->