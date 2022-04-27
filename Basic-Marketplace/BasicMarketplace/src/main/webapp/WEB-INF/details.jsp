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
	<link rel="stylesheet" href="/css/details.css"/>
<title>details</title>
</head>
<body>
<div class="d-flex justify-content-around align-items-center col-12 top">
        <h2 class="text-center"><a href="/dashboard">Home</a></h2>
        <h1 class="text-center">Marketplace</h1>
        <a href="/logout" class="btn button-color">Logout</a>
 	</div>
 	 <main class="d-flex justify-content-center col-12 top">
        <div class="col-10 text-light">
            <div class="card body-color my-2">
				<h1><c:out value="${products.productName}"/> Details</h1>
				<c:if test="${loggedInUser.id == products.user.id}">
				<a href="/products/${products.id}/edit">Edit ${products.productName} details</a>
				</c:if>
				<h3><c:out value="${products.productName}"/></h3>
				<h5>Product Information:</h5>
				<h6><c:out value="${products.description}"/></h6>
				<h5>Product Rating:</h5>
				<h6> <%-- <c:out value="${products.id.rating}"/> --%> <a href="/products/${products.id}/details">Leave a rating</a></h6>
				<h5>Price</h5>
				<h6><c:out value="${products.price}"/></h6>
				<input type="submit" class="btn btn-primary add" value="Add to Cart (not done">
			</div>
		</div>
	</main>
</body>
</html>