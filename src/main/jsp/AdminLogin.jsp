<%@ page  language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/Mainlogin.css">
<link rel="shortcut icon" href="favicon.ico"/>
<title>Admin Login Page</title>
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
            </div>
        </div>
	
	

</body>
</html>