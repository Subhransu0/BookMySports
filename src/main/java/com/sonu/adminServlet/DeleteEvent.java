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
import com.sonu.dao.StadiumDao;

@WebServlet("/deleteEvent")
public class DeleteEvent extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int eventId = Integer.parseInt(req.getParameter("eventId"));
		EventDao dao = new EventDao(DBconnection.getConnection());
		HttpSession session = req.getSession();
		if(dao.deleteEvent(eventId)) {
			session.setAttribute("dltevnt", "Event removed successfully");
			resp.sendRedirect("admin/home.jsp");
			
		}
		else {
			session.setAttribute("upDateerrEvent", "Internal Server Error!! Try again letter");
			resp.sendRedirect("admin/home.jsp");
		}
	}
}
