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
        <a href="/user/logout">Logout</a>
    </div>
    <div>
        <h3>Here are some awesome workouts to try:</h3>
        <table>
            <tr>
                <th>Workout Title</th>
                <th>Targeted Area</th>
                <th>Instructor</th>
                <th>Workout Likes</th>
            </tr>
            <c:forEach var="workout" items="${workout}">
                <tr>
                    <td><a href="/workout/${workout.id}">${workout.title}</a></td>
                    <td>${workout.target}</td>
                    <td><a href="/user/viewInstructor/${workout.trainer.id}">${workout.trainer.firstName}</a></td>
                    <td>${workout.getUserLikes()}</td>
                 </tr>
            </c:forEach>
        </table>
    </div>
    <a href="/user/home">Your Workouts</a>
    

</body>
</html>