<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : regionDisplay
    Created on : Nov 13, 2014, 3:33:28 PM
    Author     : AbdHafeez
--%>



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
                            <li><a href="parliamentaryDisplay.jsp">Member of parliament setup</a></li>
                            <li><a href="presidentDisplay.jsp">Presidential setup</a></li>
                            <li><a href="partyDisplay.jsp">Party setup</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Election operations setup</a>
                        <ul>
                            <li><a href="voteparlDisplay.jsp">Member of parliament Result</a></li>
                            <li><a href="votepresDisplay.jsp">Presidential result</a></li>
                            <li><a href="coalition_centreDisplay.jsp">Coalition center setup</a></li>
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
        <div class="grid-10 grid">
            <sql:query var="result" dataSource="jdbc/eBallot">
                select * from parliamentary
            </sql:query>
            <c:if test="${ empty sessionScope['login']}">
                <c:redirect url="login.jsp"/>
            </c:if>
            <a href="login.jsp">Welcome
            <c:out value="${sessionScope['login']}" />!  Logout
            </a>
            <h2>List of Member of Parliamentary setup in eBallot Database</h2>
            <p><label for="name">
                    <font color="red"><c:if test="${not empty param.errMsg}">
                            <c:out value="${param.errMsg}" />
                        </c:if></font>
                    <font color="green"><c:if test="${not empty param.susMsg}">
                            <c:out value="${param.susMsg}" />
                        </c:if></font>
                </label></p>
            <table>
                <thead>
                    <tr>
                <a class="button" href="parliamentary.jsp">Add Parliamentary Candidate</a>
                </tr>
                <tr>
                    <th scope="col">&nbsp;</th>
                    <th scope="col">Mem. of Parl. ID</th>
                    <th scope="col">Mem. of Parl. Name</th>
                    <th scope="col">Party</th>
                    <th scope="col">Region</th>
                    <th scope="col">District</th>
                    <th scope="col">Constituency</th>
                    <th scope="col">Electoral Area</th>
                    <th scope="col">Polling Boot</th>
                    <th scope="col">Position</th>
                    <th scope="col" colspan="2">&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${result.rowsByIndex}">
                        <tr>
                    <form action="../MVC/respParl.jsp" method="POST">
                        <th scope="row" ><input type="checkbox" name="selected" value="${row[0]}"></th>

                        <c:forEach var="column" items="${row}">
                            <td><c:out value="${column}"/></td>
                        </c:forEach>

                        <th scope="row">
                            <input type="submit" name="delete" value="Delete" onclick="javascript:return confirm('Are you sure you want to delete this user?')"/>
                        </th>
                        <th scope="row">
                            <input type="submit" name="update" value="Edit"/>
                        </th>
                    </form>

                    </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                    <tr><td colspan="12">&nbsp;</td></tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
