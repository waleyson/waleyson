
<%--
    Document   : voterReg
    Created on : Sep 19, 2014, 5:49:50 PM
    Author     : AbdHafeez
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:query var="country" dataSource="jdbc/eBallot">
    SELECT cname  FROM country
</sql:query>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<script language="javascript" type="text/javascript" src="../script/state.js">

</script>
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
                            <li><a href="userControl.jsp">Polling station setup</a></li>

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

        <!--===============================================================  Contact form =====================================================================================-->
        <div class="grid-10 grid">
            <h4>Please Enter Your Information Here</h4>
            <label for="name" name="display"></label>
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
            
        </div><!--end of grid-10-->
    </div><!--end of grids-->

</div><!--end of wrapper-->


            