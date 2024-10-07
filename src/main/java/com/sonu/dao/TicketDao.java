package com.sonu.dao;

import java.awt.print.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sonu.entity.Booking;

public class TicketDao {

	private Connection con;

	public TicketDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertTicket(Booking b) {
		boolean f = false;
		try {
			String sql = "insert into tickets (seats , sportsName , stadiumName , matchName , date , userId ) values(?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, b.getSeats());
			ps.setString(2, b.getSportsName());
			ps.setString(3, b.getStadiumName());
			ps.setString(4, b.getMatchName());
			ps.setString(5, b.getDate());
			ps.setInt(6, b.getUserId());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Booking> getAllTickets() {
		List<Booking> list = new ArrayList<>();
		Booking b = null;
		try {
			String sql = "select * from tickets";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Booking();
				b.setBookingId(rs.getInt(1));
				b.setSeats(rs.getInt(2));
				b.setSportsName(rs.getString(3));
				b.setStadiumName(rs.getString(4));
				b.setMatchName(rs.getString(5));
				b.setDate(rs.getString(6));
				b.setUserId(rs.getInt(7));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public Booking getElementById(int id) {
		Booking b = null;
		try {
			String sql="select * from tickets where bookingId = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Booking();
				b.setBookingId(rs.getInt(1));
				b.setSeats(rs.getInt(2));
				b.setSportsName(rs.getString(3));
				b.setStadiumName(rs.getString(4));
				b.setMatchName(rs.getString(5));
				b.setDate(rs.getString(6));
				b.setUserId(rs.getInt(7));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return b;
		
	}
	
	public List<Booking> getAllTicketsById(int id){
		List<Booking> list = new ArrayList<>();
		Booking b = null;
		try {
			String sql="select * from tickets where userId = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new Booking();
				b.setBookingId(rs.getInt(1));
				b.setSeats(rs.getInt(2));
				b.setSportsName(rs.getString(3));
				b.setStadiumName(rs.getString(4));
				b.setMatchName(rs.getString(5));
				b.setDate(rs.getString(6));
				b.setUserId(rs.getInt(7));
				list.add(b);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
		
	}

}
