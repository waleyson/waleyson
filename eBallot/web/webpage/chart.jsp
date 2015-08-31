<%--
    Document   : constituency_test
    Created on : Sep 28, 2014, 11:57:33 AM
    Author     : AbdHafeez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>
<%@ page import="org.jfree.data.*" %>
<%@ page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>
<%@page  import="org.jfree.chart.ChartRenderingInfo"%>
<%@page  import="org.jfree.chart.entity.StandardEntityCollection" %>

<%

 String buffer="<select name='constituy' ><option value='-1'>Select</option>";
 try{
String myview = request.getParameter("constituency");
 Class.forName("com.mysql.jdbc.Driver").newInstance();
 //Connection con = DriverManager.getConnection("jdbc:mysql://mysql80855-eBalot.j.layershift.co.uk:3306/eBallot","eballot","hafla_123");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eBallot","root","hafla_123");
 JDBCCategoryDataset dataset = new JDBCCategoryDataset(con);

            dataset.executeQuery("Select parl_name, vote_count  From voteparl where master_name = '"+myview+"'order by vote_count desc");
            JFreeChart chart = ChartFactory.createBarChart("eBallot -  Parliamentary Result for", null, null, dataset, PlotOrientation.HORIZONTAL, true, true, false);
            //createBarChart3D(, null, null, dataset)createChart("eBallot - Revenue Chart", dataset, true, true, false);
            //JFreeChart chart = ChartFactory.createChart("eBallot - Revenue Chart", dataset, true, true, false);
            final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
                response.setContentType("image/jpeg");
                OutputStream out1 = response.getOutputStream();
                ChartUtilities.writeChartAsPNG(out1, chart, 500, 400, info);
                //File pieChart = new File( "parlChart.jpeg" );
                //ChartUtilities.saveChartAsJPEG( new File("parlChart.jpeg") , chart , 500 , 400 );
                ChartUtilities.saveChartAsPNG(new File("C:/Users/AbdHafeez/Documents/eBallot/web/mychart.png"), chart, 400, 300);
                //response.getWriter().println("<img src='../webpage/chart.jsp' width='500' height='400' id='mychart'>");
                response.sendRedirect("ParlResult.jsp");
                con.close();
        }
        catch (IOException e){
        System.out.println("Problem in creating chart.");
        
     }
 response.sendRedirect("result.jsp");
%>

