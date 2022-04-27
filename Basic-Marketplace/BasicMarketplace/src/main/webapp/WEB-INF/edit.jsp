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
	<link rel="stylesheet" href="/css/new.css"/>
<title>Edit Item Details:</title>
</head>
<body>
	<div class="d-flex justify-content-around align-items-center col-12 top">
        <h1 class="text-center"><a href="/dashboard">Home</a></h1>
        <h1 class="text-center">Marketplace</h1>
        <a href="/logout" class="btn button-color">Logout</a>
 	</div>
 	<main class="d-flex justify-content-center col-12 top">
        <div class="col-10 text-light">
            <div class="card body-color my-2">
				<form:form method="PUT" action="/products/${product.id}/update" modelAttribute="updateProduct"  class="col-12 p-3 my-color">
					<h1 class="text-center my-color">Edit ${product.productName}:</h1>
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
			</div>
		</div>
	</main>
</body>
</html>