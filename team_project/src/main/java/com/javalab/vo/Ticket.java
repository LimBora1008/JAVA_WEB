package com.javalab.vo;

import java.util.Date;

public class Ticket {
	private int ticket_code;
	private Date ticket_date;
	private int ticket_price;
	private int movie_id;
	private String member_id;
	private String movie_name;
	private String member_name;

	public Ticket() {
	}

	public Ticket(int ticket_price, int movie_id, String member_id) {
		this.ticket_price = ticket_price;
		this.movie_id = movie_id;
		this.member_id = member_id;
	}

	public Ticket(int ticket_code, Date ticket_date, int ticket_price, int movie_id, String member_id) {
		this.ticket_code = ticket_code;
		this.ticket_date = ticket_date;
		this.ticket_price = ticket_price;
		this.movie_id = movie_id;
		this.member_id = member_id;
	}

	public Ticket(int ticket_code, Date ticket_date, int ticket_price, int movie_id, String movie_name,
			String member_id, String member_name) {
		this.ticket_code = ticket_code;
		this.ticket_date = ticket_date;
		this.ticket_price = ticket_price;
		this.movie_id = movie_id;
		this.movie_name = movie_name;
		this.member_id = member_id;
		this.member_name = member_name;
	}

	public int getTicket_code() {
		return ticket_code;
	}

	public void setTicket_code(int ticket_code) {
		this.ticket_code = ticket_code;
	}

	public Date getTicket_date() {
		return ticket_date;
	}

	public void setTicket_date(Date ticket_date) {
		this.ticket_date = ticket_date;
	}

	public int getTicket_price() {
		return ticket_price;
	}

	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}

	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public String getMovie_name() {
		return movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

}
