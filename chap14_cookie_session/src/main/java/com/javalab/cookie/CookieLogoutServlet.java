package com.javalab.cookie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cookieLogout")
public class CookieLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// 쿠키 삭제(무효화)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 새로운 쿠키 객체 생성
		Cookie cookie = new Cookie("id","");
		
		// 쿠키 객체의 유효 기간을 0으로 세팅(삭제)
		cookie.setMaxAge(0);
		
		// response 사용자 브라우저의 해더에 저장(기존 쿠키 엎어씀)
		response.addCookie(cookie);
		System.out.println("쿠키 삭제 완료");
		
		String contextPath = request.getContextPath();
		
		// 쿠키가 없으므로 로그인 페이지를 띄워준다.
		response.sendRedirect(contextPath+"/cookie/loginForm.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
