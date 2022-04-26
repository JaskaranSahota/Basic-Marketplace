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
<title>Market Place Dashboard</title>
</head>

<body>

<h1>Hello, <c:out value="${user.userName}"/>!</h1>

<h3>Here are the highest rated products:</h3>
	<table class="table table-dark">
		<thead>
			<tr>
				<th>Product Name</th>
				<th>Stock Available</th>
				<th>price</th>
				<th>rating</th>
				<th>details</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${products}" var="products">
			<tr>
				<td>${products.name}</td>
				<td>${products.amount_stock}</td>
				<td>${products.price}</td>
				<td>${products.id.ratings}</td>
				<td>more...<a href="/products/${products.id}/details"></a></td>
			</tr>
		</c:forEach>
		</tbody>	
	</table>
	<h3>Want to list an item on the MarketPlace?</h3>
	<a href="/products/new">Get started here!</a>
</body>
</html>