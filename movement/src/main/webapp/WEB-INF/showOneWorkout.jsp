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
        <a href="/workout/likeWorkout/${workout.id}">Like</a>
		<input type="button" value="Like this Workout" onclick="addOneLike()"/> 
        
    </div>
    <div>
        <h3>${workout.title} by instructor <a href="/trainer/home/${workout.trainer.id}">${workout.trainer.firstName} ${workout.trainer.lastName}</a></h3>
        <h3>Areas Targeted: ${workout.target}</h3>
        <h3>Difficulty Level: ${workout.difficulty}</h3>
        <h3>Here is the workout:</h3>
        <p>${workout.details}</p>
        <h3>Workout PlayList: ${playlist}</h3>
    </div>
    
   	<c:set var="trainerID" value="${workout.trainer.id}"/>
	<c:set var="sessionTrainerID" value="${sessionTrainer.id}"/>
   	<c:if test= "${trainerID == sessionTrainerID}">
		<a href="/trainer/home/${sessionTrainer.id}">Back to Your Workouts (Trainer)</a>
		
	</c:if>
	
	<c:set var="sessionUserID" value="${user.id}"/>
   	<c:if test= "${sessionUserID != null}">
		<a href="/user/home">Back to Your Workouts (User)</a>
		
	</c:if>
   	
<!--     <a href="/user/home">Back to Your Workouts</a>
 -->
</body>
</html>