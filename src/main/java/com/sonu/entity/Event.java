package com.sonu.entity;

public class Event {

	private int event_id;
	private String sports_name;
	private int stadium_id;
	private String match_name;
	private String match_photo;
	private int max_seat;
	private String location;
	private String Date;

	public Event(String sports_name, int stadium_id, String match_name, String match_photo, int max_seat,
			String location, String Date) {
		super();
		this.sports_name = sports_name;
		this.stadium_id = stadium_id;
		this.match_name = match_name;
		this.match_photo = match_photo;
		this.max_seat = max_seat;
		this.location = location;
		this.Date = Date;
	}
	
	

	public Event(int event_id, String match_name, int max_seat, String location, String date) {
		super();
		this.event_id = event_id;
		this.match_name = match_name;
		this.max_seat = max_seat;
		this.location = location;
		Date = date;
	}



	public Event() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getEvent_id() {
		return event_id;
	}

	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}

	public String getSports_name() {
		return sports_name;
	}

	public void setSports_name(String sports_name) {
		this.sports_name = sports_name;
	}

	public int getStadium_id() {
		return stadium_id;
	}

	public void setStadium_id(int stadium_id) {
		this.stadium_id = stadium_id;
	}

	public String getMatch_name() {
		return match_name;
	}

	public void setMatch_name(String match_name) {
		this.match_name = match_name;
	}

	public String getMatch_photo() {
		return match_photo;
	}

	public void setMatch_photo(String match_photo) {
		this.match_photo = match_photo;
	}

	public int getMax_seat() {
		return max_seat;
	}

	public void setMax_seat(int max_seat) {
		this.max_seat = max_seat;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	@Override
	public String toString() {
		return "Event [event_id=" + event_id + ", sports_name=" + sports_name + ", stadium_id=" + stadium_id
				+ ", match_name=" + match_name + ", match_photo=" + match_photo + ", max_seat=" + max_seat
				+ ", location=" + location + "]";
	}

}
