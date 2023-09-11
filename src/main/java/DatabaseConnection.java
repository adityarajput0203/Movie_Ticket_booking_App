package com.ex.login_check;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	

    public static Connection getConnection() throws SQLException {
    	
    	
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","1234");

        return con;
    }

}

