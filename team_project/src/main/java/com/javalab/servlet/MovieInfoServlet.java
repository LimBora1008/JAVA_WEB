package com.javalab.servlet;

import java.io.IOException;

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


@WebServlet("/movieInfo")
public class MovieInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieDao mDao = MovieDao.getInstance();  

    public MovieInfoServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String id = req.getParameter("id");
		Movie movieOne = mDao.selectOneMovie(id);
		req.setAttribute("movieOne", movieOne);
		RequestDispatcher rd = req.getRequestDispatcher("movieInfo.jsp");
		rd.forward((ServletRequest) req, (ServletResponse) resp);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
