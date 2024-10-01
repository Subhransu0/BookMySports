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
							<Strong>USER LOGIN</Strong>

						</p>
						<c:if test="${not empty succMsg }">
							<div class="alert alert-success" role="alert"><i class="fa-regular fa-circle-check"></i> ${succMsg }</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<c:if test="${not empty usereloginerror }">
							<div class="alert alert-danger" role="alert">${usereloginerror }</div>
							<c:remove var="usereloginerror" scope="session" />
						</c:if>
						
						<c:if test="${not empty logoutObject }">
							<div class="alert alert-success" role="alert"><i class="fa-regular fa-circle-check"></i> ${logoutObject }</div>
							<c:remove var="logoutObject" scope="session" />
						</c:if>


						<form action="userLogin" method="post">

							<div class="mb-3">
								<label class="form-lable"><i
									class="fa-solid fa-envelope"></i> Email Address</label> <input required
									name="email" type="email" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-lable"><i class="fa-solid fa-lock"></i>
									Password</label> <input required name="passsword" type="password"
									class="form-control">
							</div>

							<button type="submit" class="btn bg-danger text-white col-md-12">Login</button>
						</form>
						<p class="mt-3 text-center">
							Don't have an account? <a href="register.jsp"
								class="text-decoration-none">Sign Up</a>
						</p>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>