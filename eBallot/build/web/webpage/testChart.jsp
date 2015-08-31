<%-- 
    Document   : testChart
    Created on : Oct 11, 2014, 2:07:44 PM
    Author     : AbdHafeez
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                                String query = "SELECT * from chart";
                                JDBCCategoryDataset dataset = new JDBCCategoryDataset("jdbc:mysql://localhost:3306/eBallot",
                                        "com.mysql.jdbc.Driver", "root", "hafla_123");

                                dataset.executeQuery(query);
                                JFreeChart chart = ChartFactory.createBarChart3D(
                                        "eBallot",
                                        "id",
                                        "value",
                                        dataset,
                                        PlotOrientation.VERTICAL, true, true, false);

                    %>
    </body>
</html>
