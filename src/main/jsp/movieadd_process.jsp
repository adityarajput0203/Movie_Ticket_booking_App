<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.ex.login_check.DatabaseConnection"%>

<%
		String title = request.getParameter("movieName");
		String gen  = request.getParameter("genre");
		Long dur  = Long.parseLong(request.getParameter("duration"));
		String dir  = request.getParameter("director");
		
		try (Connection con = DatabaseConnection.getConnection()) {
			
			String s = "INSERT INTO movie (title, genere, duration, director) VALUES (?,?,?,?)";
			
			try (PreparedStatement psmt = con.prepareStatement(s)) {
				psmt.setString(1, title);
				psmt.setString(2, gen);
				psmt.setLong(3, dur);
				psmt.setString(4, dir);
				
		
				int rowsAffected = psmt.executeUpdate();
		
				if (rowsAffected > 0) {
					
					response.sendRedirect("MovieAddSuccess.html"); // Redirect movie added sucess page
				} 
				else 
				{
					response.sendRedirect("adminpage.jsp"); // Return to the same page
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp"); // Redirect to an error page
		}
%>
