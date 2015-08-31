
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

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <script>
  $(function() {
    $( "#datepicker" ).datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true
    });
  });
  </script>
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
                            <li><a href="villageDisplay.jsp">Village setup</a></li>
                            <li><a href="polling_bootDisplay.jsp">Polling station setup</a></li>

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
            <label for="name" name="display">
                <font color="red"><c:if test="${not empty param.errMsg}">
                        <c:out value="${param.errMsg}" />  
                    </c:if></font>
                <font color="green"><c:if test="${not empty param.susMsg}">
                        <c:out value="${param.susMsg}" />
                    </c:if></font>
            </label>
            <form name="voter"
                  action="${pageContext.request.contextPath}/MVC/voterRegPro.jsp"
                  method="POST">
                <table class="form">
                    <tr>
                        <th>

                        </th>
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="first_name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Middle Name</td>
                        <td><input type="text" name="last_name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Surname</td>
                        <td><input type="text" name="Surname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Mother's Maid Name</td>
                        <td><input type="text" name="maidname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td><input id="datepicker" name="dob"/></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td><select name="gender">
                                <option></option>
                                <option>Male</option>
                                <option>Female</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" name="address" value="" /></td>
                    </tr>
                    <tr>
                        <td>Nationality</td>
                        <td><select name='country' onchange="showState(this.value)">
                                <option value="none">Select</option>
                                <c:forEach var="row" items="${country.rowsByIndex}">

                                    <c:forEach var="column" items="${row}">
                                        <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                    </c:forEach>

                                </c:forEach>

                            </select></td>
                    </tr>
                    <tr>
                        <td>Region</td>
                        <td><div id='state'>
                                <select name='state' >
                                    <option value='-1'></option>
                                </select>
                            </div></td>
                    </tr>
                    <tr>
                        <td>Place Of Birth</td>
                        <td><input type="text" name="pob" value="" /></td>
                    </tr>
                    <tr>
                        <td>Home Town</td>
                        <td><input type="text" name="home_town" value="" /></td>
                    </tr>
                    <tr>
                        <td>Profession/School</td>
                        <td><input type="text" name="profession_school" value="" /></td>
                    </tr>

                    <tr>
                        <td colspan="2"><center><input type="submit" value="Submit" />
                                <input type="reset" value="Reset" /></center></td>
                    </tr>
                    <tr>
                        <td colspan="2">Already registered!! <a href="#">Login Here</a></td>
                    </tr>
                </table>
            </form>

                  <form name="upload" action="../upload" method="POST" enctype="multipart/form-data">
                <table class="form">
                    <tr>
                        <td>Please Upload Voters</td>
                        <td><input type="file" name="file" value="" /><input type="submit" value="upload" /></td>
                    </tr>
                    
                </table>
            </form>
        </div><!--end of grid-10-->
    </div><!--end of grids-->

</div><!--end of wrapper-->
