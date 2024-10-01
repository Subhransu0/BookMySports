package com.sonu.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonu.DBcon.DBconnection;
import com.sonu.dao.StadiumDao;
import com.sonu.entity.Stadium;

@WebServlet("/updateStadium")
public class UpdateStadium extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("stadiumId"));
		String stadiumName = req.getParameter("stadiumName");
		String stadiumLocation = req.getParameter("stadiumLocation");
		int maxSeats = Integer.parseInt(req.getParameter("maxSeats"));
		HttpSession session = req.getSession();

		Stadium std = new Stadium(id, stadiumName, stadiumLocation, maxSeats);
		StadiumDao dao = new StadiumDao(DBconnection.getConnection());

		if (dao.updateStadium(std)) {
			Stadium s = dao.getStadiumById(id);
			session.setAttribute("upDate", "Stadium updated successfully");
			session.setAttribute("UpdateObj", s);
			resp.sendRedirect("admin/home.jsp");
		} else {
			session.setAttribute("upDateerr", "Internal server Error");
			resp.sendRedirect("admin/home.jsp");

		}

	}

}
