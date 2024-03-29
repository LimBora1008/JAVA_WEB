package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalab.dao.MemberDao;

/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/idCheck")
public class IdCheckServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {
      doHandler(request, response);
   }

   private void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      
      PrintWriter out = response.getWriter();

      String id = request.getParameter("id");
      
      // [디버깅]
      System.out.println("서블릿 doHandler id : " + id);
      
      MemberDao dao = new MemberDao();
      boolean idExist = dao.isIdExist(id);

      if (idExist == true) {
         out.print("true");
      } else {
         out.print("false");
      }
   }

}