<%-- 
    Document   : deletetest
    Created on : Nov 18, 2014, 3:06:25 PM
    Author     : AbdHafeez
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>DELETE Operation</title>
<script type="text/javascript">
function deleteEmployee(rowid){
input_box = confirm("Are you sure you want to delete this Record?");
if (input_box == true) {
    // Output when OK is clicked
    $.ajax({
    url : 'http://localhost:8080/eBallot/webpage/countryDisplay.jsp'+rowid,
    type : "POST",
    async : false,
    success : function() {
        $('#' + rowid).remove();
        alert('Record Deleted');
    }
       });

return false;
} else {
    // Output when Cancel is clicked
    return false;
}
  }
</script>
</head>
<body>

  <sql:update var="count" scope="session" dataSource="jdbc/eBallot">
      DELETE FROM country
      WHERE c_id = ?
      <sql:param value="${c_id}" />
  </sql:update>
<table border="1" width="100%">
<tr>
   <th></th>
   <th>Emp ID</th>
   <th>Country Name</th>

</tr>
<sql:query var="result" dataSource="jdbc/eBallot">
    SELECT column_name(s) FROM table_name
</sql:query>

<c:forEach var="row" items="${count.rowsByIndex}">
<form method="post" action="deletetest.jsp">
<tr id="${row.c_id}">
    <td><input type ="checkbox" value="${row.c_id}"></td>
    <td><c:out value="${row.c_id}"/></td>
    <td><c:out value="${row.cname}"/></td>
</tr>
</form>
</c:forEach>
<input type="button" value="delete" onclick="deleteEmployee('${row.c_id}');" />
</table>

</body>
</html>


<table>

</table>

