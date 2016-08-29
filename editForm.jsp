
<%@page import="com.dbconnectionUtil.org.DbConnection"%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection conn = null; 
            PreparedStatement ps = null; 
            ResultSet rs = null; 
                        
            String u_id = request.getParameter("id");
            int id = Integer.parseInt(u_id); 
            //out.print(id); 

            try {
                conn = DbConnection.getConnection(); 
                String query = "SELECT * FROM login1 WHERE id='"+id+"' "; 
                ps= conn.prepareStatement(query); 
                rs = ps.executeQuery(); 
                
                while (rs.next()) {
             %>
             
            <form name="myForm" role="form" action="updateRecord.jsp" method="GET" >
                <input type="hidden" name="hidden" placeholder="username" value="<%= rs.getString("id") %>" size="100" />
                <br>
                <input type="text" name="username" placeholder="username" value="<%= rs.getString("user") %>" size="100" />
                <br>
                <input type="text" name="name" placeholder="name" value="<%= rs.getString("name") %>" size="100" />
                <br>
                <input type="submit" name="submit" value="Submit" />        
            </form>
             
             <%
                 } //while loop ends
                
            } // try block ends 
            
            catch(Exception e) {
                out.print(e.getMessage());
            }
            %>
        <h1>Edit Form !</h1>
        
    </body>
</html>
