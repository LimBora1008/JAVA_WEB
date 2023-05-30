package com.javalab.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.MovieDao;
import com.javalab.vo.Movie;

@WebServlet("/mainPage")
public class MainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieDao mDao = MovieDao.getInstance();
	
	public MainPageServlet() {
		super();

	}
	
	

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		List<Movie> movieList = mDao.showAllMovies();
		req.setAttribute("movieList", movieList);
		
//		RequestDispatcher rd = req.getRequestDispatcher("mainPage.jsp");
//		rd.forward((ServletRequest) req, (ServletResponse) resp);

		
//        String pageParam = req.getParameter("page");
//        String pageSizeParam = req.getParameter("pageSize");
//
//        int currentPage = pageParam != null ? Integer.parseInt(pageParam) : 1;
//        int pageSize = pageSizeParam != null ? Integer.parseInt(pageSizeParam) : 20;
//
//        ArrayList<Movie> movieListData = mDao.getMovieList(currentPage, pageSize);
//
//        req.setAttribute("movieList", movieListData);
        RequestDispatcher rd = req.getRequestDispatcher("mainPage.jsp");
        rd.forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
