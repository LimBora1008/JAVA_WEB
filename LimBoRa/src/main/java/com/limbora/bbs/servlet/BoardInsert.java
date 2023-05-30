package com.limbora.bbs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.limbora.bbs.dao.BoardDAO;
import com.limbora.bbs.vo.Board;

// 게시물 등록 서블릿
@WebServlet("/boardInsert")
public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardDAO boardDAO;

	@Override
	public void init() throws ServletException {
		super.init();
		boardDAO = new BoardDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 요청 파라미터 인코딩 설정

		// 요청 파라미터에서 게시물 정보 추출
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		// 새로운 게시물 객체 생성
		Board newBoard = new Board();
		newBoard.setTitle(title);
		newBoard.setContent(content);

		// 게시물 등록
		boardDAO.insertBoard(newBoard);

		// 등록 후 게시물 목록 페이지로 리다이렉트
		response.sendRedirect("boardList");
	}

}
