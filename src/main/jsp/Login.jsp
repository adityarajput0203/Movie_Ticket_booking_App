<%@ page  language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>	
<!DOCTYPE html>
<html>
<head>
<style>
.admin{
margin-left: 22%;
color:white;
}

body{
	background-image: url('Images/movie_background.jpg'); 
    background-size: cover; 
    background-repeat: no-repeat;
     }
    
</style>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/Mainlogin.css">
<link rel="shortcut icon" href="favicon.ico"/>
<title>MovieMagic</title>
</head>
<body>
	
	
	<div class="container">
            <div class="form-box">
                <h2>Login</h2>
                <form action="login_process.jsp" method="post">
                    <input type="text" name="username" placeholder="Username" required>
                    <input type="password" name="password" placeholder="Password" required>
                    <input type="submit" value="LogIn">
                </form>
                <br>
                <a class="admin" href="AdminLogin.jsp">Click here If you are a admin</a>
            </div>
        </div>
</body>
</html>
