
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
        <title>Project 1 </title>
    </head>
    <body>
        <%
            Connection conn = null; 
            conn = DbConnection.getConnection(); 

            %>
        <h1>Hello World!</h1>
        
        <form name="myForm" action="addRecord.jsp" method="POST" >
            <input type="text" name="username" placeholder="username" value="" size="100" />
            <br>
            <input type="text" name="name" placeholder="name" value="" size="100" />
            <br>
            <input type="submit" name="submit" value="Submit" />        
        </form>
        
        <p> <a href="viewRecords.jsp"> View Records </a> </p>
                
        <hr>


        <div class="container">
            <div class="row" style="border: 3px">
                <div class="col-md-3">
                    username 
                </div>
                <div class="col-md-3">
                    name
                </div>
                <div class="col-md-3">
                    update
                </div>
                <div class="col-md-3">
                    delete
                </div>
            </div>               
        </div>
    </body>
</html>

