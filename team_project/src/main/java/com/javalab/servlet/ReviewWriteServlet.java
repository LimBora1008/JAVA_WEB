package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.javalab.dao.ReviewDao;
import com.javalab.vo.Member;
import com.javalab.vo.Review;
import com.javalab.vo.Ticket;

@WebServlet("/reviewWrite")
public class ReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewDao reviewDao = ReviewDao.getInstance();
	public ReviewWriteServlet() {
		super();

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset:utf-8");

        HttpSession session = req.getSession();
        Member member = (Member) session.getAttribute("member");
        String userId = null;
        if (member != null) {
        	userId = member.getId();
        }
        String movieId = req.getParameter("movieId2");
        // 로그인 되어있고 영화id가 있다면
        if (userId != null && movieId != null) {
      
        	ArrayList<Ticket> ticketCodeList = reviewDao.getTicketCode(movieId, userId);
            req.setAttribute("ticketCodeList", ticketCodeList);
      
//			for(TicketVo i : ticketCodeList) { 
//			    System.out.println(i.getTicket_code());
//			}
            
            String content = req.getParameter("content");
            String score = req.getParameter("score");
      
   
            
            int ticketCode = ticketCodeList.get(0).getTicket_code();
            
            System.out.println(ticketCode);
            
            reviewDao.insertReview(content, score, ticketCode);
            
            resp.sendRedirect(req.getContextPath() + "/movieInfo?id="+movieId);
        }

	}

}
