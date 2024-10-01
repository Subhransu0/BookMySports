<%@page import="com.sonu.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.sonu.DBcon.DBconnection"%>
<%@page import="com.sonu.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
    <style>
        .container {
            margin-top: 50px;
        }

        .heading {
            font-size: 2rem;
            font-weight: bold;
            color: #343a40;
            margin-bottom: 30px;
        }

        .table-responsive {
            margin-top: 20px;
        }

        .table {
            border-collapse: collapse;
            width: 100%;
            background-color: #fff;
            text-align: center;
        }

        .table th, .table td {
            padding: 15px;
            border: 1px solid #dee2e6;
        }

        .table thead {
            background-color: #343a40; /* Dark background for table header */
            color: #ffffff; /* White text for header */
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1; /* Subtle hover effect on table rows */
        }

        .table td {
            vertical-align: middle;
        }

        .paint-card {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            background-color: #f8f9fa;
        }

        /* Style for "No users" message */
        .no-users-message {
            font-size: 1.2rem;
            color: #6c757d;
            text-align: center;
            margin-top: 50px;
        }
    </style>
    <%@include file="../component/allcss.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <c:if test="${empty AdminObj }">
        <c:redirect url="../admin_login.jsp"></c:redirect>
    </c:if>

    <div class="container p-5">
        <h1 class="heading text-center">List Of Users</h1>

        <div class="table-responsive">
            <table class="table table-bordered table-hover text-center align-middle">
                <thead class="thead-dark">
                    <tr>
                        <th>No.</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Password</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    UserDao dao = new UserDao(DBconnection.getConnection());
                    List<User> list = dao.getAllUser();
                    if (list != null && !list.isEmpty()) {
                        int count = 1;
                        for (User u : list) {
                    %>
                    <tr>
                        <td><%= count++ %></td>
                        <td><%= u.getFullname() %></td>
                        <td><%= u.getEmail() %></td>
                        <td><%= u.getPassword() %></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="4">
                            <div class="no-users-message">No users found</div>
                        </td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
