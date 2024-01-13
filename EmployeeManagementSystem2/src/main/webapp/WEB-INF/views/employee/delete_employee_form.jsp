<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Employee</title>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
    <div class="container">
        <h2>Delete Employee</h2>
        <form action="${pageContext.request.contextPath}/employee/delete" method="post">
            <label for="empno">Employee ID:</label>
            <input type="text" id="empno" name="empno" required>
            <br>
            <button type="submit">Delete Employee</button>
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
