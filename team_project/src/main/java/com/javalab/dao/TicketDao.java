package com.javalab.dao;

import com.javalab.vo.Ticket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TicketDao {
	private Connection con;

	private PreparedStatement pstmt;

	private ResultSet rs;

	private static DataSource dataSource;

	private static TicketDao instance;

	private TicketDao() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static TicketDao getInstance() {
		if (instance == null)
			instance = new TicketDao();
		return instance;
	}

	private void close() {
		try {
			if (this.rs != null)
				this.rs.close();
			if (this.pstmt != null)
				this.pstmt.close();
			if (this.con != null)
				this.con.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public void insertTicket(Ticket ticketVo) {
		String query = "insert into tbl_ticket values(seq_ticket_code.nextval,default,?,?,?)";
		try {
			this.con = dataSource.getConnection();
			this.pstmt = this.con.prepareStatement(query);
			this.pstmt.setInt(1, ticketVo.getTicket_price());
			this.pstmt.setInt(2, ticketVo.getMovie_id());
			this.pstmt.setString(3, ticketVo.getMember_id());
			this.pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("error" + e.getMessage());
		} finally {
			close();
		}
	}

	public Ticket getTicketCode(String userId) {
		String query = "select max(ticket_code) as TICKET_CODE from tbl_ticket where member_id=?";
		Ticket ticketVo = null;
		try {
			this.con = dataSource.getConnection();
			this.pstmt = this.con.prepareStatement(query);
			this.pstmt.setString(1, userId);
			this.rs = this.pstmt.executeQuery();
			ticketVo = null;
			while (this.rs.next()) {
				ticketVo = new Ticket();
				ticketVo.setTicket_code(this.rs.getInt("TICKET_CODE"));
			}
		} catch (SQLException e) {
			System.out.println("error" + e.getMessage());
		} finally {
			close();
		}
		return ticketVo;
	}

	public Boolean insertSeat(int tCode, String len, int wid2, String screenNo) {
		String query = "insert into tbl_seat values (seq_seat_code.nextval, ?, ?, ?, ?)";
		int sNo = Integer.parseInt(screenNo);
		boolean result = false;
		try {
			this.con = dataSource.getConnection();
			this.pstmt = this.con.prepareStatement(query);
			this.pstmt.setString(1, len);
			this.pstmt.setInt(2, wid2);
			this.pstmt.setInt(3, tCode);
			this.pstmt.setInt(4, sNo);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = true;
			} else {
				result = false;
			}

		} catch (SQLException e) {
			System.out.println("error" + e.getMessage());
		} finally {
			close();
		}

		return result;
	}

	public boolean validSeat(String len, String wid, String screenNo3) {
//		System.out.println(tCode);
		int screen_no = Integer.parseInt(screenNo3);
		int seat_wid = Integer.parseInt(wid);
		String query = "select decode(count(*), 1, 'true', 'false') as result from tbl_seat where seat_len=? and seat_wid=? and screen_no=?";
		boolean result = false;
		try {
			con = dataSource.getConnection();
			pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, len);
			pstmt.setInt(2, seat_wid);
			pstmt.setInt(3, screen_no);

			rs = pstmt.executeQuery();
			rs.next();
			result = Boolean.parseBoolean(rs.getString("result"));

		} catch (SQLException e) {
			System.out.println("error" + e.getMessage());
		} finally {
			close();
		}

		return result;
	}

}