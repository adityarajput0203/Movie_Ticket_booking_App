<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ex.login_check.DatabaseConnection" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

try (Connection connection = DatabaseConnection.getConnection()) {
    String sql = "INSERT INTO user1 (username, password) VALUES (?, ?)";
    try (PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setString(1, username);
        statement.setString(2, password);

        int rowsAffected = statement.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("Login.jsp");
        } else {
            response.sendRedirect("signup.jsp");
        }
    }
} catch (SQLException e) {
    e.printStackTrace();
    response.sendRedirect("signup.jsp");
}
%>
