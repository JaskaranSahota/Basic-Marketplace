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

<h1>Hello, <c:out value="${loggedInUser.userName}"/>!</h1>
<a href="/logout">Logout?</a>
<h3>Here are the highest rated products:</h3>
	<table class="table table-dark">
		<thead>
			<tr>
				<th>Product Name</th>
				<th>Stock Available</th>
				<th>Price</th>
				<th>Rating</th>
				<th>Details</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${products}" var="products">
			<tr>
				<td>${products.productName}</td>
				<td>${products.amountInStock}</td>
				<td>$${products.price}</td>
				<td><%-- ${products.id.ratings} --%> Rating to go here...</td>
				<td><a href="/products/${products.id}/details">more...</a></td>
			</tr>
		</c:forEach>
		</tbody>	
	</table>
	<div>
		<h2>Here is your shopping cart:</h2>
		<table>
			<thead>
				<tr>
					<th>Products:</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartProducts}" var="cartProduct">
					<tr>
						<td>${cartProduct.productName}</td>
					</tr>
				</c:forEach>
					<tr>
						<td><a href="">Edit Cart</a></td>
						<td><a href="">Checkout</a></td>
					</tr>
			</tbody>
		</table>
	</div>
	<h3>Want to list an item on the MarketPlace?</h3>
	<a href="/products/new">Get started here!</a>
</body>
</html>