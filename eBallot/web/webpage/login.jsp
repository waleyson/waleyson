<%-- 
    Document   : login
    Created on : Sep 16, 2014, 11:09:31 AM
    Author     : AbdHafeez
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <li>
                    <a href="#">About</a>
                    <ul>
                        <li><a href="#">About us</a></li>
                        <li><a href="#">The board</a></li>
                    </ul>
                </li>
                <li><a href="#">Electoral system</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
            </div>
        </div>
        <!--===============================================================  Contact form =====================================================================================-->
        <div class="grid-10 grid">
            <h4>Please Login Here</h4>
            <label for="name">
                <font color="red"><c:if test="${not empty param.errMsg}">
                        <c:out value="${param.errMsg}" />
                    </c:if></font>
                
            </label>
                    <form method="post" action="../MVC/loginPro.jsp" method="post">
                <table class="form">
                    <tr>
                        <th>

                        </th>
                    </tr>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="userid" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" />
                            <input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <!--<td colspan="2">Yet Not Registered!! <a href="#">Register Here</a></td> -->
                    </tr>
                </table>
            </form>
        </div><!--end of grid-10-->
    </div><!--end of grids-->
</div><!--end of wrapper-->
