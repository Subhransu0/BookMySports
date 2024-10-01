package com.sonu.UserServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonu.DBcon.DBconnection;
import com.sonu.dao.UserDao;
import com.sonu.entity.User;

@WebServlet("/registeruser")
public class UserRegister extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		User u = new User(fullname, email, password);
		UserDao dao = new UserDao(DBconnection.getConnection());
		if (dao.registerUser(u)) {
			session.setAttribute("succMsg", "Registration successful!");
			resp.sendRedirect("user_login.jsp");

		} else {
			session.setAttribute("errMsg", "Something Wrong on server !");
			resp.sendRedirect("user_login.jsp");

		}
	}

}
