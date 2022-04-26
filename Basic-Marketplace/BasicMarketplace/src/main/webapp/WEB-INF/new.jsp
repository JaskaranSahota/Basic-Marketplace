<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<title>New Product</title>

</head>
<body>
<h1>List an Item!</h1>
<div><a href="/dashboard">Home</a> | <a href="/logout">Logout</a></div>
	<form:form method="POST" action="/products/create" modelAttribute="newProduct">
			<div class="form-group">
				<form:label path="productName">Product Name:</form:label>
				<form:errors class="text-danger" path="productName"/>
				<form:input class="form-control" path="productName"/>
			</div>

			<div class="form-group">
				<form:label path="description">Description:</form:label>
				<form:errors class="text-danger" path="description"/>
				<form:input class="form-control" path="description"/>
			</div>
			
			<div class="form-group">
				<form:label path="price">Price:</form:label>
				<form:errors class="text-danger" path="price"/>
				<form:input class="form-control" path="price"/>
			</div>
			
			<div class="form-group">
				<form:label path="amountInStock">Amount in stock:</form:label>
				<form:errors class="text-danger" path="amountInStock"/>
				<form:input class="form-control" path="amountInStock"/>
			</div>
	<!-- hidden input for userId -->
	<form:input type="hidden" value="${loggedInUser.id}" path="user"/>
	
	
	<input type="submit" class="btn btn-primary" value="Submit"/>
</form:form>
</body>
</html>