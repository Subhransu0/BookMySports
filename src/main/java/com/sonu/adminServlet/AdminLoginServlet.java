package com.sonu.adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonu.entity.User;
@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String Password =req.getParameter("password");
		HttpSession session = req.getSession();
		if(email.equals("admin@gmail.com") && Password.equals("admin")) {
			session.setAttribute("AdminObj", new User());
			resp.sendRedirect("admin/home.jsp");
		}
		else {
			session.setAttribute("errrMsg", "Email and password do not match!");
			resp.sendRedirect("admin_login.jsp");
		}
	}

}
