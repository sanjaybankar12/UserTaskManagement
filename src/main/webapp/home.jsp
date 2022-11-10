<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<style type="text/css">
	.header {
		background-color: yellow;
		padding:1.2%;
		border-bottom:1px solid #333;
	}
	.tasks {
		width:80%;
		margin:2% auto;
	}
	
	#logout {
		font-size:16px;
		float:right;
		font-weight:bold;
	}
	
	table tbody tr:nth-child(odd) {
		background-color: #eee;
	}
	
</style>
</head>

<body>
	<header class="header">
		<h3>Task Management | &nbsp;&nbsp;${username.toUpperCase()}<span id="logout"><a href="/home">Home</a> | <a href="/logout">Logout</a></span></h3>
	</header>
	<c:choose>
		<c:when test="${user.role=='user' }">
			<div class="tasks">				
				<a style="float:right" href="/task/add" class="btn btn-success">Add New Task</a>
				<h4 class="text-center">All Approve Tasks as shown below:</h4>
				<hr/>
				<table class="table table-stripped table-bordered">
					<thead style="background-color: royalblue;color:#fff;">
						<tr>
							<th>Id</th>
							<th>Title</th>
							<th>Description</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="task" items="${tasks}">
							<tr>
								<td><c:out value="${task.id}"></c:out></td>
								<td><c:out value="${task.title}"></c:out></td>
								<td><c:out value="${task.description}"></c:out></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:when>
		<c:otherwise>
			<div class="tasks">
				<h4 class="text-center">All Tasks as shown below:</h4>
				<hr/>
				<table class="table table-stripped table-bordered">
					<thead style="background-color: royalblue;color:#fff;">
						<tr>
							<th>Id</th>
							<th>Title</th>
							<th>Description</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="task" items="${tasks}">
							<tr>
								<td><c:out value="${task.id}"></c:out></td>
								<td><c:out value="${task.title}"></c:out></td>
								<td><c:out value="${task.description}"></c:out></td>
								<td><c:choose>
										<c:when test="${task.isActive}">
											Accepted
										</c:when>
										<c:otherwise>
											<span><button type="button" onclick="approveTask(${task.id},this)" class="btn btn-primary">Approve</button></span>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:otherwise>
	</c:choose>
	
<script type="text/javascript">
	function approveTask(id, obj) {			
		var ctx = "<%= request.getContextPath() %>";
		
		$.ajax({
			url: ctx + "/task/" + id,
			method:"PUT",
			async:true,
			dataType:"json",
			success:function(result, status, xhr) {
				if(status == "success") {
					var span = document.createElement("span");
					span.innerHTML = "Accepted";
					obj.parentNode.appendChild(span);

					obj.parentNode.removeChild(obj);					
				}
				//alert(result.status + ", " + status + "," + xhr);
			},
		  	error:function(xhr, status, error) {
				alert('Task status updating failed');
			}
		});
	}
</script>
	
</body>
</html>