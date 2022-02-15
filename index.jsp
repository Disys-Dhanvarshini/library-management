<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LIBRARY MANAGEMENT</title>
</head>
<body>
<%
int count=0;
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "library";
String userId = "root";
String password = "Welcome123#";
try {
    Class.forName(driverName);
} catch (Exception e) {
System.out.println(e);
}
Connection con = null;
Statement s = null;
ResultSet resultSet = null;
%>
<link rel="stylesheet" href="lib.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

<%
String name = request.getParameter("isbn1");
try{ 
  con =DriverManager.getConnection(connectionUrl+dbName, userId, password);
  if(con!= null){System.out.println("connected");}
  PreparedStatement st = con.prepareStatement("select book_name,author_name,book_language,Total_Pages from book_details where isbn =?");
  st.setString(1,name); 
 
 resultSet = st.executeQuery();
ResultSetMetaData rsmd = resultSet.getMetaData();%>
<div class="container">
<%if(resultSet.next()){ %>

</br><center><h2><ins>DETAILS OF THE BOOK</ins></h2></center></br>
</br> <table  class="table table-success table-striped" align="center" cellpadding="5" cellspacing="5" border="1" id="book">
<tr>
<td><b>BOOK NAME</b></td>
<td><b>AUTHOR NAME</b></td>
<td><b>BOOK LANGUAGE</b></td>
<td><b>TOTAL NO OF PAGES</b></td>
</tr><%
out.println("<tr>");
out.println("<td>"+resultSet.getString("book_name")+"</td>");
out.println("<td>"+resultSet.getString("author_name")+"</td>");
out.println("<td>"+resultSet.getString("book_language")+"</td>");
out.println("<td>"+resultSet.getInt("Total_Pages")+"</td>");
out.println("<tr>");
} else{%> <script>  
        alert("Book Not Found");    
    </script> <%}
 
} catch (Exception e) {
System.out.println(e);
}

%>
</table>
</div>
</body>
</html>