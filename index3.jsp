<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%
 
    if(request.getParameter("submit")!=null)
    {
    	String isbn = request.getParameter("isbn");
        String book_name = request.getParameter("bname");
        String author_name = request.getParameter("aname");
        String category = request.getParameter("category");
        String book_language = request.getParameter("language");
        String pages = request.getParameter("pages");
        
        Connection con;
        PreparedStatement st;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Welcome123#");
        st = con.prepareStatement("insert into book_details(isbn,book_name,author_name,category,book_language,Total_Pages)values(?,?,?,?,?,?)");
        st.setString(1,isbn);
        st.setString(2,book_name);
        st.setString(3,author_name);
        st.setString(4,category);
        st.setString(5,book_language);
        st.setString(6,pages);
        st.executeUpdate();  
        
        %>
    <script>  
        alert("Record Added");    
    </script>
    <%            
    }
    
   %>
 
<link rel="stylesheet" href="lib.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD A BOOK</title>
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
                         
                    <div align="left">
                        <label class="form-label">ENTER THE BOOK NAME</label>
                        <input type="text" class="form-control" name="bname" id="bname" required >
                     </div>
                         
                     <div align="left">
                        <label class="form-label">ENTER THE AUTHOR NAME</label>
                        <input type="text" class="form-control"  name="aname" id="aname" required >
                     </div>
                         </br>
                         
                     <div align="left">
                        <label class="form-label">ENTER THE CATEGORY</label>
                        <input type="text" class="form-control"  name="category" id="category" required >
                     </div>
                         </br>
                         
                     <div align="left">
                        <label class="form-label">ENTER THE LANGUAGE</label>
                        <input type="text" class="form-control" name="language" id="language" required >
                     </div>
                         </br>
                         
                     <div align="left">
                        <label class="form-label">ENTER THE NUMBER OF PAGES</label>
                        <input type="text" class="form-control"  name="pages" id="pages" required >
                     </div>
                         </br>
                         
                     <div align="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                     </div>  
                  </form>       
             </div>
           </div>                  
                            
 

</body>
</html>