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

@WebServlet("/userLogin")
public class UserLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("passsword");
		HttpSession session = req.getSession();
		UserDao dao = new UserDao(DBconnection.getConnection());
		User u = dao.userLogin(email , password);  
		if (u != null) {
			session.setAttribute("userId", u.getId());
			session.setAttribute("userObj", u);
			resp.sendRedirect("index.jsp");
		}
		else {
			session.setAttribute("usereloginerror", "invalid email and Password");
			resp.sendRedirect("user_login.jsp");
		}
	}

}
