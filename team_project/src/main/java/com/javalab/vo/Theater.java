package com.javalab.vo;

public class Theater {
	private int theater_id;

	private String theater_name;

	private String room_name;

	private int seat_number;

	private int location_code;

	public String getRoom_name() {
		return this.room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public int getSeat_number() {
		return this.seat_number;
	}

	public void setSeat_number(int seat_number) {
		this.seat_number = seat_number;
	}

	public int getTheater_id() {
		return this.theater_id;
	}

	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}

	public String getTheater_name() {
		return this.theater_name;
	}

	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}

	public int getLocation_code() {
		return this.location_code;
	}

	public void setLocation_code(int location_code) {
		this.location_code = location_code;
	}
}