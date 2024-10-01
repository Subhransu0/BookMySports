<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Stadium</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
body {
	background-color: #f8f9fa;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.form-container {
	background-color: #ffffff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 600px;
	margin: 50px auto;
}

.form-header {
	margin-bottom: 30px;
}

.form-header h2 {
	font-weight: 700;
	color: #343a40;
}

.form-header p {
	font-size: 16px;
	color: #6c757d;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
	font-weight: 600;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #004085;
}
</style>

</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty AdminObj }">
        <c:redirect url="../admin_login.jsp"></c:redirect>
    </c:if>

	<div class="container">
		<div class="form-container">
			<div class="form-header text-center">
				<h2>Add Stadium Details</h2>
				<c:if test="${not empty sucMsg }">
					<div class="alert alert-success" role="alert"><i class="fa-regular fa-circle-check"></i> ${sucMsg }</div>
					<c:remove var="sucMsg" scope="session" />
				</c:if>
				<c:if test="${not empty errMsg }">
					<div class="alert alert-success" role="alert"><i class="fa-regular fa-circle-check"></i> ${errMsg }</div>
					<c:remove var="errMsg" scope="session" />
				</c:if>
				<p>Please fill in the stadium details to add a new stadium for
					the upcoming event.</p>
			</div>

			<form action="../addStadium" method="POST"
				enctype="multipart/form-data">
				<!-- Stadium Picture Upload -->
				<div class="mb-3">
					<label for="stadiumPicture" class="form-label">Stadium
						Picture</label> <input type="file" class="form-control"
						id="stadiumPicture" name="stadiumPicture" accept="image/*"
						required>
				</div>

				<!-- Stadium Name Field -->
				<div class="mb-3">
					<label for="stadiumName" class="form-label">Name of the
						Stadium</label> <input type="text" class="form-control" id="stadiumName"
						name="stadiumName" placeholder="Enter Stadium Name" required>
				</div>

				<!-- Location Field -->
				<div class="mb-3">
					<label for="stadiumLocation" class="form-label">Location</label> <input
						type="text" class="form-control" id="stadiumLocation"
						name="stadiumLocation" placeholder="Enter Stadium Location"
						required>
				</div>

				<!-- Total Seats Field -->
				<div class="mb-3">
					<label for="totalSeats" class="form-label">Total Seats</label> <input
						type="number" class="form-control" id="totalSeats"
						name="totalSeats" placeholder="Enter Total Number of Seats"
						required>
				</div>

				<!-- Submit Button -->
				<button type="submit" class="btn btn-primary w-100">Submit
					Stadium Details</button>
			</form>

		</div>
	</div>
</body>
</html>