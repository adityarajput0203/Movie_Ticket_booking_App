<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ex.login_check.DatabaseConnection" %>

<%
	String movieTitle = request.getParameter("deleteMovieName");
	
	try (Connection con = DatabaseConnection.getConnection()) {
		
		
		// check if movie exists with given name
		
	    String moviecheck = "select id from movie where title = ?";
	    
	    try (PreparedStatement checkStatement = con.prepareStatement(moviecheck)) {
	        checkStatement.setString(1, movieTitle);
	        
	        try (ResultSet rs = checkStatement.executeQuery()) {
	            
	        	if (!rs.next()) {
	                response.sendRedirect("error.jsp"); // Movie doesn't exist
	            } else {
	            	
	                String s = "delete form movie where title = ?";
	                
	                try (PreparedStatement delsmt = con.prepareStatement(s)) {
	                    delsmt.setString(1, movieTitle);
	        
	                    int rowsAffected = delsmt.executeUpdate();
	        
	                    if (rowsAffected > 0) {
	                        response.sendRedirect("DeleteSuccess.html"); // Redirect to a success page
	                    } else {
	                        response.sendRedirect("error.jsp"); // Redirect to an error page
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
