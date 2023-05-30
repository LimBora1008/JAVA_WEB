package com.javalab.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import com.javalab.vo.Member;



public class MemberDao {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource dataSource;
	private static MemberDao instance;

	// 기본 생성자에서 환경변수를 통한 데이터베이스 관련 DataSource얻어옴
	// Server / contex.xml에 Resource로 세팅해놓은 정보
	public MemberDao() {
		System.out.println("여기는 MemberDao 생성자");
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 싱글톤 팬턴으로 생성
	public static MemberDao getInstance() {
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}	

	// 회원 저장 메소드
		public void addMember(Member membervo) {
			try {
				
				Connection con = dataSource.getConnection();
				
				String id = membervo.getId();
				String pw = membervo.getPw();
				String name = membervo.getName();
				Date age = stringToDate(membervo);
				
				String query = "insert into tbl_member";			
				query += " (member_id,member_pw,member_name,member_age)";
				query += " values(?,?,?,?)";
				
				System.out.println("SQL :  " + query);
				
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.setString(3, name);
				pstmt.setDate(4, age);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();			
			}
		}
		
	// 생년월일 String -> Date로 변경
	public Date stringToDate(Member membervo) {
		String year = membervo.getBirthyy();
		String month = membervo.getBirthmm();
		String day = membervo.getBirthdd();
		
		Date age = Date.valueOf(year+"-"+month+"-"+day);
		
		return age;
	}
	



	// 사용자가 데이터베이스에 있는지 조회
	public Member loginCheck(Member mb) {
		Member membervo = null;	
		try {
			// 1. 데이터소스에서 커넥션 객체 얻음
			Connection con = dataSource.getConnection();
			// 2. SQL쿼리문장 생성
			String sql = "select member_id as id, member_name as name, member_age as age from tbl_member where member_id = ? and member_pw = ?";
			// 3. 쿼리문 실행
			pstmt = con.prepareStatement(sql);
			// 4. 인자 전달
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			// 5. 결과 반환
			rs = pstmt.executeQuery();

			if(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				//String age = rs.getString("age");
				membervo = new Member(id, name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();			
		}
		return membervo;
	}		
	
	 // 아이디 중복 체크
	   public boolean isIdExist(String id){
	      boolean result = false;
	      try {
	         con = dataSource.getConnection();
	         String query = "select decode(count(*), 1, 'true', 'false') as result from tbl_member";
	         query += " where member_id=?";
	         System.out.println("prepareStatememt: " + query);
	         pstmt = con.prepareStatement(query);
	         pstmt.setString(1, id);
	         
	         rs = pstmt.executeQuery();
	         rs.next();
	         // 반환 타입이 불린형이므로, 문자열 타입을 쿼리 결과를 불린형으로 변환
	         result = Boolean.parseBoolean(rs.getString("result"));
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         close();         
	      }
	      return result;
	   }
	   
	
	
	// DB 자원해제
	private void close()
	{
		try {
			if ( pstmt != null ){ 
				pstmt.close(); 
			}
			if ( con != null ){ 
				con.close(); 
			}
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	} // end close()	
		
}
