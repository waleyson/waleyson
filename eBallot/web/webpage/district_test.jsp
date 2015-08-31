<%-- 
    Document   : region_test
    Created on : Sep 28, 2014, 11:57:33 AM
    Author     : AbdHafeez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%
String states =request.getParameter("counts");
 String buffer="<select name='district' ><option value='-1'>Select</option>";
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();
 //Connection con = DriverManager.getConnection("jdbc:mysql://mysql80855-eBalot.j.layershift.co.uk:3306/eBallot","eballot","hafla_123");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eBallot","root","hafla_123");
 Statement stmt = con.createStatement();
 ResultSet rs = stmt.executeQuery("Select * from district where region ='"+states+"' ");
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(2)+"'>"+rs.getString(2)+"</option>";
   }
 buffer=buffer+"</select>";
 response.getWriter().println(buffer);
 con.close();
 }
 catch(Exception e){
     System.out.println(e);
 }
 %>
