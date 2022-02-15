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

%>
<link rel="stylesheet" href="lib.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>


<%
String name = request.getParameter("Student_libraryno");
try{ 
  con =DriverManager.getConnection(connectionUrl+dbName, userId, password);
  if(con!= null){System.out.println("connected");}
  PreparedStatement st = con.prepareStatement("select student_details.Student_name,book_details.isbn,book_details.book_name from ((borrowed_book_details inner join book_details on borrowed_book_details.isbn = book_details.isbn) inner join student_details on borrowed_book_details.borrower_id = student_details.Student_libraryno) where borrowed_book_details.borrower_id = ?");
  st.setString(1,name); 
ResultSet resultSet = st.executeQuery();
ResultSetMetaData rsmd = resultSet.getMetaData(); %>
<div class="container">
<%if(resultSet.next()){ %>
</br><center><h2>BOOKS BORROWED BY THE STUDENT</h2></center></br>
</br><table class="table table-dark table-striped" align="center" cellpadding="5" cellspacing="5" border="1">
<tr>
<td><b>STUDENT NAME</b></td>
<td><b>ISBN</b></td>
<td><b>BOOK NAME</b></td>
</tr><%

out.println("<tr>");
out.println("<td>"+resultSet.getString("Student_name")+"</td>");
out.println("<td>"+resultSet.getInt("isbn")+"</td>");
out.println("<td>"+resultSet.getString("book_name")+"</td>");
out.println("<tr>");
  }
else{ %> <script>  
alert("STUDENT HAVEN'T BORROWED ANY BOOK");    
</script> <%}
} catch (Exception e) {
System.out.println(e);
}
%>
</table>
</div>
</body>
</html>
