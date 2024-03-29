package com.javalab.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.*;

import com.javalab.dto.BoardModel;

// DB 관련된 C/R/U/D 메소드 구현
// - 실제 오라클 DB에 접속하는 역할을 하며 Servlet에서 사용
public class BoardDAO {

	// 멤버 변수
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private static DataSource dataSource;

	// 자신의 참조 변수를 private static 으로 선언
	private static BoardDAO instance;

	// [싱글턴 패턴 생성자]
	// 생성자를 private으로 선언
	// - 외부에서는 이 생성자를 부를 수 없음.
	// - getInstance() 메소드에서 최초로 한번만 객체로 생성됨.
	private BoardDAO() {
		System.out.println("여기는 BoardDao 생성자");
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 현재 객체의 참조 변수를 반환해주는 메소드
	// - 이 메소드가 최초로 호출 될 때 단 한번만 자신이 속한 클래스의 객체를 생성
	// - 다음부터는 최초에 생성된 그 객체의 주소만 반환하게됨.
	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}

//	// 게시판 목록 조회 : BoardListServlet의 doGet()에서 호출
//	public List<BoardModel> selectList() {
//		String sql_query = "select no,subject,writer,hit from tbl_board";
//		List<BoardModel> list = null;
//
//		try {
//			con = dataSource.getConnection(); // 커넥션 객체 얻기
//
//			pstmt = con.prepareStatement(sql_query);
//			rs = pstmt.executeQuery();
//
//			list = new ArrayList<BoardModel>();
//			BoardModel model = null;
//
//			while (rs.next()) {
//				model = new BoardModel();
//				model.setNo(rs.getInt("no"));
//				model.setSubject(rs.getString("subject"));
//				model.setWriter(rs.getString("writer"));
//				model.setHit(rs.getInt("hit"));
//				list.add(model);
//				model = null;
//			}
//		} catch (SQLException e) {
//			System.out.println("selectList ERR : " + e.getMessage());
//		} finally {
//			close();
//		}
//		return list;
//	}
	

	// 게시판 목록 조회 : BoardListServlet의 doGet()에서 호출
	/*
	 * StringBuffrt :
	 * 	- String은 immutable(불변성) 하지만 StringBufffer는 가변성
	 * 	- 새로운 문자열을 계속해서 이어붙일 수 있다. 멀티 스레드 환경에서 안정적이다
	 * 	- 수정 삭제가 빈번하게 일어나는 클래스에서는 사용하면 좋다.
	 */
	public List<BoardModel> selectList(BoardModel board) {
		List<BoardModel> boardList = new ArrayList<BoardModel>();
		
		StringBuffer query = new StringBuffer();
		
		int start = 0; // 시작번호 초기화
		int end = 0; // 끝번호 초기화
		
		/*
		 * [공식]
		 * 시작번호 : (요청된 페이지 -1) * 한페이지에 보여줄 수 + 1
		 * 끝번호 : 시작번호 + 한페이지에 보여줄 수 -1
		 */
		start = (Integer.parseInt(board.getPageNum())-1)*board.getListCount()+1;
		end = start+board.getListCount()-1;
		
		System.out.println("시작 게시물번호 : "+start+" / 끝 게시물번호 : "+end);
		
		// [1.방법] 3단 쿼리
//	     query.append("select c.seq, c.no, c.subject, c.writer, c.hit, c.regdate");
//	     query.append(" from( ");
//	     query.append("   select rownum as seq, b.no, b.subject, b.writer,b.hit, b.regdate");
//	     query.append("    from ( ");
//	     query.append("      select no, subject, writer, hit, regdate");
//	     query.append("       from tbl_board a ");
//	     query.append("      order By a.no desc ");
//	     query.append("    )b");   
//	     query.append(" )c");
//	     query.append(" where c.seq between ? And ?");
		
		// [2.방법] row_number()함수 사용
		query.append("select a.no , a.subject , a.writer , a.contents , a.hit , a.regdate");
		query.append(" from( ");
		query.append("  select b.* , row_number()over(order by b.regdate desc) row_num");
		query.append("   from tbl_board b");
		query.append(")a");
		query.append(" where a.row_num between ? and ?");
		
		try {
			// 커넥션 객체 얻기
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(query.toString());
			pstmt.setInt(1, start); // 시작번호
			pstmt.setInt(2, end); // 끝번호
			
			rs = pstmt.executeQuery();
			BoardModel model = null;
			
			while (rs.next()) {
				model = new BoardModel();
				model.setNo(rs.getInt("no"));
				model.setSubject(rs.getString("subject"));
				model.setWriter(rs.getString("writer"));
				model.setHit(rs.getInt("hit"));
				model.setRegdate(rs.getString("regdate"));
				boardList.add(model);
				model = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return boardList;
	}

	// 게시물 상세조회 메소드
	public BoardModel selectOne(BoardModel boardModel) {
		String sql_query = "select * from tbl_board where no = ?";
		BoardModel model = null;

		try {
			con = dataSource.getConnection();

			pstmt = con.prepareStatement(sql_query);
			pstmt.setInt(1, boardModel.getNo());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				model = new BoardModel();
				model.setNo(rs.getInt("no"));
				model.setSubject(rs.getString("subject"));
				model.setWriter(rs.getString("writer"));
				model.setContents(rs.getString("contents"));
				model.setHit(rs.getInt("hit"));
			}

		} catch (SQLException e) {
			System.out.println("selectOne ERR : " + e.getMessage());
		} finally {
			close();
		}
		return model;
	}
	
	// 테이블의 전체 레코드수(행수) 조회
	public int selectCount() {
		int totalcount = 0;
		StringBuffer query = new StringBuffer();
		
		query.append("select count(*) as totalcount");
		query.append(" from tbl_board");
		
		try {
			con = dataSource.getConnection(); // 커넥션 얻기
			pstmt = con.prepareStatement(query.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalcount = rs.getInt("totalcount");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return totalcount;
	}

	/**
	 * 게시글 등록 처리 : BoardWriteServlet의 doPost() 에서 호츨
	 */
	public void insert(BoardModel boardModel) {
		String sql_query = "insert into tbl_board (no, subject, writer, contents)";
		sql_query += " values (seq_board.nextval, ?, ?, ?)";

		try {
			con = dataSource.getConnection(); // 커넥션 객체 얻기

			pstmt = con.prepareStatement(sql_query);
			pstmt.setString(1, boardModel.getSubject());
			pstmt.setString(2, boardModel.getWriter());
			pstmt.setString(3, boardModel.getContents());
			int result = pstmt.executeUpdate();
			if (result > 0) {
				System.out.println("=> INSERT  SUCCESS !!");
			}
		} catch (SQLException e) {
			System.out.println("insert() ERR => " + e.getMessage());
		} finally {
			close();
		}
	}

	// 게시물 수정 메소드 : BoardModifyServlet의 doPost() 에서 호출
	public void update(BoardModel boardModel) {
		String sql_query = "update tbl_board set subject=? , writer=? , contents=? where no=?";

		try {
			con = dataSource.getConnection(); // 커넥션 얻기

			pstmt = con.prepareStatement(sql_query);
			pstmt.setString(1, boardModel.getSubject());
			pstmt.setString(2, boardModel.getWriter());
			pstmt.setString(3, boardModel.getContents());
			pstmt.setInt(4, boardModel.getNo());

			int result = pstmt.executeUpdate();
			if (result > 0) {
				System.out.println("=> UPDATE SUCCESS !");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			close();
		}
	}

	// 조회수 증가 메소드
	public void updateHit(BoardModel boardModel) {
		String sql_query = "update tbl_board set hit=hit+1 where no=?";
		try {
			con = dataSource.getConnection(); // 커넥션 얻기

			pstmt = con.prepareStatement(sql_query);
			pstmt.setInt(1, boardModel.getNo());
			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("=> UPDATE HIT SUCCESS !");
			}
		} catch (SQLException e) {
			System.out.println("update ERR => " + e.getMessage());
		} finally {
			close();
		}
	}

	// 삭제기능 메소드
	public void delete(BoardModel boardModel) {
		String sql_query = "delete tbl_board where no=?";
		try {
			con = dataSource.getConnection(); // 커넥션 얻기

			pstmt = con.prepareStatement(sql_query);
			pstmt.setInt(1, boardModel.getNo());
			int result = pstmt.executeUpdate();

			if (result > 0) {
				System.out.println("=> delete SUCCESS !");
			}
		} catch (SQLException e) {
			System.out.println("delete ERR => " + e.getMessage());
		} finally {
			close();
		}
	}
	
	// 사용이 끝난 자원 해제
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			System.out.println("close ERR : " + e.getMessage());
		}
	}


}
