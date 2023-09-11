<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ex.login_check.DatabaseConnection" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

try (Connection connection = DatabaseConnection.getConnection()) {
    String sql = "SELECT * FROM user1 WHERE username = ? AND password = ?";
    try (PreparedStatement statement = connection.prepareStatement(sql)) {
        statement.setString(1, username);
        statement.setString(2, password);

        try (ResultSet resultSet = statement.executeQuery()) {
            if (resultSet.next()) {
            	
            	String user1 = resultSet.getString(1);
            	String user2 = resultSet.getString(2);
            	
            	if("admin".equals(user1) && "123".equals(user2)){
            		response.sendRedirect("adminpage.jsp");
            	}
            	else{
                session.setAttribute("username", username);
                response.sendRedirect("loginSuccess.jsp");
                }
      
            } else {
                response.sendRedirect("signup.jsp");
            }
        }
    }
} catch (SQLException e) {
    e.printStackTrace();
    response.sendRedirect("Login.jsp");
}
%>
