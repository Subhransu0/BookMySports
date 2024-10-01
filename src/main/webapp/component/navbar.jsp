<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp">BookMY<i
			class="fa-solid fa-medal"></i>Sportz
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<c:if test="${not empty userObj }">
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav ">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp"><i
							class="fa-solid fa-house"></i> HOME</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="upcoming_events.jsp"><i
							class="fa-solid fa-calendar-check"></i> UPCOMING-EVENTS</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="history.jsp"><i
							class="fa-solid fa-ticket"></i> YOUR ORDERS</a></li>

				</ul>
				<div class="dropdown ms-auto">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">
						<i class="fa-solid fa-circle-user"></i> ${userObj.fullname}
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="changepassword.jsp">Change
								Password</a></li>
						<li><a class="dropdown-item" href="userlogout">Logout</a></li>
					</ul>
				</div>
			</div>
		</c:if>
		<c:if test="${empty userObj }">
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="admin_login.jsp"><i
							class="fa-solid fa-user-gear"></i> ADMIN</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp"><i
							class="fa-solid fa-house"></i> HOME</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_login.jsp"><i
							class="fa-regular fa-user"></i> SIGN IN</a></li>

				</ul>
			</div>
		</c:if>
	</div>
</nav>