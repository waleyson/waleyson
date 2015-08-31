<%-- 
    Document   : coalition_centre
    Created on : Sep 16, 2014, 11:11:51 AM
    Author     : AbdHafeez
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="master_id" dataSource="jdbc/eBallot">
    SELECT master_id FROM polling_boot
</sql:query>

<sql:query var="candidate_id" dataSource="jdbc/eBallot">
    SELECT candidate_id FROM candidate
</sql:query>

<sql:query var="station" dataSource="jdbc/eBallot">
    SELECT station FROM polling_boot where master_id = ?
    <sql:param value="${param.userid}" />
</sql:query>

<c:set var="station" value="${counselorQuery.rows[0]}"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<script language="javascript" type="text/javascript" src="../script/state.js">
</script>
<script type="text/javascript" src="../script/district.js" ></script>
<div class="wrapper">

    <div class="grids top">

        <div class="grid-6 grid">
            <div class="green bottom">
                <h3>Quick Links</h3>
                <ul id="nav" class="dropdown cf"> <!-- Apply the clearfix so we can remove the overflow:hidden; later on. -->
                    <li><a href="index.jsp">Home</a></li>
                   <div class="green bottom">
                
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
                            <li><a href="presidentDispplay.jsp">Presidential setup</a></li>
                            <li><a href="partyDispplay.jsp">Party setup</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Election operations setup</a>
                        <ul>
                            <li><a href="voteparlDisplay.jsp">Member of parliament Result</a></li>
                            <li><a href="votepresDisplay.jsp">Presidential result</a></li>\
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
            <h4>Please Enter City/Town/Village Information Here</h4>
            <label for="name">
                <font color="red"><c:if test="${not empty param.errMsg}">
                        <c:out value="${param.errMsg}" />
                        <a href="setup.jsp">Go Back</a>
                    </c:if></font>
                <font color="green"><c:if test="${not empty param.susMsg}">
                        <c:out value="${param.susMsg}" />
                        <a href="index.jsp">Goto Home Page</a>
                    </c:if></font>
            </label>
            <form name="population"
                  action="${pageContext.request.contextPath}/coalition_centrePro.jsp"
                  method="POST">
                <table class="form">
                    
                    <tr>
                        <td>Select Coalition Center Location</td>
                        <td><select name="master_id">
                                <c:forEach var="row" items="${master_id.rowsByIndex}">

                                    <c:forEach var="column" items="${row}">
                                        <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                    </c:forEach>

                                </c:forEach>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Select Candidate ID</td>
                        <td><select name="candidate_id" class="input_small">
                                <c:forEach var="row" items="${candidate_id.rowsByIndex}">

                                    <c:forEach var="column" items="${row}">
                                        <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                    </c:forEach>
                                </c:forEach>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Select Coalition Station</td>
                        <td><select name="station">
                                <c:forEach var="row" items="${station.rowsByIndex}">

                                    <c:forEach var="column" items="${row}">
                                        <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                    </c:forEach>
                                </c:forEach>
                            </select></td>
                    </tr>
                    <tr>
                        <td colspan="2"><center><input type="submit" value="Submit" />
                                <input type="reset" value="Reset" /></center></td>
                    </tr>
                </table>
            </form>

            <p>(You can of course create your own CSS to style the tables for forms
                and hide the borders, for example, like shown here.)</p>

        </div><!--end of grid-10-->
    </div><!--end of grids-->
</div><!--end of wrapper-->
