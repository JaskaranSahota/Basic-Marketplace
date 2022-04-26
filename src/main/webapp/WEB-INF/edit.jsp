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
	<form:form method="POST" action="/products/${updateProduct.id}/update" modelAttribute="updateProduct">
			<div class="form-group">
				<form:label path="products">Product Name:</form:label>
				<form:errors class="text-danger" path="products"/>
				<form:input class="form-control" path="products"/>
			</div>

			<div class="form-group">
				<form:label path="products">Description:</form:label>
				<form:errors class="text-danger" path="products"/>
				<form:input class="form-control" path="products"/>
			</div>
			
			<div class="form-group">
				<form:label path="products">Price:</form:label>
				<form:errors class="text-danger" path="products"/>
				<form:input class="form-control" path="products"/>
			</div>
			
			<div class="form-group">
				<form:label path="products">Amount in stock:</form:label>
				<form:errors class="text-danger" path="products"/>
				<form:input class="form-control" path="products"/>
			</div>
	<!-- hidden input for userId -->
	<form:input type="hidden" value="${userId}" path="users"/>
	
	
	<input type="submit" class="btn btn-primary" value="Submit"/>
</form:form>
</body>
</html>