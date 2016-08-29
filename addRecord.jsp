
<%@page import="com.dbconnectionUtil.org.DbConnection"%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add record page !</h1>
        <%
            String username = request.getParameter("username"); 
            String name = request.getParameter("name"); 

            Connection conn = null; 
            PreparedStatement ps = null; 
            
            try {
                int row = 0; 
                
                conn = DbConnection.getConnection();
                
                String query = "INSERT INTO login1 (user, name) VALUES (?, ?)"; 
                
                ps = conn.prepareStatement(query); 
                ps.setString(1, username);
                ps.setString(2, name);
                
                row = ps.executeUpdate(); 
                
                if( row > 0){
                    out.println("record added"); 
                    out.print("<a href='crudexample.jsp'> Add more </a>  ");
                    
                }
                else {
                    out.println("error in query"); 
                }
                
            }
            catch(Exception e) { 
                out.println(e.getMessage()); 
            }
            
            %>
    </body>
</html>
