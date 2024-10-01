package com.sonu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sonu.entity.Stadium;

public class StadiumDao {

	private Connection con;

	public StadiumDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean addStadium(Stadium std) {
		boolean f = false;
		try {
			String sql = "insert into stadium(stadium_name,location,max_seat,stadium_img) values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, std.getStadium_name());
			ps.setString(2, std.getLocation());
			ps.setInt(3, std.getMax_seat());
			ps.setString(4, std.getStadium_img());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Stadium> getAllStadiumList() {
		List<Stadium> list = new ArrayList<>();
		Stadium s = null;
		try {
			String sql = "select * from stadium";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new Stadium();
				s.setStadium_id(rs.getInt(1));
				s.setStadium_name(rs.getString(2));
				s.setLocation(rs.getString(3));
				s.setMax_seat(rs.getInt(4));
				s.setStadium_img(rs.getString(5));
				list.add(s);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public Stadium getStadiumById(int id) {
		Stadium s = null;
		try {
			String sql = "select * from stadium where id =?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new Stadium();
				s.setStadium_id(rs.getInt(1));
				s.setStadium_name(rs.getString(2));
				s.setLocation(rs.getString(3));
				s.setMax_seat(rs.getInt(4));
				s.setStadium_img(rs.getString(5));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return s;
	}

	public boolean updateStadium(Stadium s) {
		boolean f = false;
		try {
			String sql = "update stadium set stadium_name=?,location=?,max_seat =?  where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, s.getStadium_name());
			ps.setString(2, s.getLocation());
			ps.setInt(3, s.getMax_seat());
			ps.setInt(4, s.getStadium_id());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public boolean deletStadium(int id) {
		boolean f = false;
		try {
			String sql = "delete from stadium where id =?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
