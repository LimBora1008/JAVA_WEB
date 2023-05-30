package com.javalab.vo;

public class Screen {
	private int movie_id;

	private int screen_no;

	private String screen_start;

	private String screen_end;

	private String room_name;

	private int seat_number;

	private String movie_name;

	private int movie_age;

	private int movie_price;

	private String movie_rtime;

	private String theater_name;

	private String screen_date;

	public int getScreen_no() {
		return this.screen_no;
	}

	public void setScreen_no(int screen_no) {
		this.screen_no = screen_no;
	}

	public String getScreen_date() {
		return this.screen_date;
	}

	public void setScreen_date(String screen_date) {
		this.screen_date = screen_date;
	}

	public String getMovie_rtime() {
		return this.movie_rtime;
	}

	public String getTheater_name() {
		return this.theater_name;
	}

	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}

	public void setMovie_rtime(String movie_rtime) {
		if (movie_rtime.contains("�?")) {
			String mv = movie_rtime.replace("�?", "");
			double rtime = Integer.parseInt(mv);
			System.out.println(Math.round(rtime / 60.0D * 1000.0D));
		}
		this.movie_rtime = movie_rtime;
	}

	public int getMovie_id() {
		return this.movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public String getScreen_start() {
		return this.screen_start;
	}

	public void setScreen_start(String screen_start) {
		this.screen_start = screen_start;
	}

	public String getScreen_end() {
		return this.screen_end;
	}

	public void setScreen_end(String screen_end) {
		this.screen_end = screen_end;
	}

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

	public String getMovie_name() {
		return this.movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}

	public int getMovie_age() {
		return this.movie_age;
	}

	public void setMovie_age(int movie_age) {
		this.movie_age = movie_age;
	}

	public int getMovie_price() {
		return this.movie_price;
	}

	public void setMovie_price(int movie_price) {
		this.movie_price = movie_price;
	}
}