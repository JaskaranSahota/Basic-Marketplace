<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Marketplace Login</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css"/>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	 <div class="d-flex justify-content-around align-items-center col-12">
        <h1 class="text-center body-color">Checkout the Marketplace</h1>
    </div>	
		  <div class="d-flex flex-wrap justify-content-around">
					<form:form action="/register" method="post"
						modelAttribute="newUser" class="col-3 p-3 body-color">
						<h3 class="text-center body-color">Register New Account</h3>

						<form:label path="userName">User Name: </form:label>
						<form:input path="userName" class="form-control"/>
						<form:errors path="userName" class="text-danger"/>
						<br>

						<form:label path="email">Email: </form:label>
						<form:input path="email" class="form-control"/>
						<form:errors path="email" class="text-danger"/>
						<br>

						<form:label path="password">Password: </form:label>
						<form:password path="password" class="form-control"/>
						<form:errors path="password" class="text-danger"/>
						<br>

						<form:label path="confirm">Confirm Password:</form:label>
						<form:password path="confirm" class="form-control"/>
						<form:errors path="confirm" class="text-danger"/>
						<br>

						<button type="submit" value="Submit" />Submit</button>
						<br>
					</form:form>
					<form:form action="/login" method="post" modelAttribute="newLogin" class="col-3 p-3 body-color">
						<h3  class="text-center body-color">Login</h3>
						<br>
						<form:label path="email">Email: </form:label>
						<form:input path="email" class="form-control"/>
						<form:errors path="email" class="text-danger"/>
						<br>
						<form:label path="password">Password: </form:label>
						<form:password path="password" class="form-control"/>
						<form:errors path="password" class="text-danger"/>
						<br>
						<button type="submit" value="Submit">Submit</button>
						<br>
					</form:form>
				</div>
</body>
</html>