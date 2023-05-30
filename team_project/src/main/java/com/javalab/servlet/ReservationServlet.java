package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalab.vo.Location;
import com.javalab.vo.Member;
import com.javalab.vo.Movie;
import com.javalab.vo.Theater;
import com.javalab.vo.Ticket;
import com.javalab.vo.Screen;
import com.google.gson.Gson;
import com.javalab.dao.LocationDao;
import com.javalab.dao.MovieDao;
import com.javalab.dao.ScreenDao;
import com.javalab.dao.TheaterDao;
import com.javalab.dao.TicketDao;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieDao mDao = MovieDao.getInstance();

	private LocationDao lDao = LocationDao.getInstance();

	private TheaterDao tDao = TheaterDao.getInstance();
	private ScreenDao sDao = ScreenDao.getInstance();
	private TicketDao ticketDao = TicketDao.getInstance();

	public ReservationServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		String id = req.getParameter("id");
		
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			resp.sendRedirect("loginForm.jsp");
			return;
		}

		Movie movieOne = this.mDao.selectOneMovie(id);
		req.setAttribute("movieOne", movieOne);
		List<Location> locationList = this.lDao.showAllLocation();

		req.setAttribute("locationList", locationList);
		RequestDispatcher rd = req.getRequestDispatcher("reservation.jsp");
		rd.forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");

		String clickedLocationLoc = req.getParameter("clickedLocationLoc");

		String theaterName = req.getParameter("theaterName");
		String movieId = req.getParameter("id");

		String movieId2 = req.getParameter("movie-id");
		String theaterName2 = req.getParameter("theater-name");
		String screenNo = req.getParameter("screen-no");

		if (clickedLocationLoc != null) {
			List<Theater> theaterList = tDao.showTheater(clickedLocationLoc);
			Gson gson = new Gson();
			String jsonString = gson.toJson(theaterList);
			PrintWriter out = resp.getWriter();
			out.print(jsonString);
		}
		if (theaterName != null && theaterName != null) {
			List<Screen> screenList = this.sDao.showScreen(theaterName, movieId);
			Gson gson = new Gson();
			String jsonString = gson.toJson(screenList);
			PrintWriter out = resp.getWriter();
			out.print(jsonString);
			return;
		}

		if (movieId2 != null && theaterName2 != null && screenNo != null) {
			Screen screenOne = this.sDao.showOneScreen(theaterName2, movieId2, screenNo);
			req.setAttribute("screenOne", screenOne);
			RequestDispatcher rd = req.getRequestDispatcher("/seat.jsp");
			rd.forward(req, resp);
			return;
		}

		String userId = req.getParameter("userId");
		String movieId3 = req.getParameter("movieId");
		String moviePrice = req.getParameter("moviePrice");
		String seatCode = req.getParameter("seatCode");
		String screenNo3 = req.getParameter("screenNo");
		String len = req.getParameter("len");
		String wid = req.getParameter("wid");

		String theme = req.getParameter("theme");
		


		if (theme != null && theme.equals("예약하기")) {
			PrintWriter out = resp.getWriter();
			
//			Ticket ticketCode = ticketDao.getTicketCode(userId);
//			int tCode = ticketCode.getTicket_code();
			
			boolean validSeat = ticketDao.validSeat(len, wid, screenNo3);
			System.out.println(validSeat);
			if (validSeat == true) {
				System.out.println("이미 예약된 좌석입니다");
				out.print("alreadySeat");
				return;
			} else {
				System.out.println("예약가능합니다.");
				
				HttpSession session = req.getSession();
				Member member = (Member) session.getAttribute("member");

				boolean reservationSuccess;
				

				int wid2 = Integer.parseInt(wid);
				int moviePrice2 = Integer.parseInt(moviePrice);
				int movieId4 = Integer.parseInt(movieId3);
				Ticket vo = new Ticket(moviePrice2, movieId4, userId);
				ticketDao.insertTicket(vo);
				Ticket ticketCode = ticketDao.getTicketCode(userId);
				int tCode = ticketCode.getTicket_code();
				reservationSuccess = ticketDao.insertSeat(tCode, len, wid2, screenNo3);

				if (reservationSuccess == true) {
					out.print("true");
				} else {
					out.print("false");
				}
				return;

			}

			

		}

	}

}
