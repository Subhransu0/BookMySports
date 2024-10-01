<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<%@include file="component/allcss.jsp"%>
<style>
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">

						<p class="fs-4 text-center">
							<Strong>USER REGISTER</Strong>
						</p>

						<form action="registeruser" method="post">

							<div class="mb-3">
								<label class="form-lable"><i class="fa-solid fa-user"></i>Full Name</label> <input required
									name="fullname" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-lable"><i
									class="fa-solid fa-envelope"></i> Email Address</label> <input required
									name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-lable"><i class="fa-solid fa-lock"></i>
									Password</label> <input required name="password" type="password"
									class="form-control">
							</div>

							<button type="submit" class="btn bg-danger text-white col-md-12">Login</button>
						</form>				
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>