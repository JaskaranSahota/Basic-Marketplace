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
<title>Leave a Rating</title>
</head>
<body>
	<div class="d-flex justify-content-around align-items-center col-12 top">
        <h1 class="text-center"><a href="/dashboard">Home</a></h1>
        <h1 class="text-center">Marketplace</h1>
        <a href="/logout" class="btn button-color">Logout</a>
 	</div>
 	<main class="d-flex justify-content-center col-12 top">
		<h1 class="text-center my-color">Rate This Product!</h1>
	<div>
		<form:form method="POST" action="/products/${product.id}/rate" modelAttribute="newRating" class="col-12 p-3 my-color">
			<div class="form-group">
				<form:input type="hidden" value="${loggedInUser.id}" path="ratedBy"/>
				<form:input type="hidden" value="${product.id}" path="ratedProduct"/>
				<form:label path="rating">Please rate ${product.productName} from 0-5</form:label>
				<form:input path="rating" class="form-control"/>
				<input type="submit" class="btn btn-primary" value="Submit"/>
			</div>
		</form:form>
	</div>
	</main>
</body>
</html>