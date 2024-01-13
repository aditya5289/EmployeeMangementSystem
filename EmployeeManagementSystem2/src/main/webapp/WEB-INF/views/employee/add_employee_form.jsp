<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Form</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        table {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 400px;
            margin-top: 20px;
        }

        td {
            padding: 10px;
        }

        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Employee Registration Form</h2>
    <spring:url var="url" value="/employee/add" />
    <form:form action="${url}" method="post" modelAttribute="employee">
        <table>
            <tr>
                <td>Enter First Name</td>
                <td><form:input path="firstName" /></td>
            </tr>
            <tr>
                <td>Enter Last Name</td>
                <td><form:input path="lastName" /></td>
            </tr>
            <tr>
                <td>Enter City</td>
                <td><form:input path="city" /></td>
            </tr>
            <tr>
                <td>Enter Company Name</td>
                <td><form:input path="companyName" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Add an Employee" /></td>
            </tr>
        </table>
    </form:form>
</body>
</html>
