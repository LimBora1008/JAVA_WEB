package com.javalab.dao;

import com.javalab.vo.Location;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LocationDao {
	private Connection con;

	private PreparedStatement pstmt;

	private ResultSet rs;

	private static DataSource dataSource;

	private static LocationDao instance;

	private LocationDao() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static LocationDao getInstance() {
		if (instance == null)
			instance = new LocationDao();
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

	public List<Location> showAllLocation() {
		String query = "select * from tbl_location";
		List<Location> locationList = null;
		try {
			this.con = dataSource.getConnection();
			this.pstmt = this.con.prepareStatement(query);
			this.rs = this.pstmt.executeQuery();
			locationList = new ArrayList<>();
			Location locationVo = null;
			while (this.rs.next()) {
				locationVo = new Location();
				locationVo.setLocation_loc(this.rs.getString("LOCATION_LOC"));
				locationList.add(locationVo);
				locationVo = null;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
		return locationList;
	}
}