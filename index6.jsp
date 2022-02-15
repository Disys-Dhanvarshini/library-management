<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<%
 
    if(request.getParameter("submit")!=null)
    {
    	String isbn = request.getParameter("isbn");
    	 Connection con;
         PreparedStatement st;
      
         
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Welcome123#");
         st = con.prepareStatement("select book_details.book_name from (book_details inner join borrowed_book_details on book_details.isbn = borrowed_book_details.isbn) where borrowed_book_details.isbn =?s");
         st.setString(1,isbn);
         st.setString(2,isbn);
       ResultSet rs= st.executeQuery(); 
    
if(rs.next()){ 
         %>
     <script>  
         alert("Book Not Available");    
     </script>
     <%            
     } else{ %>
     <script>  
     alert("Book Available");    
 </script>
 <%      }}
     
    %>
  
 <link rel="stylesheet" href="lib.css">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DELETE A BOOK</title>
</head>
<body>
<style>
div {
  
  margin-top: 5px;
  margin-bottom: 5px;
  margin-right: 15px;
  margin-left: 20px;
 
}
</style>
<div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" > 
                    
                    <div align="left">
                        <label class="form-label">ENTER THE ISBN</label>
                        <input type="text" class="form-control"  name="isbn" id="isbn" required >
                     </div>
                     <div align="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                     </div>  
                     </form>
                     </div>
                     </div>
</body>
</html>