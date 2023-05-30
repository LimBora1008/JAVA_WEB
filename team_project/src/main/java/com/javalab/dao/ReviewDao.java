package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.Movie;
import com.javalab.vo.Review;
import com.javalab.vo.Ticket;

public class ReviewDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static DataSource dataSource;
	private static ReviewDao instance;
	
	private ReviewDao() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static ReviewDao getInstance() {
		if (instance == null)
			instance = new ReviewDao();
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

	public ArrayList<Ticket> getTicketCode(String movieId, String userId) {
		int movie_id = Integer.parseInt(movieId);
		String query = "select a.ticket_code from ( ";
		query += "      select tk.ticket_code, tk.member_id ,st.screen_no from tbl_seat st, tbl_ticket tk";
		query += "          where st.ticket_code = tk.ticket_code";
		query += "      )a, tbl_screen b";
		query += " where a.screen_no = b.screen_no and a.member_id = ? and b.movie_id=?";
		ArrayList<Ticket> ticketCodeList = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setInt(2, movie_id);
			rs = pstmt.executeQuery();
			ticketCodeList = new ArrayList<Ticket>();
			Ticket ticketVo = null;
			while (this.rs.next()) {
				ticketVo = new Ticket();
				ticketVo.setTicket_code(rs.getInt("TICKET_CODE"));
				ticketCodeList.add(ticketVo);
				ticketVo = null;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return ticketCodeList;

	}

	public ArrayList<Review> getAllReview(String movieId) {
		int movie_id = Integer.parseInt(movieId);
		String query = "SELECT * FROM ";
		query += "      TBL_REVIEW R";
		query += "      JOIN TBL_TICKET T ON R.TICKET_CODE = T.TICKET_CODE";
		query += "      WHERE MOVIE_ID=? ORDER BY REVIEW_NO DESC";
		ArrayList<Review> reviewList = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, movie_id);
			rs = pstmt.executeQuery();
			reviewList = new ArrayList<Review>();
			Review reviewVo = null;
			while (this.rs.next()) {
				reviewVo = new Review();
				reviewVo.setReview_no(rs.getInt("REVIEW_NO"));
				reviewVo.setReview_content(rs.getString("REVIEW_CONTENT"));
				reviewVo.setReview_score(rs.getInt("REVIEW_SCORE"));
				reviewVo.setTicket_code(rs.getInt("TICKET_CODE"));
				reviewVo.setMember_id(rs.getString("MEMBER_ID"));
				reviewList.add(reviewVo);
				reviewVo = null;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return reviewList;
	}

	public void insertReview(String content, String score, int ticketCode) {
		int review_score = Integer.parseInt(score);
		String query = "insert into tbl_review values (seq_review_no.nextval, ?, ?, ?)";
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, content);
			pstmt.setInt(2, review_score);
			pstmt.setInt(3, ticketCode);
			rs = pstmt.executeQuery();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		
	}
}
