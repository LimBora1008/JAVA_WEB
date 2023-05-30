package com.limbora.bbs.vo;

public class Board {
	private int bno;
	private String title;
	private String content;
	private int hitno;
	private String regdate;
	
	public Board() {
		super();
	}

	public Board(int bno, String title, String content, int hitno, String regdate) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.hitno = hitno;
		this.regdate = regdate;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHitno() {
		return hitno;
	}

	public void setHitno(int hitno) {
		this.hitno = hitno;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
