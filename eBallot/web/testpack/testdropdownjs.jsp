<%-- 
    Document   : testdropdownjs
    Created on : Sep 29, 2014, 2:48:36 PM
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
    <body>
        <form name="formTripleMenu" id="formTripleMenu" action="">

            <table bgcolor="#0000A0" border="1">

                <tr>

                    <td colspan="3" width="528">

                        <strong>

                            <font size="2" color="#FFFFFF">

                                To explore self

                                development and computer stuff: - choose a topic from the drop-down box on the left, then

                                a subject from the box in the middle. And finally choose a page from the drop down menu on

                                the right.

                            </font>

                        </strong>

                    </td>

                </tr>

                <tr>

                    <td valign="top" align="center" width="171">

                        <div align="center">

                            <center>

                                <p>

                                    <small>

                                        <strong>

                                            <font color="#ffffff">

                                                Select a topic ...

                                            </font>

                                        </strong>

                                    </small>
                                </p>
                            </center>
                        </div>

                    </td>

                    <td valign="top" align="center" width="176">

                        <small>

                            <strong>

                                <font color="#FFFFFF">

                                    ... then

                                    a subject ...

                                </font>

                            </strong>

                        </small>

                    </td>

                    <td valign="top" align="center" width="169">

                        <small>

                            <strong>

                                <font color="#FFFFFF">

                                    ... and

                                    then a page to go ...

                                </font>

                            </strong>

                        </small>

                    </td>

                </tr>

                <tr align="center">

                    <td width="171" valign="top" align="center">

                        <!-- ####################### start of select containing topics ####################### -->

                        <select name="menuTopics" id="menuTopics" onchange="changeSubjects()" size="1">

                            <option value="none">

                                Topics appear here

                            </option>

                            <option value="none">

                                Computer Stuff

                            </option>

                            <option value="none">

                                Self Development

                            </option>

                            <option value="none">

                                Computer Software

                            </option>

                        </select>

                    </td>

                    <td width="176" valign="top" align="center">

                        <!-- ####################### start of select contaning subjects ####################### -->

                        <select name="menuSubjects" id="menuSubjects" onchange="changeFiles()" size="1">

                            <option value="none">

                                Subjects appear here

                            </option>

                        </select>

                    </td>

                    <td width="169" valign="top" align="center">

                        <!-- ####################### start of select containing pages ####################### -->

                        <select name="menuFiles" id="menuFiles" onchange="go(this)" size="1">

                            <option value="none">

                                Pages appear here

                            </option>

                        </select>

                    </td>

                </tr>

            </table>

        </form>
    </body>
</html>
