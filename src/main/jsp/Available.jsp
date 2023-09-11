<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ex.login_check.DatabaseConnection" %>

<%
		String movieName = request.getParameter("movieName");
		session.setAttribute("movieName",movieName);
		
		int showSlot = Integer.parseInt(request.getParameter("showSlot"));
		session.setAttribute("showSlot",showSlot);
		
		int duration = Integer.parseInt(request.getParameter("duration"));
		
		int screenNo = Integer.parseInt(request.getParameter("screenNo"));
		session.setAttribute("screenNo",screenNo);
		
		try (Connection con = DatabaseConnection.getConnection()) {
		    String s = "SELECT * FROM shows s JOIN movie m ON s.Mid = m.id WHERE m.title = ? AND s.slot = ? AND m.duration = ? AND s.screen = ?";
		    
		    try (PreparedStatement statement = con.prepareStatement(s)) {
		        statement.setString(1, movieName);
		        statement.setInt(2, showSlot);
		        statement.setInt(3, duration);
		        statement.setInt(4, screenNo);
		
		        try (ResultSet resultSet = statement.executeQuery()) {
		            if (resultSet.next()) {
		                response.sendRedirect("Booking.html"); // Show is available then redirect to booking.html
		            } else {
		                response.sendRedirect("NotAvailable.html"); // Show is not available then go the movie selection page
		            }
		        }
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		    response.sendRedirect("error.jsp"); // Redirect to an error page
		}
%>
