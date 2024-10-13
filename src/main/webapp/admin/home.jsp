<%@page import="com.sonu.entity.Event"%>
<%@page import="com.sonu.dao.EventDao"%>
<%@page import="com.sonu.entity.Stadium"%>
<%@page import="java.util.List"%>
<%@page import="com.sonu.DBcon.DBconnection"%>
<%@page import="com.sonu.dao.StadiumDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Stadium List</title>
<%@include file="../component/allcss.jsp"%>
<!-- Include external CSS -->

<style>
.table-img {
	width: 120px; /* Adjusted image size for better visual impact */
	height: auto;
	border-radius: 8px; /* Rounded corners for images */
}

.table thead {
	background-color: #343a40; /* Dark background for table header */
	color: #ffffff; /* White text for header */
}

.table-hover tbody tr:hover {
	background-color: #f1f1f1; /* Subtle hover effect on table rows */
}

.container {
	margin-top: 50px;
}

.heading {
	font-family: 'Arial', sans-serif;
	font-size: 36px;
	font-weight: bold;
	text-transform: uppercase;
	letter-spacing: 2px;
	margin-bottom: 40px;
	color: #333;
}

.btn-action {
	padding: 5px 10px;
	font-size: 14px;
	margin-right: 5px;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<!-- Navigation bar -->

	<!-- Check for Admin session -->
	<c:if test="${empty AdminObj}">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<div class="text-center mt-4">
		<p class="text-center fs-3">
			<i class="fa-solid fa-gears"></i> Admin Dashboard
		</p>
	</div>

	<!-- Container for the stadium list -->
	<div class="container p-5">
		<h1 class="heading text-center mb-4">List Of Stadiums</h1>

		<c:if test="${not empty upDate }">
			<div class="alert alert-success" role="alert"><i class="fa-regular fa-circle-check"></i> ${upDate }</div>
			<c:remove var="upDate" scope="session" />
		</c:if>
		<c:if test="${not empty dltStad }">
			<div class="alert alert-success" role="alert"><i class="fa-regular fa-circle-check"></i> ${dltStad }</div>
			<c:remove var="dltStad" scope="session" />
		</c:if>
		<c:if test="${not empty upDateerr }">
			<div class="alert alert-danger" role="alert">${upDateerr }</div>
			<c:remove var="upDateerr" scope="session" />
		</c:if>

		<!-- Bootstrap table with responsive design -->
		<div class="table-responsive">
			<table
				class="table table-bordered table-hover text-center align-middle">
				<thead class="thead-dark">
					<tr>
						<th>No.</th>
						<th>Image</th>
						<th>Stadium Name</th>
						<th>Location</th>
						<th>Max Seats</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					StadiumDao dao = new StadiumDao(DBconnection.getConnection());
					List<Stadium> list = dao.getAllStadiumList();
					int count = 1;
					for (Stadium std : list) {
					%>
					<tr>
						<td><%=count++%></td>
						<td><img src="../Image/<%=std.getStadium_img()%>"
							class="img-fluid table-img" alt="Stadium Image" /></td>
						<td><%=std.getStadium_name()%></td>
						<td><%=std.getLocation()%></td>
						<td><%=std.getMax_seat()%></td>
						<td>
							<!-- Edit and Delete buttons trigger modals -->
							<button class="btn btn-primary btn-action" data-bs-toggle="modal"
								data-bs-target="#editModal"
								onclick="populateEditModal(<%=std.getStadium_id()%>, '<%=std.getStadium_name()%>', '<%=std.getLocation()%>', <%=std.getMax_seat()%>)">Edit</button>
							<button class="btn btn-dark btn-action" data-bs-toggle="modal"
								data-bs-target="#deleteModal"
								onclick="populateDeleteModal(<%=std.getStadium_id()%>, '<%=std.getStadium_name()%>')">Remove</button>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<!-- Edit Modal -->
	<div class="modal fade" id="editModal" tabindex="-1"
		aria-labelledby="editModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editModalLabel">Edit Stadium</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">


					<form id="editForm" action="../updateStadium" method="post">
						<input type="hidden" id="stadiumId"
							value="${UpdateObj.stadium_id }" name="stadiumId">
						<div class="mb-3">
							<label for="stadiumName" class="form-label">Stadium Name</label>
							<input type="text" class="form-control"
								value="${UpdateObj.stadium_name }" id="stadiumName"
								name="stadiumName">
						</div>
						<div class="mb-3">
							<label for="stadiumLocation" class="form-label">Location</label>
							<input type="text" class="form-control"
								value="${UpdateObj.location }" id="stadiumLocation"
								name="stadiumLocation">
						</div>
						<div class="mb-3">
							<label for="maxSeats" class="form-label">Max Seats</label> <input
								type="number" class="form-control"
								value="${UpdateObj.max_seat }" id="maxSeats" name="maxSeats">
						</div>
						<button type="submit" class="btn btn-primary">Save
							changes</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Delete Confirmation Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteModalLabel">Delete
						Confirmation</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>
						Are you sure you want to delete the stadium: <strong
							id="deleteStadiumName"></strong>?
					</p>
				</div>
				<div class="modal-footer">


					<form id="deleteForm" action="../deleteStadium" method="post">
						<input type="hidden" id="deleteStadiumId" name="stadiumId">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-danger">Delete</button>
					</form>


				</div>
			</div>
		</div>
	</div>

	<!-- Upcoming events -->

	

	<div class="container p-5">
		<h1 class="heading text-center mb-4">UPCOMING-EVENT</h1>
		<c:if test="${not empty updatesUccEvent }">
			<div class="alert alert-success" role="alert"><i class="fa-regular fa-circle-check"></i> ${updatesUccEvent }</div>
			<c:remove var="updatesUccEvent" scope="session" />
		</c:if>
		<c:if test="${not empty dltevnt }">
			<div class="alert alert-success" role="alert"><i class="fa-regular fa-circle-check"></i> ${dltevnt }</div>
			<c:remove var="dltevnt" scope="session" />
		</c:if>
		<c:if test="${not empty upDateerrEvent }">
			<div class="alert alert-danger" role="alert">${upDateerrEvent }</div>
			<c:remove var="upDateerrEvent" scope="session" />
		</c:if>

		<!-- Bootstrap table for event list -->
		<div class="table-responsive">
			<table
				class="table table-bordered table-hover text-center align-middle">
				<thead class="thead-dark">
					<tr>
						<th>No.</th>
						<th>Image</th>
						<th>Event Name</th>
						<th>Sport</th>
						<th>Stadium</th>
						<th>Max Seats</th>
						<th>Location</th>
						<th>Date</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<%
					StadiumDao daoo = new StadiumDao(DBconnection.getConnection());

					EventDao eventDao = new EventDao(DBconnection.getConnection());
					List<Event> eventList = eventDao.getAllEvent();
					int count1 = 1;
					for (Event ev : eventList) {
						Stadium d = daoo.getStadiumById(ev.getStadium_id());
					%>
					<tr>
						<td><%=count1++%></td>
						<td><img src="../Image/<%=ev.getMatch_photo()%>"
							class="img-fluid table-img" alt="Stadium Image" /></td>
						<td><%=ev.getMatch_name()%></td>
						<td><%=ev.getSports_name()%></td>
						<td><%=d.getStadium_name()%></td>
						<td><%=ev.getMax_seat()%></td>
						<td><%=ev.getLocation()%></td>
						<td><%=ev.getDate()%></td>
						<td>
							<button class="btn btn-primary btn-action" data-bs-toggle="modal"
								data-bs-target="#editEventModal"
								onclick="populateEditEventModal(<%=ev.getEvent_id()%>, '<%=ev.getMatch_name()%>', '<%=ev.getLocation()%>', <%=ev.getMax_seat()%>)">Edit</button>
							<button class="btn btn-dark btn-action" data-bs-toggle="modal"
								data-bs-target="#deleteEventModal"
								onclick="populateDeleteEventModal(<%=ev.getEvent_id()%>, '<%=ev.getMatch_name()%>')">Delete</button>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<!-- Edit Event Modal -->
	<!-- Edit Event Modal -->
<div class="modal fade" id="editEventModal" tabindex="-1" aria-labelledby="editEventModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editEventModalLabel">Edit Event</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editEventForm" action="../updateEvent" method="post">
                    <input type="hidden" id="eventId" name="eventId">

                    <!-- Event Name Field -->
                    <div class="mb-3">
                        <label for="matchName" class="form-label">Event Name</label>
                        <input type="text" class="form-control" id="matchName" name="matchName">
                    </div>

                    <!-- Date Field -->
                    <div class="mb-3">
                        <label for="eventDate" class="form-label">Date</label>
                        <input type="date" class="form-control" id="eventDate" name="eventDate">
                    </div>

                    <!-- Location Field -->
                    <div class="mb-3">
                        <label for="eventLocation" class="form-label">Location</label>
                        <input type="text" class="form-control" id="eventLocation" name="eventLocation">
                    </div>

                    <!-- Max Seats Field -->
                    <div class="mb-3">
                        <label for="eventMaxSeats" class="form-label">Max Seats</label>
                        <input type="number" class="form-control" id="eventMaxSeats" name="eventMaxSeats">
                    </div>

                    <button type="submit" class="btn btn-primary">Save changes</button>
                </form>
            </div>
        </div>
    </div>
</div>


	<!-- Delete Event Confirmation Modal -->
	<div class="modal fade" id="deleteEventModal" tabindex="-1"
		aria-labelledby="deleteEventModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteEventModalLabel">Delete
						Confirmation</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>
						Are you sure you want to delete the event: <strong
							id="deleteEventName"></strong>?
					</p>
				</div>
				<div class="modal-footer">
				
				
					<form id="deleteEventForm" action="../deleteEvent" method="post">
						<input type="hidden" id="deleteEventId" name="eventId">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-danger">Delete</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
	function populateEditEventModal(id, name, location, seats, date) {
	    document.getElementById("eventId").value = id;
	    document.getElementById("matchName").value = name;
	    document.getElementById("eventLocation").value = location;
	    document.getElementById("eventMaxSeats").value = seats;
	    document.getElementById("eventDate").value = date; 
	}


    function populateDeleteEventModal(id, name) {
        document.getElementById("deleteEventId").value = id;
        document.getElementById("deleteEventName").innerText = name;
    }
</script>


	<script>
        function populateEditModal(id, name, location, seats) {
            document.getElementById("stadiumId").value = id;
            document.getElementById("stadiumName").value = name;
            document.getElementById("stadiumLocation").value = location;
            document.getElementById("maxSeats").value = seats;
        }

        function populateDeleteModal(id, name) {
            document.getElementById("deleteStadiumId").value = id;
            document.getElementById("deleteStadiumName").innerText = name;
        }
    </script>

</body>
</html>
