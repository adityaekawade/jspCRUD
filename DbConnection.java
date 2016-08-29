
package com.dbconnectionUtil.org;

import java.sql.*;
import java.sql.DriverManager;

public class DbConnection {
    static String HOST = "jdbc:mysql://localhost:3306/login"; 
    static String USER = "root"; 
    static String PASSWORD = "" ; 
    
    static Connection conn = null; 
    
    public static Connection getConnection () { 
        try { 
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(HOST, USER, PASSWORD);
            System.out.println("Connected");
        }
        catch (Exception e) { 
            e.printStackTrace();
        }
        
        return conn; 
    }
    
}
