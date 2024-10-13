<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-danger">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">BookMY<i
			class="fa-solid fa-medal"></i>Sportz
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.jsp"> HOME</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="add_stadium.jsp">ADD STADIUM</a></li>
				
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="create_upcoming_event.jsp">CREATE UPCOMING-EVENT</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="user_list.jsp">USER LIST</a></li>
			</ul>
			<div class="dropdown ms-auto">
				<button class="btn btn-light dropdown-toggle" type="button"
					id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false"><i class="fa-solid fa-circle-user"></i>  <strong>ADMIN</strong> </button>
				<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					<li><a class="dropdown-item" href="../adminlogout">Logout</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>