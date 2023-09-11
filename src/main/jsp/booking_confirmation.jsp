<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmation</title>
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<body>
    <div style="text-align: center; padding: 100px;">
        <h2>You have booked for the Movie <%= (String) session.getAttribute("movieName") %></h2>
        <p>Total Price: <%= session.getAttribute("totalprice") %> Rupees</p>
        <p><a href="loginSuccess.jsp">Click here to Book another movie Shows</a></p>
    </div>
</body>
</html>
