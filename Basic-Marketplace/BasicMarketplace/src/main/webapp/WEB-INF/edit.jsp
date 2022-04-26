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
<title>Edit Item Details:</title>
</head>
<body>
	<div><a href="/dashboard">Home</a> | <a href="/logout">Logout</a></div>
	<h1>Edit ${product.productName}:</h1>
	<form:form method="PUT" action="/products/${product.id}/update" modelAttribute="updateProduct">
			<div class="form-group">
				<form:label path="productName">Product Name:</form:label>
				<form:errors class="text-danger" path="productName"/>
				<form:input class="form-control" path="productName" value="${product.productName}"/>
			</div>

			<div class="form-group">
				<form:label path="description">Description:</form:label>
				<form:errors class="text-danger" path="description"/>
				<form:input class="form-control" path="description" value="${product.description}"/>
			</div>
			
			<div class="form-group">
				<form:label path="price">Price:</form:label>
				<form:errors class="text-danger" path="price"/>
				<form:input class="form-control" path="price" value="${product.price}"/>
			</div>
			
			<div class="form-group">
				<form:label path="amountInStock">Amount in stock:</form:label>
				<form:errors class="text-danger" path="amountInStock"/>
				<form:input class="form-control" path="amountInStock" value="${product.amountInStock}"/>
			</div>
	<!-- hidden input for userId -->
	<form:input type="hidden" value="${loggedInUser.id}" path="user"/>
	
	
	<input type="submit" class="btn btn-primary" value="Submit"/>
</form:form>
</body>
</html>