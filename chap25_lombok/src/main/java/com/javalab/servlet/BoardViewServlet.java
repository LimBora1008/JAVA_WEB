package com.javalab.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.BoardDAO;
import com.javalab.dto.BoardModel;


@WebServlet("/boardView")
public class BoardViewServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	// 싱글톤으로 만든 boardDAO 객체 얻어옴
	private BoardDAO boardDAO = BoardDAO.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// boardList.jsp > "get" > parameter no 값을 저장할 객체
		// 전달되는 parameter 명 : no
		BoardModel boardModel = new BoardModel();
		// request.getParameter("no") : 주소창을 통해 나오는 값은 다 문자열이다 때문에 int형으로 변경한다
		int n = Integer.parseInt(request.getParameter("no")); 
		boardModel.setNo(n);
		
		boardDAO.updateHit(boardModel); // 조회수 증가
		BoardModel boardOne = boardDAO.selectOne(boardModel);
		
		// 해당 데이터만 조회
		request.setAttribute("board", boardOne);
		RequestDispatcher rd = request.getRequestDispatcher("boardView.jsp");
		rd.forward(request, response);
	}

}
