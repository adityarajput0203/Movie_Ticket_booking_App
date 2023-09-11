<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ex.login_check.DatabaseConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>MovieMagic Information</title>
    <link rel="stylesheet" type="text/css" href="css/info.css">
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<body>

	<div class="shows">
    <h2>Shows Information</h2>
    
    <table border="1">
        <tr>
            <th>Title</th>
            <th>Screen No</th>
            <th>Slot </th>
            <th>Booked Tickets</th>
        </tr>
        
        <%
            try (Connection connection = DatabaseConnection.getConnection()) {
                String selectSql = "SELECT movie.title, shows.screen, shows.slot, shows.booked " +
                                   "FROM movie " +
                                   "INNER JOIN shows ON movie.id = shows.mid";
                
                try (PreparedStatement selectStatement = connection.prepareStatement(selectSql)) {
                    try (ResultSet resultSet = selectStatement.executeQuery()) {
                        while (resultSet.next()) {
                            String title = resultSet.getString("title");
                            int screen = resultSet.getInt("screen");
                            String slot = resultSet.getString("slot");
                            int booked = resultSet.getInt("booked");
                    %>
                    <tr>
                        <td><%= title %></td>
                        <td><%= screen %></td>
                        <td><%= slot %></td>
                        <td><%= booked %></td>
                    </tr>
                    <%
                        }
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle the error as needed
            }
        %>
    </table>
    </div>
    
    <div class="movieinfo">
        <h2>Movies Information</h2>
    <table border="1">
        <tr>
            <th>Movie ID</th>
            <th>Title</th>
            <th>Genre</th>
            <th>Director</th>
        </tr>
        
        <%
            try (Connection connection = DatabaseConnection.getConnection()) {
                String selectSql = "SELECT id, title, genere, director FROM movie";
                
                try (PreparedStatement selectStatement = connection.prepareStatement(selectSql)) {
                    try (ResultSet resultSet = selectStatement.executeQuery()) {
                        while (resultSet.next()) {
                            int movieId = resultSet.getInt("id");
                            String movieTitle = resultSet.getString("title");
                            String genre = resultSet.getString("genere");
                            String director = resultSet.getString("director");
                    %>
                    <tr>
                        <td><%= movieId %></td>
                        <td><%= movieTitle %></td>
                        <td><%= genre %></td>
                        <td><%= director %></td>
                    </tr>
                    <%
                        }
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle the error as needed
            }
        %>
    </table>
    </div>
    
    
</body>
</html>
