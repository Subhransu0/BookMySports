package com.sonu.adminServlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.sonu.DBcon.DBconnection;
import com.sonu.dao.StadiumDao;
import com.sonu.entity.Stadium;

@MultipartConfig
@WebServlet("/addStadium")
public class StadiumAddServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Part p = req.getPart("stadiumPicture");
			String filename = p.getSubmittedFileName();

			String stadiumName = req.getParameter("stadiumName");
			String stadiumLocation = req.getParameter("stadiumLocation");
			int totalSeats = Integer.parseInt(req.getParameter("totalSeats"));
			HttpSession session = req.getSession();

			Stadium std = new Stadium(stadiumName, stadiumLocation, totalSeats, filename);
			StadiumDao dao = new StadiumDao(DBconnection.getConnection());
			if (dao.addStadium(std)) {
				String path = getServletContext().getRealPath("") + "Image";
				File file = new File(path);
				if (!file.exists()) {
                    file.mkdirs();  
                }
				p.write(path + File.separator + filename);

				session.setAttribute("sucMsg", "Stadium has been added successfully");
				resp.sendRedirect("admin/add_stadium.jsp");
			} else {
				session.setAttribute("errMsg", "Something Wrong on Server!!");
				resp.sendRedirect("admin/add_stadium.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
