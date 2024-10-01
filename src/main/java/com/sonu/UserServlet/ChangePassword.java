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

@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int uid = Integer.parseInt(req.getParameter("uid"));
		String oldpass = req.getParameter("oldpassword");
		String newPassword = req.getParameter("newpassword");
		
		UserDao dao = new UserDao(DBconnection.getConnection());
		HttpSession session = req.getSession();
		
		if(dao.checkOldPassword(uid, oldpass)) {
			if(dao.changeOldPassword(uid, newPassword)) {
				session.setAttribute("succMsg", "Password Change Successfully");
				resp.sendRedirect("changepassword.jsp");
			}else {
				session.setAttribute("errMsg", "Something wrong on server !!");
				resp.sendRedirect("changepassword.jsp");
			}
			
		}
		else {
			session.setAttribute("errMsg", "Old Password is Incorrect");
			resp.sendRedirect("changepassword.jsp");
		}
	}


}
