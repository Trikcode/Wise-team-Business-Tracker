package com.project;
import java.sql.*;
public class DbConnection {
	
	public static Connection getCon() throws SQLException, ClassNotFoundException
    {
        // Initialize all the information regarding
        // Database Connection
        String dbDriver = "com.mysql.jdbc.Driver";
        String dbURL = "jdbc:mysql:// localhost:3306/";
        // Database name to access
        String dbName = "businesstracker";
        String dbUsername = "root";
        String dbPassword = "Wisepro25#";
        Class.forName(dbDriver);
        Connection con = DriverManager.getConnection(dbURL + dbName,dbUsername,dbPassword);
        return con;
    }

}
