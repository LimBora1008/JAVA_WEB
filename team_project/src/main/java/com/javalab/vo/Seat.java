package com.javalab.vo;

public class Seat {
	
	  private int SeatCode;
	  private String seatLen;
	  private int seatWid;
	  private int ticketCode;
	  
	public Seat() {
		super();
	}

	public Seat(int seatCode, String seatLen, int seatWid, int ticketCode) {
		super();
		SeatCode = seatCode;
		this.seatLen = seatLen;
		this.seatWid = seatWid;
		this.ticketCode = ticketCode;
	}

	public int getSeatCode() {
		return SeatCode;
	}

	public void setSeatCode(int seatCode) {
		SeatCode = seatCode;
	}

	public String getSeatLen() {
		return seatLen;
	}

	public void setSeatLen(String seatLen) {
		this.seatLen = seatLen;
	}

	public int getSeatWid() {
		return seatWid;
	}

	public void setSeatWid(int seatWid) {
		this.seatWid = seatWid;
	}

	public int getTicketCode() {
		return ticketCode;
	}

	public void setTicketCode(int ticketCode) {
		this.ticketCode = ticketCode;
	}

	@Override
	public String toString() {
		return "Seat [SeatCode=" + SeatCode + ", seatLen=" + seatLen + ", seatWid=" + seatWid + ", ticketCode="
				+ ticketCode + "]";
	}
}
