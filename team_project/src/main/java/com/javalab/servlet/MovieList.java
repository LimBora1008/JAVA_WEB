package com.javalab.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.MovieDao;
import com.javalab.vo.Movie;

@WebServlet("/movieList")
public class MovieList extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private MovieDao moviedao = MovieDao.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageParam = request.getParameter("page");
        String pageSizeParam = request.getParameter("pageSize");

        int currentPage = pageParam != null ? Integer.parseInt(pageParam) : 1;
        int pageSize = pageSizeParam != null ? Integer.parseInt(pageSizeParam) : 20;

        MovieDao movieDao = new MovieDao();
        ArrayList<Movie> movieListData = movieDao.getMovieList(currentPage, pageSize);

        request.setAttribute("movieListData", movieListData);
        RequestDispatcher rd = request.getRequestDispatcher("movieList.jsp");
        rd.forward(request, response);
        
    }
}
