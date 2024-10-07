<%@page import="com.sonu.entity.Booking"%>
<%@page import="java.util.List"%>
<%@page import="com.sonu.dao.TicketDao"%>
<%@page import="com.sonu.DBcon.DBconnection"%>
<%@page import="javax.servlet.jsp.jstl.core.*"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="component/allcss.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order History</title>
<style>
    .paint-card {
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        border-radius: 5px;
        transition: transform 0.2s; /* Animation for hover effect */
        width: 220px; /* Fixed width for each card */
        margin-right: 20px; /* Space between cards */
        padding: 15px; /* Padding inside card */
        background-color: #fff; /* White background for better visibility */
    }
    
    .paint-card:hover {
        transform: scale(1.05); /* Slightly enlarge card on hover */
    }

    .card-title {
        font-weight: bold;
        color: black; /* Black text color */
        margin: 10px 0; /* Space around title */
        text-align: left; /* Align title to the left */
    }

    .card-text {
        color: black; /* Black text color */
        margin: 5px 0; /* Space around text */
        text-align: left; /* Align text to the left */
    }

    .date-text {
        font-weight: bold;
        position: absolute; /* Positioning the date */
        right: 1px; /* Align to the right */
        top: 1px; /* Align to the top */
        color: black; /* Black text color for date */
    }

    .card-container {
        display: flex; /* Flexbox for horizontal layout */
        overflow-x: auto; /* Horizontal scrolling */
        padding: 10px; /* Padding around container */
    }

    .card-body {
        position: relative; /* Needed for absolute positioning of date */
        text-align: left; /* Align text to the left */
    }

    .ticket-image {
        height: 70px; /* Adjusted image height */
        width: auto; /* Maintain aspect ratio */
        margin-bottom: 5px; /* Space below the image */
    }
</style>
</head>
<body>

<%@ include file="component/navbar.jsp"%>
<c:if test="${empty userObj}">
    <c:redirect url="user_login.jsp"></c:redirect>
</c:if>

<div class="container p-5">
    <p class="text-center fs-3">ALL TICKETS</p>

    <div class="card-container">
        <%
        Integer uid = (Integer)session.getAttribute("userId");
        
        TicketDao dao = new TicketDao(DBconnection.getConnection());
        
        
        List<Booking> list = dao.getAllTicketsById(uid);
        for (Booking b : list) {
        %>
        <div class="card paint-card">
            <div class="card-body text-dark">
                <img alt="image" src="img/ticket.png" class="ticket-image">
                <div class="date-text"><%= b.getDate() %></div> <!-- Date in top right corner -->
                <h5 class="card-title"><%= b.getSportsName() %></h5>
                <p class="card-text"><strong>Match:</strong> <%= b.getMatchName() %></p>
                <p class="card-text"><strong>Stadium:</strong> <%= b.getStadiumName() %></p>
                <p class="card-text"><strong>Seats Booked:</strong> <%= b.getSeats() %></p>
            </div>
        </div>
        <%
        }
        %>
    </div>
</div>

</body>
</html>
