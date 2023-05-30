package com.javalab.servlet;

import java.sql.*;
import java.util.*;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
	DAO(Data Access Object)
 	- 데이터베이스 관련 작업 전담 클래스
 	- JDBC 드라이버 로딩 / 커넥션 생성 / 쿼리문 작성 / 쿼리문 실행
 */

public class MemberDAO {

	private Connection con;
	private PreparedStatement pstmt;
	// 데이터베이스에 대한 소스 정보 객체
	private DataSource dataSource;
	
	/*
	 * [커넥션 풀 옵션]
	 * maxActive : pool이 허용하는 최대 커넥션 개수
	 * maxIdle : pool에서 유지할 유휴 상태의 커넥션 최대 개수
	 * minIdle : pool에서 유지할 유휴 상태의 커넥션 최소 개수
	 * initialSize 초기 connection pool의 connection 개수
	 * maxwait : 풀에 커넥션이 없을 때 대기 가능한 최대 시간 (-1 : 무한대기)
	 * 
	 * [DataSource]
     * 기본 생성자에서 데이터베이스 연결 관련 DataSource 객체 얻음
     * context.xml 파일에 Resource Tag로 설정되어 있음.
     * web.xml에도 커넥션 관련 설정되어 있음. [옵션]
     * 데이터베이스 연결 설정 정보를 자원으로 표현함.
     */
	
	// 생성자
	public MemberDAO() {
		try {
			
			/*
			 * [JNDI(자바 네이밀 앤 디렉토리 서비스)]
			 * 분산 환경에서 특정 자원에 접근할 수 있는 InitialContext
			 * 객체의 주소 얻기
			 */
			Context ctx = new InitialContext();
			/*
			 * InitialContext 객체의 lookup 메소드로 웹어플리케이션의 환경정보 얻기
			 * "jsva:/comp/env" 매개변수는 환경관련 컨텍스트 개체를 찾는데 사용되는 자바의 표준 명명 규칙
			 */
			
			// [방법 1]
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			// 환경정보에서 jdbc/oracle로 되어 있는 특정 자원을 조회함
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
			
			// [방법 2]
			// 위의 두줄을 다음과 같이 한줄에 사용해도 됨
			// dataSource = (DataSource) envContext.lookup("java:/comp/env/jdbc/oracle");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	private void connectDB() {
//		try {
//			Class.forName(driver);
//			System.out.println("오라클 드라이버 로딩 성공");
//			con = DriverManager.getConnection(url, user, pwd);
//			System.out.println("Connection 성공");
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

	// 회원 목록 조회 메소드
	public ArrayList<MemberVO> listMembers() {
		ArrayList<MemberVO> list = new ArrayList<>();
		try {
			// 톰캣 환경 설정 파일에 저장해놓은 자원 (DB 커넥션)을 얻음
			con = dataSource.getConnection();

			String query = " select * from member";
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
	
	// 회원 한명 조회
	public MemberVO getMember(String id) {
		
		MemberVO member = null;
		try {
			
			// 톰캣 환경 설정 파일에 저장해놓은 자원 (DB 커넥션)을 얻음
			con = dataSource.getConnection();
			
			String query = "select m.id,m.name,m.email,m.joindate";
			query += " from member m";
			query += " where m.id = ?";
			System.out.println("prepareStatement : "+query);
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setJoinDate(rs.getDate("joindate"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

}
