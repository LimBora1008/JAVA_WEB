package com.javalab.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * [서블릿 클래스] 자바 프로그램을 통해서 웹 요청을 처리할 수 있는 클래스
 * 	- 반드시 httpServlet 상속해야 한다
 * 	- 서블릿 컨테이너(톰캣)에 의해 생성/관리/소멸 한다
 * 	- web.xml을 통해서 웹을 처리할 수 있는 매핑 작업을 하거나
 * 	- @WebServlet("/first") 어노테이션을 통해서 매핑 작업을 해야 한다.
 * 	- 서블릿은 수정하고 저장하면 잠시 후에 서버(WAS)가 자동으로 재시작된다
 */
/**
 * Servlet implementation class SecondServlet
 */
// @WebServlet("/second")
public class SecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecondServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
