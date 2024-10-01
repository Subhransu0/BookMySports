package com.sonu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sonu.entity.Event;

public class EventDao {

	private Connection con;

	public EventDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean creteEvent(Event ev) {
		boolean f = false;
		try {
			String sql = "insert into events(sports_name , stadium_id , match_name , match_photo , max_seat , location , event_date) values(?,?,?,?,?,? , ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ev.getSports_name());
			ps.setInt(2, ev.getStadium_id());
			ps.setString(3, ev.getMatch_name());
			ps.setString(4, ev.getMatch_photo());
			ps.setInt(5, ev.getMax_seat());
			ps.setString(6, ev.getLocation());
			ps.setString(7, ev.getDate());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Event> getAllEvent() {
		List<Event> list = new ArrayList<>();
		Event ev = null;
		try {
			String sql = "select * from events";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ev = new Event();
				ev.setEvent_id(rs.getInt(1));
				ev.setSports_name(rs.getString(2));
				ev.setStadium_id(rs.getInt(3));
				ev.setMatch_name(rs.getString(4));
				ev.setMatch_photo(rs.getString(5));
				ev.setMax_seat(rs.getInt(6));
				ev.setLocation(rs.getString(7));
				ev.setDate(rs.getString(8));
				list.add(ev);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Event getElementById(int id) {
		Event ev = null;
		try {
			String sql = "select * from events where event_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ev = new Event();
				ev.setEvent_id(rs.getInt(1));
				ev.setSports_name(rs.getString(2));
				ev.setStadium_id(rs.getInt(3));
				ev.setMatch_name(rs.getString(4));
				ev.setMatch_photo(rs.getString(5));
				ev.setMax_seat(rs.getInt(6));
				ev.setLocation(rs.getString(7));
				ev.setDate(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ev;
	}

	public boolean updateEvent(Event ev) {
		boolean f = false;
		try {
			String sql = "update events set match_name=? , max_seat= ? , location= ? , event_date=? where event_id=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ev.getMatch_name());
			ps.setInt(2, ev.getMax_seat());
			ps.setString(3, ev.getLocation());
			ps.setString(4, ev.getDate());
			ps.setInt(5, ev.getEvent_id());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public boolean deleteEvent(int id) {
		boolean f = false;
		try {
			String sql = "delete from events where event_id=?";
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

	public boolean updateEventSeat(Event ev) {
		boolean f = false;
		try {
			String sql = "update events set max_seat = ? where event_id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, ev.getMax_seat());
			ps.setInt(2, ev.getEvent_id());
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
