package com.javalab.vo;

public class Review {
	private int review_no;
	private String review_content;
	private int review_score;
	private int ticket_code;
	private String member_id;

	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getReview_no() {
		return review_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getReview_score() {
		return review_score;
	}

	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}

	public int getTicket_code() {
		return ticket_code;
	}

	public void setTicket_code(int ticket_code) {
		this.ticket_code = ticket_code;
	}

}
