package com.limbora.bbs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.limbora.bbs.dao.BoardDAO;
import com.limbora.bbs.vo.Board;

// 게시물 상세+수정 서블릿
@WebServlet("/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BoardDAO boardDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        boardDAO = new BoardDAO();
    }

    // 게시물 상세보기
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 요청 파라미터에서 게시물 번호 추출
        int bno = Integer.parseInt(request.getParameter("bno"));

        // 게시물 정보 조회
        Board board = boardDAO.getBoardByBno(bno);

        // 게시물 정보를 request 속성에 저장
        request.setAttribute("board", board);

        // boardUpdate.jsp로 포워딩
        request.getRequestDispatcher("boardUpdate.jsp").forward(request, response);
    }

    // 상세보기 화면에서 수정발생시
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 요청 파라미터에서 게시물 정보 추출
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        int bno = Integer.parseInt(request.getParameter("bno"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        // 게시물 객체 생성
        Board updatedBoard = new Board();
        updatedBoard.setBno(bno);
        updatedBoard.setTitle(title);
        updatedBoard.setContent(content);

        // 게시물 업데이트
        boardDAO.updateBoard(updatedBoard);

        // 게시물 리스트로 리다이렉트
        response.sendRedirect("boardList");
    }
}
