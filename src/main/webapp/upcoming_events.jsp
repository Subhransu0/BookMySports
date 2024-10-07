<%@page import="com.sonu.entity.User"%>
<%@page import="com.sonu.dao.UserDao"%>
<%@page import="com.sonu.dao.StadiumDao"%>
<%@page import="com.sonu.entity.Stadium"%>
<%@page import="com.sonu.entity.Event"%>
<%@page import="java.util.List"%>
<%@page import="com.sonu.DBcon.DBconnection"%>
<%@page import="com.sonu.dao.EventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upcoming events</title>
<%@include file="component/allcss.jsp"%>
<style>
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 20px;
	text-align: left;
}

/* Ensure all images have the same dimensions and are cropped uniformly */
.card-body img {
	display: block;
	width: 100%;
	/* Make the image take up the full width of its parent container */
	height: 200px; /* Fixed height for uniformity */
	object-fit: cover; /* Crop the image to fit into the container */
	border-radius: 5px; /* Rounded corners to match the card */
}

.card-body p {
	color: black;
}

.btn-wide {
	width: 100%;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">
		<p class="text-center fs-3">
			<i class="fa-solid fa-ticket"></i> <strong>BEST UPCOMING
				EVENTS</strong>
		</p>
		<c:if test="${not empty bookingConfirm }">
			<div class="alert alert-success" role="alert">
				<i class="fa-regular fa-circle-check"></i> ${bookingConfirm }
			</div>
			<c:remove var="bookingConfirm" scope="session" />
		</c:if>

		<c:if test="${not empty error }">
			<div class="alert alert-danger" role="alert">${error }</div>
			<c:remove var="error" scope="session" />
		</c:if>

		<div class="row">
			<%
			StadiumDao dao1 = new StadiumDao(DBconnection.getConnection());
			EventDao dao = new EventDao(DBconnection.getConnection());
			List<Event> list = dao.getAllEvent();
			for (Event e : list) {
				Stadium st = dao1.getStadiumById(e.getStadium_id());
			%>
			<div class="col-md-4 mt-4">
				<div class="card paint-card">
					<div class="card-body">
						<img src="Image/<%=e.getMatch_photo()%>" class="img-fluid"
							alt="Event Image" />
						<p>
							<strong><%=e.getMatch_name()%></strong>
						</p>
						<p>
							<strong>Sports:</strong><%=e.getSports_name()%></p>
						<p>
							<strong>Stadium:</strong>
							<%=st.getStadium_name()%></p>
						<p>
							<strong>Seats Available:</strong><%=e.getMax_seat()%></p>
						<p>
							<strong>Location:</strong>
							<%=e.getLocation()%></p>
						<p>
							<strong>Date:</strong>
							<%=e.getDate()%></p>

						<!-- Button to Open the Modal -->
						<button type="button" class="btn btn-danger btn-wide"
							data-bs-toggle="modal"
							data-bs-target="#bookTicketModal<%=e.getEvent_id()%>">
							Book Tickets</button>

						<!-- Modal Structure -->
						<div class="modal fade" id="bookTicketModal<%=e.getEvent_id()%>"
							tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel"><%=e.getMatch_name()%>
											- Book Tickets
										</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<p>
											<strong>Sports:</strong>
											<%=e.getSports_name()%></p>
										<p>
											<strong>Stadium:</strong>
											<%=st.getStadium_name()%></p>
										<p>
											<strong>Date:</strong>
											<%=e.getDate()%></p>
										<p>
											<strong>Location:</strong>
											<%=e.getLocation()%></p>
										<p>
											<strong>Seats Available:</strong>
											<%=e.getMax_seat()%></p>
										<form action="bookingConfirm" method="post">
											<!-- Add form inputs for ticket booking, e.g., number of seats -->
											<div class="mb-3">
												<label for="seats" class="form-label">Number of
													Tickets:</label> <input type="number" class="form-control"
													id="seats" name="seats" min="1" max="<%=e.getMax_seat()%>"
													required> <input type="hidden" name="eventId"
													value="<%=e.getEvent_id()%>"> <input type="hidden"
													name="sportsName" value="<%=e.getSports_name()%>">
												<input type="hidden" name="stadiumName"
													value="<%=st.getStadium_name()%>"> <input
													type="hidden" name="matchName"
													value="<%=e.getMatch_name()%>"> <input
													type="hidden" name="date" value="<%=e.getDate()%>">

												 <%
                                                Integer uid = (Integer) session.getAttribute("userId");
                                                if (uid != null) {
                                                %>
                                                <input type="hidden" name="uid" value="<%=uid%>">
                                                <%
                                                } else {
                                                    response.sendRedirect("user_login.jsp");
                                                }
                                                %>




												
											</div>
											<button type="submit" class="btn btn-primary">Confirm
												Booking</button>
										</form>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-danger"
											data-bs-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

</body>
</html>
