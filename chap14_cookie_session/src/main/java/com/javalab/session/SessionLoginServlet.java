package com.javalab.session;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalab.dao.MemberDAO;
import com.javalab.vo.MemberVo;

import oracle.net.aso.n;


@WebServlet("/sessionLogin")
public class SessionLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// [멤버 변수]
	// 서블릿의 멤버변수로 싱글톤으로 만든 boardDao 객체의 주소를 얻어옴
	private MemberDAO memberDAO = MemberDAO.getInstance();
	
	// 로그인 폼을 띄워주는 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		
		String contextPath = request.getContextPath();
		
		// 1. 세션에 로그인 정보가 있는지 확인
		// 세션 객체 얻기
		HttpSession session = request.getSession();
		MemberVo member = (MemberVo)session.getAttribute("member");
		
		// 세션이 없으면 member 객체가 널값
		if(member != null) { // 로그인 정보 존재
			// [방법1] sendRedirect
			response.sendRedirect(contextPath+"/session/alreadyLogin.jsp");
			return; // 메소드 중간에 sendRedirect or forward가 나오는 경우 꼭 return을 넣어주기
			
			// [방법2] forward
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/session/alreadyLogin.jsp");
//			dispatcher.forward(request, response);
//			return; 
		}
		
		// 세션에 로그인 정보가 없으므로 로그인 페이지 띄워줌
		// [방법1] sendRedirect
		response.sendRedirect(contextPath+"/session/loginForm.jsp");
		
		// [방법2] forward
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/session/loginForm.jsp");
//		dispatcher.forward(request, response);
	}
	
	// 로그인 처리 메소드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		
		// 1. 임시 변수 선언
		String id = "";
		String pwd = "";
		String contextPath = request.getContextPath();
		String url = "/session/loginForm.jsp"; // 로그인 실패시 다시 로그인 화면으로 이동
		
		// 2. 넘어온 아이디 비번 추출
		id = request.getParameter("id");
		pwd = request.getParameter("pwd");
		
		// 3. 아이디 비빌번호 재검증
		if(id == null || id.equals("")) {
			RequestDispatcher rds = request.getRequestDispatcher(url); // 로그인으로
			rds.forward(request, response);
			return; 
		}
		if(pwd == null || pwd.equals("")) {
			RequestDispatcher rds = request.getRequestDispatcher(url); // 로그인으로
			rds.forward(request, response);
			return; 
		}
		// 화면에서 받은 값으로 객체 생성
		MemberVo mb = new MemberVo(id,pwd);
		
		// 4. 입력한 사용자가 있는지 체크
		MemberVo member = memberDAO.getMemberById(mb);
		// 4.1 쿼리 결과로 사용자 객체를 받아옴.
		//	객체가 널이면 회원이 없다는 의미
		if(member == null) {
			// 4.2 로그인 오류 = true로 세팅
			request.setAttribute("message", "아이디와 비밀번호를 확인하세요");
			RequestDispatcher rds = request.getRequestDispatcher(url);
			rds.forward(request, response);
		}else {
			// 4.3 로그인 성공 > 세션에 사용자 정보 기록
			HttpSession session = request.getSession();
			// 4.4 세션에 객체 저장
			// (Jsp에서 꺼내 쓸때는 ${sessionScope.member.id})
			// member라는 이름(key)으로 member객체 저장
			session.setAttribute("member", member);
			
			// 4.5 세션의 유지 시간 설정
			session.setMaxInactiveInterval(3600); // 세션 유지시간 지정(옵션)
			System.out.println("세션 저장 성공");
			
			url = contextPath + "/session/welcome.jsp";
			response.sendRedirect(url);
		}
	}

}
