<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <script defer type="text/javascript" src="/js/main.js"></script>
    <title>Login And Registration</title>
<%--    <script type="text/javascript" src="/js/main.js"></script>--%>
</head>
<body>

<h1>MOV3M3NT</h1>
<p>Join our growing community.</p>


<form:form action="/trainer/login" method="post" modelAttribute="trainerLogin">

    <table>
        <thead>
        <tr>
            <td colspan="2">Log In Trainer</td>
        </tr>
        </thead>
        <thead>
        <tr>
            <td class="float-left">Email:</td>
            <td class="float-left">
                <form:errors path="email" class="text-danger"/>
                <form:input class="input" path="email"/>
            </td>
        </tr>
        <tr>
            <td class="float-left">Password:</td>
            <td class="float-left">
                <form:errors path="password" class="text-danger"/>
                <form:input class="input" path="password"/>
            </td>
        </tr>
        <tr>
            <td colspan=2><input class="input" class="button" type="submit" value="Login Trainer"/></td>
        </tr>
        </thead>
    </table>
</form:form>


<form:form action="/trainer/register" method="post" modelAttribute="newTrainer" enctype="multipart/form-data">

    <table>
        <thead>
        <tr>
            <td colspan="2">Register as a Trainer</td>
        </tr>
        </thead>
        <thead>
        <tr>
            <td>

               <input id="avatar" type="file" name="file">
                <form:errors path="avatar"></form:errors>
            </td>
        </tr>
        <tr>
            <td class="float-left">First Name</td>
            <td class="float-left">
                <form:errors path="firstName" class="text-danger"/>
                <form:input type="text" class="input" path="FirstName"/>
            </td>
        </tr>
        <tr>
            <td class="float-left">Last Name:</td>
            <td class="float-left">
                <form:errors path="lastName" class="text-danger"/>
                <form:input type="text" class="input" path="lastName"/>
            </td>
        </tr>
        <tr>
            <td class="float-left">Email:</td>
            <td class="float-left">
                <form:errors path="email" class="text-danger"/>
                <form:input type="text" class="input" path="email"/>
            </td>
        </tr>
        <tr>
            <td class="float-left">Location:</td>
            <td class="float-left">
                <form:errors path="location" class="text-danger"/>
                <form:input type="text" class="input" path="location"/>
            </td>
        </tr>
        <tr>
            <td class="float-left">Age:</td>
            <td class="float-left">
                <form:errors path="age" class="text-danger"/>
                <form:input type="number" class="input" path="age"/>
            </td>
        </tr>
        <tr>
            <td class="float-left">Years of Experience:</td>
            <td class="float-left">
                <form:errors path="experience" class="text-danger"/>
                <form:input type="number" class="input" path="experience"/>
            </td>
        </tr>
         <tr>
            <td class="float-left">Password:</td>
            <td class="float-left">
                <form:errors path="password" class="text-danger"/>
                <form:input type="text" class="input" path="password"/>
            </td>
        </tr>
         <tr>
            <td class="float-left">Confirm Password:</td>
            <td class="float-left">
                <form:errors path="confirm" class="text-danger"/>
                <form:input class="input" path="confirm"/>
            </td>
        </tr>
        <tr>
            <td colspan=2><input class="input" class="button" type="submit" value="Submit New Trainer"/></td>
        </tr>
        </thead>
    </table>
</form:form>


</body>
</html>