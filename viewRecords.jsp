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
        <h1>Records!</h1>
        <%
            Connection conn = null; 
            PreparedStatement ps = null; 
            ResultSet rs = null; 
            
            String query = "SELECT * FROM login1"; 

            try { 
                conn = DbConnection.getConnection(); 
                ps = conn.prepareStatement(query); 
                rs = ps.executeQuery(); 
                
                while(rs.next()) {
                    out.println(rs.getString("user") + "<br>" ); 
                    %>

                    <div class="container">
                        <div class="row" >
                            <div class="col-md-3">
                                <%= rs.getString("user") %> 
                            </div>
                            <div class="col-md-3">
                                <%= rs.getString("name") %>
                            </div>
                            <div class="col-md-3">
                                <a href="editForm.jsp?id=<%= rs.getString("id") %>"> update </a>
                            </div>
                            <div class="col-md-3">
                                <a href="deleteRecord.jsp?id=<%= rs.getString("id") %>"> delete </a>
                            </div>
                        </div>               
                    </div>
                    
                    <%
                    
                }
                out.println( "<br><br>");
            }
            catch (Exception e) {
                out.println(e.getMessage()); 
            }
            %>
    </body>
</html>
