package com.limbora.bbs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.limbora.bbs.vo.Board;
import com.limbora.bbs.dao.BoardDAO;

// 게시물 리스트 서블릿
@WebServlet("/boardList")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardDAO boardDAO;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boardDAO = new BoardDAO();
		
		// 게시물 목록 조회
		List<Board> boardList = boardDAO.getBoardList();

		// JSP로 게시물 목록 전달
		request.setAttribute("boardList", boardList);
		request.getRequestDispatcher("/boardList.jsp").forward(request, response);
	}
}
