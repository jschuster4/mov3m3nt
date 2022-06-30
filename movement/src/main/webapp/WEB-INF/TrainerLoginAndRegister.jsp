<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">	
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title>Login And Registration</title>
</head>
<body>
<video autoplay muted loop id="myVideo">
		<source src="/videos/explore.mp4" type="video/mp4">
</video>

<section class="vh-100 gradient-custom">
	<div class="container mt-5">
		<h1>MOV3M3NT</h1>
		<p>Join our growing community.</p>
		<form:form action="/trainer/login" method="post" modelAttribute="trainerLogin">
		
    		<h3>Log In Trainer</h3>
        		<div class="form-group">
					<form:label path="email">Email:</form:label>
					<form:input path="email" class="form-control" />
					<form:errors path="email" class="text-danger" />
				</div>
				<br>
				<div class="form-group">
					<label>Password:</label>
					<form:password path="password" class="form-control" />
					<form:errors path="password" class="text-danger" />
				</div>
				<br>
            	<input class="input" class="button" type="submit" value="Login Trainer"/>
	</form:form>
	
	<form:form action="/trainer/register" method="post" modelAttribute="newTrainer">
	<br>
		<h3>Register as a Trainer</h3>
    	<div class="form-group">
				<form:label path="firstName">First Name:</form:label>
				<form:input path="firstName" class="form-control" />
				<form:errors path="firstName" class="text-danger" />
			</div>
			<br>
			<div class="form-group">
				<form:label path="lastName">Last Name:</form:label>
				<form:input path="lastName" class="form-control" />
				<form:errors path="lastName" class="text-danger" />
			</div>
			<br>
			<div class="form-group">
				<form:label path="email">Email:</form:label>
				<form:input path="email" class="form-control" />
				<form:errors path="email" class="text-danger" />
			</div>
			<br>
        	<div class="form-group">	
            	<form:label path="location">Location:</form:label>
                <form:errors path="location" class="text-danger"/>
                <form:input type="text" class="form-control" path="location"/>
            </div>	
            <br>
        	<div class="form-group">	
            	<form:label path="age">Age:</form:label>
                <form:errors path="age" class="text-danger"/>
                <form:input type="number" class="form-control" path="age"/>
            </div>
            <br>
        	<div class="form-group">	
            	<form:label path="experience">Years of Experience:</form:label>
                <form:errors path="experience" class="text-danger"/>
                <form:input type="number" class="form-control" path="experience"/>
            </div>
            <br>
            <div class="form-group">
				<form:label path="password">Password:</form:label>
				<form:password path="password" class="form-control" />
				<form:errors path="password" class="text-danger" />
			</div>
			<br>
			<div class="form-group">
				<form:label path="confirm">Confirm Password:</form:label>
				<form:password path="confirm" class="form-control" />
				<form:errors path="confirm" class="text-danger" />
			</div>
			<br>
            <input class="input" class="button" type="submit" value="Submit New Trainer"/>
	</form:form>
	</div>
</section>


</body>
</html>