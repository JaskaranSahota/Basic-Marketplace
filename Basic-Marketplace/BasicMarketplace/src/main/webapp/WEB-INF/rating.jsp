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
<title>Leave a Rating</title>
</head>
<body>
	<div>
		<div><a href="/dashboard">Home</a> | <a href="/logout">Logout</a></div>
		<h1>Rate This Product!</h1>
	</div>
	<div>
		<form:form method="POST" action="/products/${product.id}/rate" modelAttribute="newRating">
			<form:input type="hidden" value="${loggedInUser.id}" path="ratedBy"/>
			<form:input type="hidden" value="${product.id}" path="ratedProduct"/>
			<form:label path="rating">Please rate ${product.productName} from 0-5</form:label>
			<form:input path="rating" class="form-control"/>
			<input type="submit" class="btn btn-primary" value="Submit"/>
		</form:form>
	</div>
</body>
</html>