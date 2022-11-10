<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style type="text/css">
	.header {
		background-color: yellow;
		padding:1.2%;
		border-bottom:1px solid #333;
	}
	
	#logout {
		font-size:16px;
		float:right;
		font-weight:bold;
	}
	

	#task-form {
		width:75%;
		margin:5px auto;
	}
	.container {
		padding:3%;
	}
	
</style>
</head>

<body>
	<header class="header">
		<h3>Task Management | &nbsp;&nbsp;${username.toUpperCase()}<span id="logout"><a href="/home">Home</a> | <a href="/logout">Logout</a></span></h3>
	</header>
	<div class="container">
		<h2 style="text-align:center;">Add Task Details</h2>
		<br/>
		<form method="post" action="/task/save" id="task-form">			
			<div class="form-group">
				<label for="title" class="control-lable">Title : </label>
				<input placeholder="Enter Title" required type="text" id="title" class="form-control" name="title" />
			</div>
			<div class="form-group">
				<label for="description" class="control-lable">Description : </label>
				<textarea placeholder="Enter Description" required id="description" class="form-control" name="description" ></textarea>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Add Task</button>
			</div>
		</form>
	</div>
</body>
</html>