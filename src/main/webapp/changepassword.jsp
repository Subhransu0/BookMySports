<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="component/allcss.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Passwword</title>
    <style>
        .paint-card {
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2); /* Deeper shadow */
            border-radius: 10px; /* Rounded corners */
            padding: 20px; /* Add padding */
            background-color: #f8f9fa; /* Light background */
        }

        .paint-card p {
            font-size: 1.5rem; /* Larger text */
            font-weight: bold;
            margin-bottom: 20px; /* Space below heading */
            color: #343a40; /* Dark color */
        }

        .form-control {
            border: 2px solid #ced4da; /* Slightly thicker border */
            border-radius: 5px;
            padding: 10px;
            font-size: 1rem;
        }

        .form-control:focus {
            border-color: #007bff; /* Change border on focus */
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Add focus shadow */
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
            font-size: 1.1rem;
            font-weight: bold;
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-danger:hover {
            background-color: #c82333; /* Darker red on hover */
        }

        .alert {
            font-size: 1rem;
            margin-bottom: 15px;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
        }

        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>

    <%@ include file="component/navbar.jsp"%>
    <c:if test="${empty userObj}">
        <c:redirect url="user_login.jsp"></c:redirect>
    </c:if>

    <div class="container p-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <p class="text-center">Change Password</p>

                    <c:if test="${not empty succMsg}">
                        <div class="alert alert-success" role="alert">
                            <i class="fa-regular fa-circle-check"></i> ${succMsg}
                        </div>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>

                    <c:if test="${not empty errMsg}">
                        <div class="alert alert-danger" role="alert">
                            <i class="fa-regular fa-circle-check"></i> ${errMsg}
                        </div>
                        <c:remove var="errMsg" scope="session" />
                    </c:if>

                    <div class="card-body">
                        <form action="changePassword" method="post">
                            <div class="mb-3">
                                <label>Enter New Password</label>
                                <input type="password" name="newpassword" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label>Enter Old Password</label>
                                <input type="password" name="oldpassword" class="form-control" required>
                            </div>

                            <input type="hidden" name="uid" value="${userObj.id}">

                            <button class="btn btn-danger col-md-12">Change Password</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
