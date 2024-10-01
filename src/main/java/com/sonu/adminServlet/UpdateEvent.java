package com.sonu.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonu.DBcon.DBconnection;
import com.sonu.dao.EventDao;
import com.sonu.entity.Event;

@WebServlet("/updateEvent")
public class UpdateEvent extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("eventId"));

		String matchName = req.getParameter("matchName");
		String eventDate = req.getParameter("eventDate");
		String eventLocation = req.getParameter("eventLocation");
		int eventMaxSeats = Integer.parseInt(req.getParameter("eventMaxSeats"));
		Event ev = new Event(id, matchName, eventMaxSeats, eventLocation, eventDate);
		HttpSession session = req.getSession();
		EventDao dao = new EventDao(DBconnection.getConnection());
		if (dao.updateEvent(ev)) {
                Event e = dao.getElementById(id);
                session.setAttribute("updatesUccEvent", "Event updated successfully");
                resp.sendRedirect("admin/home.jsp");
		}
		else {
			session.setAttribute("upDateerrEvent", "Internal server Error");
			resp.sendRedirect("admin/home.jsp");
		}

	}

}
