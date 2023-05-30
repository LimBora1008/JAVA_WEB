package com.javalab.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import com.javalab.vo.Member;
import com.javalab.vo.Ticket;

public class MyPageDao {
	
	private static final String driver = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	private static final String user = "movie";
	private static final String pwd = "1234";
	
	private Connection con;
	private PreparedStatement pstmt;
	
	// DB연결
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
	
	// 회원별 예매리스트 조회
	public ArrayList<Ticket> getTicketList(String id) {
		ArrayList<Ticket> list = new ArrayList<>();
		try {
			connectDB();

			String query = "select m.movie_id, t.ticket_code , m.movie_name, t.ticket_date , t.ticket_price";
					query += " from tbl_movie m , tbl_ticket t";
					query += " where m.movie_id = t.movie_id";
					query += " and t.member_id = ?";
			System.out.println("prepareStatememt: " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int movie_id = rs.getInt("movie_id");
				int ticket_code = rs.getInt("ticket_code");
				String movie_name = rs.getString("movie_name");
				Date ticket_date = rs.getDate("ticket_date");
				int ticket_price = rs.getInt("ticket_price");

				Ticket vo = new Ticket();
				vo.setTicket_code(ticket_code);
				vo.setTicket_date(ticket_date);
				vo.setTicket_price(ticket_price);
				vo.setMovie_id(movie_id);
				vo.setMovie_name(movie_name);
				list.add(vo);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 회원정보 리스트
	public ArrayList<Member> getMemberList(String id) {
		
		ArrayList<Member> list = new ArrayList<>();
		
		try {
			connectDB();

			String query = "select m.member_id ,m.member_name";
					query += " from tbl_member m";
					query += " where m.member_id = ?";
			System.out.println("prepareStatememt: " + query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				String member_id = rs.getString("member_id");
				String member_name = rs.getString("member_name");

				Member vo = new Member();
				vo.setId(member_id);
				vo.setName(member_name);
				list.add(vo);
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 회원정보 삭제
	public void deleteMember(ArrayList<Ticket> ticketList , String id) {
	    try {
	        connectDB();
	        
	        
	        for (Ticket ticket : ticketList) {
	        	int seat = 0 ;
	        	seat = ticket.getTicket_code();
	        	String query = "DELETE tbl_seat where ticket_code = ?";
	        	
	        	System.out.println("prepareStatement: " + query);
	        	
	        	pstmt = con.prepareStatement(query);
	        	pstmt.setInt(1, seat);
	        	pstmt.executeUpdate();
	        	
	        }
	        
	        for (Ticket ticket : ticketList) {
	        	String query2 = "DELETE tbl_ticket where member_id = ?";
	        	System.out.println("prepareStatement: " + query2);
	        	
	        	pstmt = con.prepareStatement(query2);
	        	pstmt.setString(1, id);
	        	pstmt.executeUpdate();
	        	
	        }
	        String query3 = "DELETE tbl_member where member_id = ?";
	        
	        pstmt = con.prepareStatement(query3);
	        pstmt.setString(1, id);
	        pstmt.executeUpdate();

	        pstmt.close();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}
