package com.javalab.dao;

import com.javalab.vo.Screen;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ScreenDao {
	private Connection con;

	private PreparedStatement pstmt;

	private ResultSet rs;

	private static DataSource dataSource;

	private static ScreenDao instance;

	private ScreenDao() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static ScreenDao getInstance() {
		if (instance == null)
			instance = new ScreenDao();
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

	public List<Screen> showScreen(String theaterName, String id) {
		String query = "select a.*, b.movie_name, b.movie_age, b.movie_price, b.movie_rtime from (";
		query = String.valueOf(query)
				+ " select s.movie_id, s.screen_start, s.screen_end, s.screen_no, t.room_name, t.seat_number, t.theater_name from tbl_theater t, tbl_screen s";
		query = String.valueOf(query) + " where t.theater_id = s.theater_id and t.theater_name=?";
		query = String.valueOf(query) + " ) a, tbl_movie b";
		query = String.valueOf(query) + " where a.movie_id = b.movie_id and a.movie_id=?";
		List<Screen> screenList = null;
		int movieId = Integer.parseInt(id);
		try {
			this.con = dataSource.getConnection();
			this.pstmt = this.con.prepareStatement(query);
			this.pstmt.setString(1, theaterName);
			this.pstmt.setInt(2, movieId);
			this.rs = this.pstmt.executeQuery();
			screenList = new ArrayList<>();
			Screen sv = null;
			while (this.rs.next()) {
				sv = new Screen();
				sv.setMovie_id(this.rs.getInt("MOVIE_ID"));
				sv.setScreen_no(this.rs.getInt("SCREEN_NO"));
				sv.setScreen_start(this.rs.getString("SCREEN_START"));
				sv.setScreen_end(this.rs.getString("SCREEN_END"));
				sv.setRoom_name(this.rs.getString("ROOM_NAME"));
				sv.setSeat_number(this.rs.getInt("SEAT_NUMBER"));
				sv.setMovie_name(this.rs.getString("MOVIE_NAME"));
				sv.setMovie_age(this.rs.getInt("MOVIE_AGE"));
				sv.setMovie_price(this.rs.getInt("MOVIE_PRICE"));
				sv.setMovie_rtime(this.rs.getString("MOVIE_RTIME"));
				sv.setTheater_name(this.rs.getString("THEATER_NAME"));
				screenList.add(sv);
				sv = null;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return screenList;
	}

	public Screen showOneScreen(String theaterName, String movieId, String screenNo) {
		String query = "select a.*, b.movie_name, b.movie_age, b.movie_price, b.movie_rtime from (";
		query = String.valueOf(query)
				+ " select s.movie_id, s.screen_date, s.screen_start, s.screen_end, s.screen_no, t.room_name, t.seat_number, t.theater_name from tbl_theater t, tbl_screen s";
		query = String.valueOf(query) + " where t.theater_id = s.theater_id and t.theater_name=?";
		query = String.valueOf(query) + " ) a, tbl_movie b";
		query = String.valueOf(query) + " where a.movie_id = b.movie_id and a.movie_id=? and a.screen_no=?";
		Screen sv = null;
		int id = Integer.parseInt(movieId);
		int sNo = Integer.parseInt(screenNo);
		try {
			this.con = dataSource.getConnection();
			this.pstmt = this.con.prepareStatement(query);
			this.pstmt.setString(1, theaterName);
			this.pstmt.setInt(2, id);
			this.pstmt.setInt(3, sNo);
			this.rs = this.pstmt.executeQuery();
			sv = new Screen();
			while (this.rs.next()) {
				sv = new Screen();
				sv.setMovie_id(this.rs.getInt("MOVIE_ID"));
				sv.setScreen_no(this.rs.getInt("SCREEN_NO"));
				sv.setScreen_start(this.rs.getString("SCREEN_START"));
				sv.setScreen_end(this.rs.getString("SCREEN_END"));
				sv.setRoom_name(this.rs.getString("ROOM_NAME"));
				sv.setSeat_number(this.rs.getInt("SEAT_NUMBER"));
				sv.setMovie_name(this.rs.getString("MOVIE_NAME"));
				sv.setMovie_age(this.rs.getInt("MOVIE_AGE"));
				sv.setMovie_price(this.rs.getInt("MOVIE_PRICE"));
				sv.setMovie_rtime(this.rs.getString("MOVIE_RTIME"));
				sv.setTheater_name(this.rs.getString("THEATER_NAME"));
				sv.setScreen_date(this.rs.getString("SCREEN_DATE"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return sv;
	}


}