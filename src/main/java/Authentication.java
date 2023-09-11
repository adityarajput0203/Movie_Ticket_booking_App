package com.ex.login_check;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Authentication {
	
    public static boolean validateUser(String username, String password) {
    	
        try (Connection connection = DatabaseConnection.getConnection()) {
        	
            String s = "SELECT * FROM user1 WHERE username = ? AND password = ?";
            try (PreparedStatement statement = connection.prepareStatement(s)) {
                statement.setString(1, username);
                statement.setString(2, password);

                try (ResultSet resultSet = statement.executeQuery()) {
                    return resultSet.next(); // Returns true if a matching record is found
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}

