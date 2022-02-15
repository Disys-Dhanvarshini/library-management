<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<%
  Connection con;
         PreparedStatement st;
         ResultSet rs;
         
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Welcome123#");
    if(request.getParameter("submit")!=null)
    {
    	String isbn = request.getParameter("isbn");
    	
         st = con.prepareStatement("select *from book_details where isbn=?");
         st.setString(1,isbn);
         rs = st.executeQuery();  
         %>
    <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <% while(rs.next())
                    {
                        
               %>
               <div alight="left">
                   <label class="form-label">isbn</label>
                   <input type="text" class="form-control"  value="<%= rs.getString("isbn")%>" name="isbn" id="isbn" readonly required >
                </div>
               <div alight="left">
                   <label class="form-label">Book Name</label>
                   <input type="text" class="form-control"  value="<%= rs.getString("book_name")%>" name="bname" id="bname" required >
                </div>
                <div alight="left">
                   <label class="form-label">Author</label>
                   <input type="text" class="form-control" name="aname" id="aname" value="<%= rs.getString("author_name")%>"  required >
                </div>   
               <div alight="left">
                   <label class="form-label">Category</label>
                   <input type="text" class="form-control"  name="category" id="category" value="<%= rs.getString("category")%>"required >
                </div>
                   
                <div alight="left">
                   <label class="form-label">language</label>
                   <input type="text" class="form-control" name="language" id="language" value="<%= rs.getString("book_language")%>" required >
                </div>
               <div alight="left">
                   <label class="form-label">pages</label>
                   <input type="text" class="form-control"  name="pages" id="pages" value="<%= rs.getString("Total_Pages")%>" required >
                </div>
               <% }  %>
               
               
               
                    </br>
                 
                <div alight="right">
                    <input type="submit" id="submit1" value="submit" name="submit1" class="btn btn-info">
                </div>  
                     
                    
           </form>
       </div>          
   </div>
     <%            
     }
if(request.getParameter("submit1")!=null){     
 String isbn = request.getParameter("isbn");
        String book_name = request.getParameter("bname");
        String author_name = request.getParameter("aname");
        String category = request.getParameter("category");
        String book_language = request.getParameter("language");
        String pages = request.getParameter("pages");
        
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Welcome123#");
        st = con.prepareStatement("update book_details set book_name = ?, author_name =?,category= ?,book_language=?,Total_Pages=? where isbn = ?");
        st.setString(6,isbn);
        st.setString(1,book_name);
        st.setString(2,author_name);
        st.setString(3,category);
        st.setString(4,book_language);
        st.setString(5,pages);
        st.executeUpdate();  
        
        %>
        
        <script>  
            alert("Record Updated");          
       </script> 
       <%} %>
 
 <link rel="stylesheet" href="lib.css">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UPDATE A BOOK</title>
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
</body>
</html>