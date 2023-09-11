<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/adminpage.css">
<link rel="shortcut icon" href="favicon.ico"/>
<style>

</style>
<title>Insert title here</title>
</head>
<body>
		<div class="container">
		<a href="info.jsp">Click here to get information about shows and movies</a>
		<br>
		<br>
		
        <div class="form-container">
            <h2>Add Movie</h2>
            <form action="movieadd_process.jsp" method="post">
                <label for="movieName">Movie Name:</label>
                <input type="text" id="movieName" name="movieName" required>

                <label for="genre">Genre:</label>
                <input type="text" id="genre" name="genre" required>

                <label for="duration">Duration:</label>
        			<select id="duration" name="duration">
           					 <option value="120">120 min</option>
				             <option value="150">150 min</option>
				             <option value="180">180 min</option>
        			</select>
        		<br>
        		<br>

                <label for="director">Director:</label>
                <input type="text" id="director" name="director" required>
                
                <br>
                <br>
                <button class="button" type="submit">ADD</button>
            </form>
        </div>

        <div class="form-container">
            <h2>Schedule Movie</h2>
            <form action="shows_process.jsp" method="post">
                <label for="movieId">Movie ID:</label>
                <input type="text" id="movieId" name="movieId" required>

                <label for="screenNo">Screen No:</label>
                <select id="screenNo" name="screenNo">
		            <option value="1">Screen 1</option>
		            <option value="2">Screen 2</option>
		            <option value="3">Screen 3</option>
		            <option value="4">Screen 4</option>
		            <option value="5">Screen 5</option>
		        </select>

                <label for="slotNo">Slot No:</label>
                	<select id="slotNo" name="slotNo">
           					 <option value="12">12 pm</option>
				             <option value="3">3 pm</option>
				             <option value="9">9 pm</option>
        			</select>
                
                <br>
                <br>
                <button class="button" type="submit">Schedule</button>
            </form>
        </div>

        <div class="form-container">
            <h2>Delete Movie</h2>
            <form action="DeleteProcess.jsp" method="post">
                <label for="deleteMovieName">Movie Name:</label>
                <input type="text" id="deleteMovieName" name="deleteMovieName" required>
                
                <br>
                <br>
                <button class="button" type="submit">Delete</button>
            </form>
        </div>
        
        <div class="form-container">
        	<form action="Login.jsp" method="post">
        		<button class="button" type="submit">Logout</button>
        	</form>
        </div>
    </div>

</body>
</html>