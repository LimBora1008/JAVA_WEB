package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 	사용자로부터 Ajax 요청을 받고 받은 자료를 그대로 사용자
 	웹 브라우저에 반환
 */
@WebServlet("/ajaxTest")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/x-json; charset=UTF-8");

		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		// [디버깅] 클라이언트로부터 ajax 요청으로 전달받은 값
		System.out.println("Servlet doGet id / pwd : " + id + "/" + pwd);
		// 사용자의 웹브라우저의 body부분에 씀
		out.print("At Server : id : " + id + "이고 pew : " + pwd);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
