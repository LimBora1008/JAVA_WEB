package com.javalab.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.javalab.dao.MyPageDao;
import com.javalab.vo.Member;
import com.javalab.vo.Ticket;

// 마이페이지 서블릿
@WebServlet("/mypage")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("mypage doGet");
		
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		
		String id = "";
		if (member != null) {
		    // member 객체 사용
			id = member.getId();
		}

		
		if (id.equals("") || id.equals(null)) {
			System.out.println("아이디없음");
			response.sendRedirect("loginForm.jsp");
		}else {
			
			MyPageDao dao = new MyPageDao();
			ArrayList<Ticket> ticketList = dao.getTicketList(id);
			ArrayList<Member> memberList = dao.getMemberList(id);
			
				
			// 조회결과를 request 영역에 저장
			request.setAttribute("memberList", memberList);
			request.setAttribute("ticketList", ticketList);
			System.out.println("ticketList 저장");
			
			// 화면이동
			RequestDispatcher dispatcher = request.getRequestDispatcher("myPage.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("mypage doPost");
		
	}

}
