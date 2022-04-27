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
	<link rel="stylesheet" href="/css/style.css"/>
<title>Market Place Dashboard</title>
</head>

<body>
<div class="d-flex justify-content-around align-items-center col-12 top">
        <h2 class="text-center">Hello, <c:out value="${loggedInUser.userName}"/>!</h2>
        <h1 class="text-center">Marketplace</h1>
        <a href="/logout" class="btn button-color">Log out</a>
 	</div>

<h3>Here are the highest rated products:</h3>
<main class="d-flex justify-content-center col-12 top">
        <div class="col-10 text-light">
            <div class="card body-color my-2">
				<table class="table table-striped table-dark table-bordered table-hover">
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
								<td><a href="/products/${products.id}/details"> more...</a></td>
							</tr>
						</c:forEach>
					</tbody>	
				</table>
			</div>
		</div>
	</main>
	<h3>Want to list an item on the MarketPlace?</h3>
	<a href="/products/new">    Get started here!</a>
</body>
</html>