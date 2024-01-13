<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Employee</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h2>Update Employee</h2>
        <form action="${pageContext.request.contextPath}/employee/updateEmployee?empno=${employee.empno}" method="post" modelAttribute="employee">
  
            <input type="hidden" name="empno" value="${employee.empno}">
            
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" value="${employee.firstName}" required>
            
            <!-- Add other fields for update -->
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" value="${employee.lastName}" required>

            <label for="city">City:</label>
            <input type="text" id="city" name="city" value="${employee.city}" required>

            <label for="companyName">Company Name:</label>
            <input type="text" id="companyName" name="companyName" value="${employee.companyName}" required>

            <br>
            <button type="submit">Update Employee</button>
        </form>
        
        <!-- Display error message if any -->
        <c:if test="${not empty errorMessage}">
            <div class="error-message">
                ${errorMessage}
            </div>
        </c:if>
        
        <!-- Display success message if any -->
        <c:if test="${not empty successMessage}">
            <div class="success-message">
                ${successMessage}
            </div>
        </c:if>
    </div>
</body>
</html>
