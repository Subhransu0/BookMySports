package com.sonu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sonu.entity.User;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean registerUser(User u) {
		boolean f = false;
		try {
			String sql = "insert into user(fullname,email,password) values (?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u.getFullname());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public User userLogin(String email, String password) {
		User u = null;
		try {
			String sql = "select * from user where email=? and password= ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setFullname(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}

	public boolean checkOldPassword(int userId, String oldpassword) {
		boolean f = false;

		try {
			String sql = "select * from user where id=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, oldpassword);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean changeOldPassword(int userId, String newpassword) {
		boolean f = false;
		try {
			String sql = "update user set password=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, newpassword);
			ps.setInt(2, userId);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<User> getAllUser() {
		List<User> list = new ArrayList<>();
		User u = null;
		try {
			String sql = "select * from user";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setFullname(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				list.add(u);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public User getElementByid(int id) {
		User u = null;
		try {
			String sql = "select * from user where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setFullname(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return u;
	}
}
