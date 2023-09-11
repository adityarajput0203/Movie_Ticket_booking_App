<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ex.login_check.DatabaseConnection" %>

<%
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		int screen = Integer.parseInt(request.getParameter("screenNo"));
		int slot = Integer.parseInt(request.getParameter("slotNo"));
		
		try (Connection con = DatabaseConnection.getConnection()) {
			
		    // Check if the movie with the given ID exists
		    
		    String movieCheck = "SELECT id FROM movie WHERE id = ?";
		    
		    try (PreparedStatement mpsmt = con.prepareStatement(movieCheck)) {
		        mpsmt.setInt(1, movieId);
		
		        try (ResultSet resultSet = mpsmt.executeQuery()) {
		        	
		            if (!resultSet.next()) {
		                response.sendRedirect("error.jsp"); // Movie with the given ID doesn't exist
		            } 
		            
		            else 
		            {
		                // if movie is there then add the values
		                
		                String s = "INSERT INTO shows (MId, screen, slot) VALUES (?, ?, ?)";
		                try (PreparedStatement statement = con.prepareStatement(s)) {
		                    statement.setInt(1, movieId);
		                    statement.setInt(2, screen);
		                    statement.setInt(3, slot);
		
		                    int rowsAffected = statement.executeUpdate();
		
		                    if (rowsAffected > 0) {
		                        response.sendRedirect("ShowAddSuccess.html"); // Redirect to a success page
		                    } else {
		                        response.sendRedirect("adminpage.jsp"); // Redirect to an error page
		                    }
		                }
		            }
		        }
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		    response.sendRedirect("error.jsp"); // Redirect to an error page
		}
%>
