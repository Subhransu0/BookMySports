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
          

@WebServlet("/deleteStadium")
public class DeleteStadium extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int stadiumId = Integer.parseInt(req.getParameter("stadiumId"));
		StadiumDao dao = new StadiumDao(DBconnection.getConnection());
		HttpSession session = req.getSession();
		if(dao.deletStadium(stadiumId)) {
			session.setAttribute("dltStad", "Stadium removed successfully");
			resp.sendRedirect("admin/home.jsp");
			
		}
		else {
			session.setAttribute("upDateerr", "Internal Server Error!! Try again letter");
			resp.sendRedirect("admin/home.jsp");
		}
	}

}
