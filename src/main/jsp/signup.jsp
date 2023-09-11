<%@ page import="com.ex.login_check.DatabaseConnection" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MovieMagic SignUp</title>
<link rel="stylesheet" type="text/css" href="css/SignUp.css">
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<body>
	

    
    <div class="container">
            <div class="form-box">
                <h2>Sign Up</h2>
        		<h3>You have Not signed up yet Sign in first....!!</h3>
                <form action="signup_process.jsp" method="post">
                    <input type="text" name="username" placeholder="Username" required>
                    <input type="password" name="password" placeholder="Password" required>
                    <input type="submit" value="Sign Up">
                </form>
            </div>
        </div>
    
    

</body>
</html>