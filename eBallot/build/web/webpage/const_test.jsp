<%-- 
    Document   : const_test
    Created on : Oct 15, 2014, 2:00:52 PM
    Author     : AbdHafeez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%
String master_id = request.getParameter("counts");
 String buffer="<label name='consts' >";
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();
 Connection con = DriverManager.getConnection("jdbc:mysql://mysql80855-eBalot.j.layershift.co.uk:3306/eBallot","eballot","hafla_123");
 //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eBallot","root","hafla_123");
 Statement stmt = con.createStatement();
 ResultSet rs = stmt.executeQuery("Select * from master where master_id ='"+master_id+"' ");
   while(rs.next()){
   buffer=buffer+rs.getString(2);
   }
 buffer=buffer+"</label>";
 response.getWriter().println(buffer);
 con.close();
 }
 catch(Exception e){
     System.out.println(e);
 }
 %>
