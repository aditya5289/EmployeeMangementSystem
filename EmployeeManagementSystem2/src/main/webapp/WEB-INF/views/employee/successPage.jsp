
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success Page</title>
</head>
<style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h2 {
            text-align: center;
            color: #4caf50;
        }
    </style>
<body>

    <h2>Employee Added Successfully!</h2>
    
    <!-- Add a link to go to index2.jsp -->
    <a href="<spring:url value='/employee/index2' />">Go to Index2</a>

</body>
</html>
