<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.ex.login_check.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>MovieMagic Home</title>
<link rel="stylesheet" type="text/css" href="css/LoginSuccess.css">
<link rel="shortcut icon" href="favicon.ico"/>

</head>
<body>
	<div class="container">

		<div class="movies">
			<h2>Currently showing ...</h2>
			<table border="1">
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Genre</th>
					<th>Duration (Min)</th>

				</tr>
				<%
				try (Connection connection = DatabaseConnection.getConnection()) {
					String selectSql = "SELECT * FROM movie";

					try (PreparedStatement selectStatement = connection.prepareStatement(selectSql)) {
						try (ResultSet resultSet = selectStatement.executeQuery()) {
					while (resultSet.next()) {
						int id = resultSet.getInt("id");
						String title = resultSet.getString("title");
						String genre = resultSet.getString("genere");
						int duration = resultSet.getInt("duration");
				%>
				<tr>
					<td><%=id%></td>
					<td><%=title%></td>
					<td><%=genre%></td>
					<td><%=duration%></td>

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
		<br>

		<div class="form-container">
			<h2>Movie Selection</h2>
			<form class="form1" action="Available.jsp" method="post">
				<label for="movie">Movie:</label> 
				<select id="movieName" name="movieName">

					<option value="" selected disabled>Select a movie</option>
					<%
					try (Connection con = DatabaseConnection.getConnection()) {
						String sql = "SELECT title FROM movie";

						try (PreparedStatement statement = con.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {
							while (resultSet.next()) {
						String title = resultSet.getString("title");
					%>

					<option value="<%=title%>"><%=title%></option>
					<%
					}
					}
					} catch (SQLException e) {
					e.printStackTrace();
					}
					%>

				</select> 
				<br> <br> 
				
				<label for="slot">Show Slot:</label>
				<div class="radio-group">
					<input type="radio" id="slot1" name="showSlot" value="12">
					<label for="slot1">12pm</label> 
					<input type="radio" id="slot2" name="showSlot" value="3"> 
					<label for="slot2">3pm</label>
					<input type="radio" id="slot3" name="showSlot" value="9"> 
					<label for="slot3">9pm</label>
				</div>
				<br> 
				<br> 
				
				<label for="duration">Duration:&nbsp&nbsp</label>
				<div class="radio-group">
					<input type="radio" id="duration1" name="duration" value="120">
					<label for="duration1">120min</label>
					<input type="radio" id="duration2" name="duration" value="150"> 
					<label for="duration2">150min</label> 
					<input type="radio" id="duration3" name="duration" value="180"> 
					<label for="duration3">180min</label>
				</div>
				
				<br> <br> 
				<label for="screen">Screen No:</label>
				<div class="radio-group">
					<input type="radio" id="screen1" name="screenNo" value="1">
					<label for="screen1">1</label> <input type="radio" id="screen2" name="screenNo" value="2"> 
					<label for="screen2">2</label>
					<input type="radio" id="screen3" name="screenNo" value="3">
					<label for="screen3">3</label> 
					<input type="radio" id="screen4" name="screenNo" value="4"> 
					<label for="screen4">4</label>
					<input type="radio" id="screen5" name="screenNo" value="4">
					<label for="screen5">5</label>
				</div>
				<br> <br>
				<button class="button" type="submit">Check Availability</button>
				<br> <br> <a href="Login.jsp" class="logout-button">Log Out</a>
			</form>
		</div>

	</div>
</body>
</html>