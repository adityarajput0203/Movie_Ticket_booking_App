<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.ex.login_check.DatabaseConnection" %>

<%
    String movieName = (String) session.getAttribute("movieName");
    int numSeats = Integer.parseInt(request.getParameter("numSeats"));
    int pricePerSeat = Integer.parseInt(request.getParameter("price"));
    int selectedSlot = (int) session.getAttribute("showSlot");
    int selectedScreen = (int) session.getAttribute("screenNo");
    //System.out.println(selectedShow);
    //System.out.println(selectedSlot);

    int totalprice = numSeats * pricePerSeat;
    session.setAttribute("totalprice", totalprice);

    int movieId = -1; // Initialize with a default value
    int showId = -1; // Initialize with a default value

    try (Connection connection = DatabaseConnection.getConnection()) {
        // Get the movie ID based on the movieName
        String selectMovieSql = "SELECT id FROM movie WHERE title = ?";
        try (PreparedStatement selectMovieStatement = connection.prepareStatement(selectMovieSql)) {
            selectMovieStatement.setString(1, movieName);
            try (ResultSet movieResultSet = selectMovieStatement.executeQuery()) {
                if (movieResultSet.next()) {
                    movieId = movieResultSet.getInt("id");
                    //System.out.println(movieId);
                }
            }
        }

        // Get the show ID based on the selected show and slot
        String selectShowSql = "SELECT id FROM shows WHERE mid = ? AND screen = ? AND slot = ?";
        try (PreparedStatement selectShowStatement = connection.prepareStatement(selectShowSql)) {
            selectShowStatement.setInt(1, movieId);
            selectShowStatement.setInt(2, selectedScreen);
            selectShowStatement.setInt(3, selectedSlot);
            try (ResultSet showResultSet = selectShowStatement.executeQuery()) {
                if (showResultSet.next()) {
                    showId = showResultSet.getInt("id");
                    //System.out.println(showId);
                }
            }
        }

        if (movieId != -1 && showId != -1) {
            String updateSql = "UPDATE shows SET booked = booked + ? WHERE id = ?";
            try (PreparedStatement updateStatement = connection.prepareStatement(updateSql)) {
                updateStatement.setInt(1, numSeats);
                updateStatement.setInt(2, showId);

                int rowsAffected = updateStatement.executeUpdate();

                if (rowsAffected > 0) {
                    response.sendRedirect("booking_confirmation.jsp"); // Redirect to confirmation page
                } else {
                    response.sendRedirect("Booking.html"); // Update failed
                }
            }
        } else {
            response.sendRedirect("error.jsp"); // Movie or show not found
        }
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("error1.html"); // Redirect to an error page
    }
%>
