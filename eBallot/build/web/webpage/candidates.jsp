<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : candidates
    Created on : Sep 16, 2014, 11:11:02 AM
    Author     : AbdHafeez
--%>
<sql:query var="party_id" dataSource="jdbc/eBallot">
    select party_id from party
</sql:query>
<sql:query var="master_id" dataSource="jdbc/eBallot">
    SELECT master_id FROM master
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<div class="wrapper">

    <div class="grids top">

        <div class="grid-6 grid">
            <h2>Voter Registration</h2>
            <div class="green bottom">
                <h3>Formalize</h3>
                <p>This subpage includes the great JQuery plugin <strong>
                        <a href="http://formalize.me/" title="Formalize Website">Formalize</a></strong>
                    by Nathan Smith.
                    <a href="http://formalize.me/" title="Formalize Website">Visit the website</a> to find out what it does and see the demos!
                    You don´t have to use a table as shown here (this is just an example), you can build your form without tables, too.
                    Inspect the CSS to utilize the classes that fit your needs.<br />
                    Comment or delete the section "Forms" in inuit.css when you make use of Formalize so the styles won´t interfere.
                </p>
            </div>

            <div>
                <p class="message warning bottom">
                    <b>Note:</b> This is just a demo for contact form styles and behaviour. <b>It doesn't actually submit anything.</b>
                    To make it work, you will have to include a fitting script.
                </p>
            </div>
        </div>

        <!--===============================================================  Contact form =====================================================================================-->
        <div class="grid-10 grid">
            <t2>Please Enter Candidate Information Here</t2>
            <form name="candidate"
              action="${pageContext.request.contextPath}/candidatePro.jsp"
              method="POST">
                <table class="form">
                    <tr>
                        <th>
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
                        </th>
                    </tr>
                    <tr>
                            <td>Select Candidate Location</td>
                            <td><select name="master_id">
                                    <c:forEach var="row" items="${master_id.rowsByIndex}">

                                        <c:forEach var="column" items="${row}">
                                            <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                        </c:forEach>

                                    </c:forEach>
                                </select></td>
                        </tr>
                        <tr>
                            <td>Candidate Name</td>
                            <td><input type="text" name="name" value="" /></td>
                        </tr>
                        <tr>
                            <td>Select Candidate Type</td>
                            <td>
                                <input type="radio" name="position" value="Presidential" checked="checked"/>
                                <input type="radio" name="position" value="Parliamentary" />
                            </td>
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

