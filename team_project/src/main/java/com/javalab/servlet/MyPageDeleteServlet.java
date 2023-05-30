package com.javalab.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalab.dao.MyPageDao;
import com.javalab.vo.Member;
import com.javalab.vo.Seat;
import com.javalab.vo.Ticket;

@WebServlet("/mypageDelete")
public class MyPageDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("mypageDelete doGet");

        HttpSession session = request.getSession();
        Member member = (Member) session.getAttribute("member");

        if (member == null) {
            response.sendRedirect("myPage.jsp");
            return;
        }
        
        
        String id = member.getId();
       

        if (id == null || id.isEmpty()) {
            System.out.println("아이디 없음");
            response.sendRedirect("myPage.jsp");
        } else {
            MyPageDao dao = new MyPageDao();
            ArrayList<Ticket> ticketList = dao.getTicketList(id);
            dao.deleteMember(ticketList,id);

            // 세션 무효화
            session.invalidate();

            response.sendRedirect("mainPage.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("mypageDelete doPost");
        // POST 요청에 대한 처리를 원하시는 대로 구현하세요.
    }
}
