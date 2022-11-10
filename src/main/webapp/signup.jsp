<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
	#reg-form,.login_msg {
		width:60%;
		margin:5px auto;
	}
	.container {
		padding:5%;
	}
</style>
</head>
<body>
	
	<div class="container">
		<h2 style="text-align:center;">User Registration</h2>
		<br/>
		<form method="post" action="user/register" id="reg-form">
			<div class="form-group">
				<label for="role" class="control-lable">Role : </label>
				<select id="role" class="form-control" name="role">
					<option value="user">User</option>
					<option value="admin">Admin</option>
				</select>
			</div>
			<div class="form-group">
				<label for="username" class="control-lable">Username : </label>
				<input placeholder="Enter Username" required type="text" id="username" class="form-control" name="username" />
			</div>
			<div class="form-group">
				<label for="password" class="control-lable">Password : </label>
				<input placeholder="Enter Password" required type="password" id="password" class="form-control" name="password" />
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Sign Up</button>
			</div>
		</form>
		<p class="login_msg">If user is already registered then <a href="/login">Sign In</a> here</p>
	</div>
</body>
</html>