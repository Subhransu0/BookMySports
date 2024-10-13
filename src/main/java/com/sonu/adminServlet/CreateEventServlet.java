package com.sonu.adminServlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.sonu.DBcon.DBconnection;
import com.sonu.dao.EventDao;
import com.sonu.entity.Event;

@MultipartConfig
@WebServlet("/eventServlet")
public class CreateEventServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String sports_name = req.getParameter("sports_name");
			int stadium_id = Integer.parseInt(req.getParameter("stadium"));
			String matchName = req.getParameter("matchName");
			
			Part p = req.getPart("matchPhoto");
			String filename = p.getSubmittedFileName();
			
			int maxSeat = Integer.parseInt(req.getParameter("maxSeat"));
			String location = req.getParameter("location");
			String eventDate = req.getParameter("eventDate");
			HttpSession session = req.getSession();
			Event ev = new Event(sports_name, stadium_id, matchName, filename, maxSeat, location, eventDate);
			EventDao dao = new EventDao(DBconnection.getConnection());
			if (dao.creteEvent(ev)) {
				
				String path = getServletContext().getRealPath("") + "Image";
				File file = new File(path);
				if (!file.exists()) {
					file.mkdirs(); // Create the directory if it does not exist
				}
				p.write(path + File.separator + filename);
				session.setAttribute("eventCreat", "You have created an event successfully.");
				resp.sendRedirect("admin/create_upcoming_event.jsp");
			} else {
				session.setAttribute("eventCreaterr", "Something Wrong on Server!!!!");
				resp.sendRedirect("admin/create_upcoming_event.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
