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
    	
         st = con.prepareStatement("select isbn,return_date from borrowed_book_details where isbn=?");
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
                   <label class="form-label">ISBN</label>
                   <input type="text" class="form-control"  value="<%= rs.getString("isbn")%>" name="isbn" id="isbn" readonly required >
                </div>
               <div alight="left">
                   <label class="form-label">Return Date</label>
                   <input type="text" class="form-control"  value="<%= rs.getString("return_date")%>" name="rdate" id="rdate" required >
                </div>
               <% }  %>
               
               
               
                    </br>
                 
                <div alight="right">
                    <input type="submit" id="submit2" value="submit" name="submit2" class="btn btn-info">
                </div>  
                     
                    
           </form>
       </div>          
   </div>
     <%            
     }
if(request.getParameter("submit2")!=null){     
 String isbn = request.getParameter("isbn");
        String return_date = request.getParameter("rdate");
        
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Welcome123#");
        st = con.prepareStatement("update borrowed_book_details set return_date=? where isbn = ?");
        st.setString(2,isbn);
        st.setString(1,return_date);
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