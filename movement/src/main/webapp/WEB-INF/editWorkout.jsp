<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <title></title>
</head>
<body>
    <div>
        <h1>MOV3M3NT</h1>
    </div>
    <div>
        <form:form action="/workout/edit/${oneWorkout.id}" method="POST" modelAttribute="oneWorkout">
            
            <form:label path="title">Name of Workout</form:label>
            <form:errors path="title"></form:errors>
            <form:input type="text" path="title"></form:input>
            
            <form:label path="target"></form:label>
            <form:errors path="target"></form:errors>
            <form:input type="text" path="target"></form:input>
            
            <form:label path="details"></form:label>
            <form:errors path="details"></form:errors>
            <form:input type="text" path="details"></form:input>
            
            <form:label path="difficulty"></form:label>
            <form:select path="difficulty">
                <option value="beginner">Beginner</option>
                <option value="intermediate">Intermediate</option>
                <option value="hard">Hard</option>
                <option value="advanced">Advanced</option>
            </form:select>
            
            <form:input type="hidden" path="trainer" value="${sessionTrainer.id}"></form:input>
            
            
            <input type="submit" value="Edit Your Workout" />
        
        </form:form>
    </div>
        <a href="/trainer/home/${sessionTrainer.id}">Back to your Trainer page</a>
       

</body>
</html>