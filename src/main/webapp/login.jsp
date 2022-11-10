<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
	#login-form,.signup_msg {
		width:60%;
		margin:5px auto;
	}
	.container {
		padding:5%;
	}
	.error_msg {
		color:red; 
		width:60%;
		margin:0px auto 10px auto;
	}
</style>
</head>
<body>
	
	<div class="container">
		<h2 style="text-align:center;">User Login</h2>
		<p style="text-align:center;">Provide your login credentials</p>
		<br/>
		<form action="/login" method="post" id="login-form">		
			<div class="form-group">
				<label for="username" class="control-lable">Username : </label>
				<input placeholder="Enter Username" required type="text" id="username" class="form-control" name="username" />
			</div>
			<div class="form-group">
				<label for="password" class="control-lable">Password : </label>
				<input placeholder="Enter Password" required type="password" id="password" class="form-control" name="password" />
			</div>
			<span class="error_msg">${SPRING_SECURITY_LAST_EXCEPTION.message }</span>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Login</button>
			</div>
		</form>
		<p class="signup_msg">If user is not registered then <a href="/signup">Sign Up</a> here</p>
	</div>
</body>
</html>