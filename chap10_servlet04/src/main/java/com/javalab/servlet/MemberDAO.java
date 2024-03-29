package com.javalab.servlet;

import java.sql.*;
import java.util.*;
import java.util.Date;

/*
	DAO(Data Access Object)
 	- 데이터베이스 관련 작업 전담 클래스
 	- JDBC 드라이버 로딩 / 커넥션 생성 / 쿼리문 작성 / 쿼리문 실행
 */

public class MemberDAO {

	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String user = "company";
	private static final String pwd = "1234";

	private Connection con;
	private PreparedStatement pstmt;

	private void connectDB() {
		try {
			Class.forName(driver);
			System.out.println("오라클 드라이버 로딩 성공");
			con = DriverManager.getConnection(url, user, pwd);
			System.out.println("Connection 성공");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원 목록 조회 메소드
	public ArrayList<MemberVO> listMembers() {
		ArrayList<MemberVO> list = new ArrayList<>();
		try {

			connectDB();

			String query = "select * from member";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");

				MemberVO vo = new MemberVO();
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setEmail(email);
				vo.setJoinDate(joinDate);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
