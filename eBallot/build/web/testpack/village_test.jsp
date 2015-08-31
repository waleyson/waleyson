<%-- 
    Document   : village_test
    Created on : Sep 29, 2014, 5:17:20 PM
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
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eBallot","root","hafla_123");
 Statement stmt = con.createStatement();
 ResultSet rs = stmt.executeQuery("Select * from village where district ='"+states+"' ");
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>";
   }
 buffer=buffer+"</select>";
 response.getWriter().println(buffer);
 con.close();
 }
 catch(Exception e){
     System.out.println(e);
 }
 %>
