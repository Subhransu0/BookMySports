<%@page import="com.sonu.entity.Stadium"%>
<%@page import="java.util.List"%>
<%@page import="com.sonu.DBcon.DBconnection"%>
<%@page import="com.sonu.dao.StadiumDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Upcoming Sports</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty AdminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">
		<p class="text-center fs-3">Create Upcoming Sports Event</p>
		<c:if test="${ not empty eventCreat }">
			<div class="alert alert-success" role="alert"><i class="fa-regular fa-circle-check"></i> ${eventCreat }</div>
			<c:remove var="eventCreat" scope="session" />
		</c:if>

		<div class="row">
			<!-- Cricket Card -->
			<div class="col-md-4 mt-4">
				<div class="card paint-card">
					<div class="card-body text-center text-dark">
						<img src="../img/cricket.png" alt="Cricket" class="img-fluid"
							style="cursor: pointer; width: 100px;"
							onclick="openModal('Cricket')">
						<p class="fs-4">Cricket</p>
					</div>
				</div>
			</div>

			<!-- Football Card -->
			<div class="col-md-4 mt-4">
				<div class="card paint-card">
					<div class="card-body text-center text-dark">
						<img src="../img/football.png" alt="Football" class="img-fluid"
							style="cursor: pointer; width: 100px;"
							onclick="openModal('Football')">
						<p class="fs-4">Football</p>
					</div>
				</div>
			</div>

			<!-- Volleyball Card -->
			<div class="col-md-4 mt-4">
				<div class="card paint-card">
					<div class="card-body text-center text-dark">
						<img src="../img/Volleyball.png" alt="Volleyball"
							class="img-fluid" style="cursor: pointer; width: 100px;"
							onclick="openModal('Volleyball')">
						<p class="fs-4">Volleyball</p>
					</div>
				</div>
			</div>

			<!-- Basketball Card -->
			<div class="col-md-4 mt-4">
				<div class="card paint-card">
					<div class="card-body text-center text-dark">
						<img src="../img/basketball.png" alt="Basketball"
							class="img-fluid" style="cursor: pointer; width: 100px;"
							onclick="openModal('Basketball')">
						<p class="fs-4">Basketball</p>
					</div>
				</div>
			</div>

			<!-- Hockey Card -->
			<div class="col-md-4 mt-4">
				<div class="card paint-card">
					<div class="card-body text-center text-dark">
						<img src="../img/hockey.png" alt="Hockey" class="img-fluid"
							style="cursor: pointer; width: 100px;"
							onclick="openModal('Hockey')">
						<p class="fs-4">Hockey</p>
					</div>
				</div>
			</div>

			<!-- Olympic Card -->
			<div class="col-md-4 mt-4">
				<div class="card paint-card">
					<div class="card-body text-center text-dark">
						<img src="../img/olympic-img.png" alt="Olympics" class="img-fluid"
							style="cursor: pointer; width: 100px;"
							onclick="openModal('Olympic')">
						<p class="fs-4">Olympic</p>
					</div>
				</div>
			</div>


		</div>
	</div>

	<!-- Updated Reusable Modal -->
	<div class="modal fade" id="eventModal" tabindex="-1"
		aria-labelledby="eventModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="eventModalLabel">Event
						Registration</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">


					<form id="eventForm" action="../eventServlet" method="POST"
						enctype="multipart/form-data">
						<div class="mb-3">
							<label for="sportsType" class="form-label">Sports Type</label> <select
								class="form-control custom-select" name="sports_name"
								id="sportsType" required>
								<option value="" disabled selected>Select a Sport</option>
								<option value="Cricket">Cricket</option>
								<option value="Football">Football</option>
								<option value="Volleyball">Volleyball</option>
								<option value="Basketball">Basketball</option>
								<option value="Hockey">Hockey</option>
								<option value="Olympics">Olympics</option>
								<option value="Esports">E-sports</option>
							</select>
						</div>


						<div class="mb-3">
							<label for="stadium" class="form-label">Stadium</label> <select
								class="form-control custom-select" name="stadium" id="stadium"
								required>
								<option value="" disabled selected>Select a Stadium</option>
								<%
								StadiumDao dao = new StadiumDao(DBconnection.getConnection());
								List<Stadium> list = dao.getAllStadiumList();
								for (Stadium s : list) {
								%>
								<option value="<%=s.getStadium_id()%>"><%=s.getStadium_name()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="mb-3">
							<label for="matchName" class="form-label">Match Name</label> <input
								type="text" class="form-control" name="matchName" id="matchName"
								required>
						</div>
						<div class="mb-3">
							<label for="matchPhoto" class="form-label">Match Photo</label> <input
								type="file" class="form-control" name="matchPhoto"
								id="matchPhoto" accept="image/*" required>
						</div>
						<div class="mb-3">
							<label for="maxSeat" class="form-label">Maximum Seats</label> <select
								class="form-control" name="maxSeat" id="maxSeat" required>
								<option value="" disabled selected>Select Stadium and
									Seats</option>
								<%
								StadiumDao dao1 = new StadiumDao(DBconnection.getConnection());
								List<Stadium> list1 = dao1.getAllStadiumList();
								for (Stadium s1 : list1) {
								%>
								<option value="<%=s1.getMax_seat()%>"><%=s1.getStadium_name()%>
									(<%=s1.getMax_seat()%>)
								</option>
								<%
								}
								%>
							</select>
						</div>

						<div class="mb-3">
							<label for="location" class="form-label">Location</label> <select
								class="form-control" name="location" id="location" required>
								<option value="" disabled selected>Select a Location</option>
								<%
								StadiumDao dao2 = new StadiumDao(DBconnection.getConnection());
								List<Stadium> list2 = dao2.getAllStadiumList();
								for (Stadium s2 : list2) {
								%>
								<option value="<%=s2.getLocation()%>"><%=s2.getStadium_name()%>
									-
									<%=s2.getLocation()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="mb-3">
							<label for="eventDate" class="form-label">Event Date</label> <input
								type="date" class="form-control" name="eventDate" id="eventDate"
								required>
						</div>
						

						<button type="submit" class="btn btn-primary">Submit</button>
					</form>


				</div>
			</div>
		</div>
	</div>

	<script>
		function openModal(eventName) {
			document.getElementById('eventModalLabel').innerText = eventName
					+ " Event Registration";
			var myModal = new bootstrap.Modal(document
					.getElementById('eventModal'), {});
			myModal.show();
		}
	</script>



</body>
</html>