package com.sonu.entity;

public class Booking {

	private int bookingId;
	private int seats;
	private String sportsName;
	private String stadiumName;
	private String matchName;
	private String date;

	public Booking(int seats, String sportsName, String stadiumName, String matchName, String date) {
		super();
		this.seats = seats;
		this.sportsName = sportsName;
		this.stadiumName = stadiumName;
		this.matchName = matchName;
		this.date = date;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public String getSportsName() {
		return sportsName;
	}

	public void setSportsName(String sportsName) {
		this.sportsName = sportsName;
	}

	public String getStadiumName() {
		return stadiumName;
	}

	public void setStadiumName(String stadiumName) {
		this.stadiumName = stadiumName;
	}

	public String getMatchName() {
		return matchName;
	}

	public void setMatchName(String matchName) {
		this.matchName = matchName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}

}
