<%-- 
    Document   : village
    Created on : Sep 28, 2014, 8:35:03 PM
    Author     : AbdHafeez
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<script type="text/javascript" src="../script/constituency.js" ></script>
<sql:query var="country" dataSource="jdbc/eBallot">
    SELECT cname  FROM country
</sql:query>
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
                    <li><a href="voterReg.jsp">Master Voter Registration</a></li>
                    <li>
                        <a href="#">General setup</a>
                        <ul>
                            <li><a href="countryDisplay.jsp">Country setup</a></li>
                            <li><a href="regionDisplay.jsp">Region setup</a></li>
                            <li><a href="districtDisplay.jsp">District setup</a></li>
                            <li><a href="polling_bootDisplay.jsp">Constituency setup</a></li>
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

        <!--===============================================================  Contact form =====================================================================================-->
        <div class="grid-10 grid">
            <h4>Please Enter Electoral Area Information Here</h4>
            <label for="name">
                                <font color="red"><c:if test="${not empty param.errMsg}">
                                        <c:out value="${param.errMsg}" />
                                    </c:if></font>
                                <font color="green"><c:if test="${not empty param.susMsg}">
                                        <c:out value="${param.susMsg}" />
                                    </c:if></font>
                            </label>
            <form name="village"
                  action="${pageContext.request.contextPath}/MVC/electAreaPro.jsp"
                  method="POST">
                <table class="form">
                    <tr>
                        <th>
                            
                        </th>
                    </tr>
                    <tr>
                        <td>Electoral Area</td>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Population</td>
                        <td><input type="text" name="pop" value="" /></td>
                    </tr>
                    <tr>
                        <td>Country Name</td>

                        <td><select name='country' id="country" onchange="showState(this.value, state)">
                                <option value="none">Select</option>
                                <c:forEach var="row" items="${country.rowsByIndex}">

                                    <c:forEach var="column" items="${row}">
                                        <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                    </c:forEach>
                                </c:forEach>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Region Name</td>

                        <td>
                            <select name='state' id="state" onchange="showDistrict(this.value, district)">
                                <option value='-1'></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>District Name</td>

                        <td>
                            <select name='district' id="district" onchange="showConstituency(this.value, constituency)">
                                <option value='-1'></option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Constituency Name</td>
                        <td><div id='constituency'>
                                <select name="constituency" >
                                    <option value='-1'></option>
                                </select>
                            </div></td>
                    </tr>
                    <tr>
                        <td colspan="2"><center><p><input class="button" type="submit" value="Submit" />
                                <input type="reset" value="Reset" class="button" /></p></center></td>
                    </tr>
                </table>
            </form>
        </div><!--end of grid-10-->
    </div><!--end of grids-->
</div><!--end of wrapper-->

