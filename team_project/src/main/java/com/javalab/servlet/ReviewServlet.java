package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.javalab.dao.MovieDao;
import com.javalab.dao.ReviewDao;
import com.javalab.vo.Member;
import com.javalab.vo.Review;


@WebServlet("/review")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewDao reviewDao = ReviewDao.getInstance();

    public ReviewServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

        HttpSession session = req.getSession();
        Member member = (Member) session.getAttribute("member");
        if (member != null) {
        	String userId = member.getId();
        }
        String movieId = req.getParameter("movieId");
        // 영화아이디가 있으면
        if (movieId != null) {
        	ArrayList<Review> reviewList = reviewDao.getAllReview(movieId);
            req.setAttribute("reviewList", reviewList);
            
			Gson gson = new Gson();
			String jsonString = gson.toJson(reviewList);
			PrintWriter out = resp.getWriter();
			out.print(jsonString);
			return;
        }
	}

}
