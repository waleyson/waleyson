<%-- 
    Document   : parl_vote_test
    Created on : Oct 15, 2014, 5:20:07 PM
    Author     : AbdHafeez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%
String master_id=request.getParameter("counts");
 String buffer="<select name='boot' ><option value='-1'>Select</option>";
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();
 //Connection con = DriverManager.getConnection("jdbc:mysql://mysql80855-eBalot.j.layershift.co.uk:3306/eBallot","eballot","hafla_123");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eBallot","root","hafla_123");
 Statement stmt = con.createStatement();
 ResultSet rs = stmt.executeQuery("Select name from parliamentary where master_id ='"+master_id+"' ");
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>";
   }
 buffer=buffer+"</select>";
 response.getWriter().println(buffer);
 con.close();
 }
 catch(Exception e){
     System.out.println(e);
 }
 %>
