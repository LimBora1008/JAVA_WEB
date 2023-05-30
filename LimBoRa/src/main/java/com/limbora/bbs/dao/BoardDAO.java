package com.limbora.bbs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.limbora.bbs.vo.Board;

public class BoardDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private DataSource dataSource;
	private static BoardDAO instance;

	// 기본 생성자에서 환경변수를 통한 데이터베이스 관련 DataSource얻어옴
	// Server / contex.xml에 Resource로 세팅해놓은 정보
	public BoardDAO() {
		System.out.println("여기는 BoardDao 생성자");
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 모든 게시물 조회 메소드
	public List<Board> getBoardList() {
		List<Board> boardList = new ArrayList<>();

		try {
			con = dataSource.getConnection();
			String sql = "SELECT * FROM tbl_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println("getBoardList:"+sql);

			while (rs.next()) {
				int bno = rs.getInt("bno");
				String title = rs.getString("title");
				String content = rs.getString("content");
				int hitno = rs.getInt("hitno");
				String regdate = rs.getString("regdate");

				Board board = new Board(bno, title, content, hitno, regdate);
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return boardList;
	}

	// 새글쓰기 메소드
	public void insertBoard(Board newBoard) {
		try {
			con = dataSource.getConnection();
			String sql = "INSERT INTO tbl_board (bno, title, content, hitno, regdate) VALUES (SEQ_BNO.nextval, ?, ?, 0, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newBoard.getTitle());
			pstmt.setString(2, newBoard.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	// 게시물 수정 메소드
	public void updateBoard(Board updatedBoard) {
	    try {
	        con = dataSource.getConnection();
	        String sql = "UPDATE tbl_board SET title = ?, content = ? WHERE bno = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, updatedBoard.getTitle());
	        pstmt.setString(2, updatedBoard.getContent());
	        pstmt.setInt(3, updatedBoard.getBno());
	        pstmt.executeUpdate();
	        System.out.println("updateBoard:" + sql);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	}
	

    // 게시물 번호로 게시물 정보 조회
    public Board getBoardByBno(int bno) {
        Board board = null;

        try {
            con = dataSource.getConnection();
            String sql = "SELECT * FROM tbl_board WHERE bno=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, bno);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("content");
                int hitno = rs.getInt("hitno");
                String regdate = rs.getString("regdate");

                board = new Board(bno, title, content, hitno, regdate);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return board;
    }

	// 자원닫기 메소드
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

}
