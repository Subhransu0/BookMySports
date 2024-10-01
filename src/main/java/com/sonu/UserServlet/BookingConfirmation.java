package com.sonu.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonu.DBcon.DBconnection;
import com.sonu.dao.EventDao;
import com.sonu.dao.TicketDao;
import com.sonu.entity.Booking;
import com.sonu.entity.Event;

@WebServlet("/bookingConfirm")
public class BookingConfirmation extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int eventId = Integer.parseInt(req.getParameter("eventId"));
		int seats = Integer.parseInt(req.getParameter("seats"));

		String sportsName = req.getParameter("sportsName");
		String stadiumName = req.getParameter("stadiumName");
		String matchName = req.getParameter("matchName");
		String date = req.getParameter("date");

		HttpSession session = req.getSession();

		Booking b = new Booking(seats, sportsName, stadiumName, matchName, date);
		TicketDao dao1 = new TicketDao(DBconnection.getConnection());

		EventDao dao = new EventDao(DBconnection.getConnection());

		Event ev = dao.getElementById(eventId);

		if (ev.getMax_seat() >= seats) {

			dao1.insertTicket(b);

			int totalseat = ev.getMax_seat() - seats;

			ev.setMax_seat(totalseat);

			boolean f = dao.updateEventSeat(ev);
			if (f) {

				session.setAttribute("bookingConfirm", "Booking confirmed for " + seats + " tickets!");
				resp.sendRedirect("upcoming_events.jsp");
			} else {
				session.setAttribute("error", "Booking failed. Please try again.");
				resp.sendRedirect("upcoming_events.jsp");
			}
		} else {
			session.setAttribute("error", "Not enough seats available.");
			resp.sendRedirect("upcoming_events.jsp");

		}

	}

}
