<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>
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
            margin-top: 50px;
        }

        table {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: auto;
            width: 50%;
            text-align: left;
            padding: 20px;
            margin-top: 20px;
        }

        td {
            padding: 15px;
        }

        a, button {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
            cursor: pointer;
        }

        a:hover, button:hover {
            color: #4caf50;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Welcome to Employee Management System Portal</h2>
    <table>
        <tr>
            <td><spring:url var="url" value="/employee/add" /><a href="${url}">1. Add Employee Form</a></td>
        </tr>
        <tr>
            <td><spring:url var="all" value="/employee/all" /><a href="${all}">2. Show All Employees</a></td>
        </tr>
        <tr>
            <td><spring:url var="bycompany" value="/employee/company" /><a href="${bycompany}">3. Display employees by company name</a></td>
        </tr>
        <!-- Added 4th and 5th options -->
        <tr>
            <td><spring:url var="delete" value="/employee/delete" /><a href="${delete}">4. Delete Employee</a></td>
        </tr>
        <tr>
            <td><spring:url var="update" value="/employee/update" /><button onclick="openUpdateModal('${update}')">5. Update Employee</button></td>
        </tr>
    </table>

    <!-- Modal -->
    <div id="empnoModal" class="modal">
        <div class="modal-content">
            <label for="empno">Employee ID:</label>
            <input type="text" id="empno" name="empno" required>
            <br>
            <button onclick="closeModal()">Cancel</button>
            <button onclick="updateEmployee('${update}')">Update Employee</button>
        </div>
    </div>

    <!-- JavaScript functions -->
    <script>
        function openUpdateModal(updateUrl) {
            document.getElementById("empno").value = ""; // Clear previous input
            document.getElementById("empnoModal").style.display = "flex";
        }

        function closeModal() {
            document.getElementById("empnoModal").style.display = "none";
        }

        function updateEmployee(updateUrl) {
            var empno = document.getElementById("empno").value.trim();
            if (empno !== "") {
                window.location.href = updateUrl + "?empno=" + empno;
            } else {
                // Handle empty input if needed
            }
        }
    </script>
</body>
</html>
