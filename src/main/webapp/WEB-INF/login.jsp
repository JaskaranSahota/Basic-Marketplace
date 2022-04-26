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
<link rel="stylesheet" href="/css/main.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="wrapper">
		<div class="title">
			<h1> Check Out the Marketplace!</h1>
		</div>
		<div class="body">
			<div class="loginBody">
				<div class="register">
					<h3>Register New Account</h3>
					<form:form action="/register" method="post"
						modelAttribute="newUser" class="form-control">

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

						<input type="submit" value="Submit" class="btn btn-primary" />
						<br>
					</form:form>
				</div>
				<div class="login">
					<h3>Login</h3>
					<form:form action="/login" method="post" modelAttribute="newLogin" class="form-control">
						<form:label path="email">Email: </form:label>
						<form:input path="email" class="form-control"/>
						<form:errors path="email" class="text-danger"/>
						<br>
						<form:label path="password">Password: </form:label>
						<form:password path="password" class="form-control"/>
						<form:errors path="password" class="text-danger"/>
						<br>
						<input type="submit" value="Submit" class="btn btn-primary" />
						<br>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>