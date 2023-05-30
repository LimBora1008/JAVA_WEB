package com.javalab.dao;

import com.javalab.vo.Theater;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TheaterDao {
	private Connection con;

	private PreparedStatement pstmt;

	private ResultSet rs;

	private static DataSource dataSource;

	private static TheaterDao instance;

	private TheaterDao() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static TheaterDao getInstance() {
		if (instance == null)
			instance = new TheaterDao();
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

	public List<Theater> showTheater(String clickedLocationLoc) {
		String query = "select theater_name from tbl_theater where location_loc=?";
		query = String.valueOf(query) + " group by theater_name";
		List<Theater> theaterList = null;
		try {
			this.con = dataSource.getConnection();
			this.pstmt = this.con.prepareStatement(query);
			this.pstmt.setString(1, clickedLocationLoc);
			this.rs = this.pstmt.executeQuery();
			theaterList = new ArrayList<>();
			Theater tv = null;
			while (this.rs.next()) {
				tv = new Theater();
				tv.setTheater_name(this.rs.getString("THEATER_NAME"));
				theaterList.add(tv);
				tv = null;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return theaterList;
	}
}