
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
        <header>
        <nav class="navbar navbar-default" style="background-color: #cc0000; border-bottom: 15px solid #333; height:80px">
                <a class="navbar-brand" style="padding:1px 15px" href="#"><img src="ulogo_white.png"></a>
        </nav>
        </header>
        
        <%
            String u_id = request.getParameter("id");
            int id = Integer.parseInt(u_id); 
            
            out.println(id +"<br>"); 

            Connection conn = null; 
            PreparedStatement ps = null; 
            
            try {
                int row = 0; 
                
                conn = DbConnection.getConnection();
                
                String query = "DELETE FROM records WHERE id=?"; 
                
                ps = conn.prepareStatement(query); 
                
                ps.setInt(1, id);
                
                row = ps.executeUpdate(); 
                
                if( row > 0){

                %>
                <center>
                    <h2>Record deleted successfully. </h2>
                    <center><button class="btn btn-default"><a href="crudexample.jsp">Add records</a> </button></center>
                    <br>
                    <center><button class="btn btn-default"><a href="viewRecords.jsp">View or Edit Records</a> </button></center>

                </center>
                <%
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
