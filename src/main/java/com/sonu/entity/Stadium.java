package com.sonu.entity;

public class Stadium {
	private int stadium_id;
	private String stadium_name;
	private String location;
	private int max_seat;
	private String stadium_img;

	public Stadium() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Stadium(String stadium_name, String location, int max_seat, String stadium_img) {
		super();
		this.stadium_name = stadium_name;
		this.location = location;
		this.max_seat = max_seat;
		this.stadium_img = stadium_img;
	}
	
	

	public Stadium(int stadium_id, String stadium_name, String location, int max_seat) {
		super();
		this.stadium_id = stadium_id;
		this.stadium_name = stadium_name;
		this.location = location;
		this.max_seat = max_seat;
	}

	public int getStadium_id() {
		return stadium_id;
	}

	public void setStadium_id(int stadium_id) {
		this.stadium_id = stadium_id;
	}

	public String getStadium_name() {
		return stadium_name;
	}

	public void setStadium_name(String stadium_name) {
		this.stadium_name = stadium_name;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getMax_seat() {
		return max_seat;
	}

	public void setMax_seat(int max_seat) {
		this.max_seat = max_seat;
	}

	public String getStadium_img() {
		return stadium_img;
	}

	public void setStadium_img(String stadium_img) {
		this.stadium_img = stadium_img;
	}

	@Override
	public String toString() {
		return "Stadium [stadium_id=" + stadium_id + ", stadium_name=" + stadium_name + ", location=" + location
				+ ", max_seat=" + max_seat + ", stadium_img=" + stadium_img + "]";
	}

}
