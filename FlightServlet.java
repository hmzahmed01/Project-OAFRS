package com.wipro.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.wipro.web.FlightDetails;
import com.wipro.web.FlightDetailsDao;
/**
 * Servlet implementation class FlightServlet
 */
@WebServlet("/")
public class FlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FlightDetailsDao flightdetailsDao;
	
	public void init() {
		flightdetailsDao = new FlightDetailsDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertFlight(request, response);
				break; 
			case "/delete":
				deleteFlight(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateFlight(request, response);
				break;
			default:
				listFlight(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
	
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("addflight.jsp");
		dispatcher.forward(request, response);
	}
	
	private void insertFlight(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String flight_name = request.getParameter("flight_name");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String etd = request.getParameter("etd");
		String seating_capacity = request.getParameter("seating_capacity");
		String reservaton_type = request.getParameter("reservaton_type");
		String reservaton_capacity = request.getParameter("reservaton_capacity");
		FlightDetails newFlight = new FlightDetails(flight_name, source, destination, etd, seating_capacity, reservaton_type, reservaton_capacity);
		flightdetailsDao.insertFlight(newFlight);
		response.sendRedirect("list");
	}
	private void deleteFlight(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int flight_id = Integer.parseInt(request.getParameter("flight_id"));
		flightdetailsDao.deleteFlight(flight_id);
		response.sendRedirect("list");

	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int flight_id = Integer.parseInt(request.getParameter("flight_id"));
		FlightDetails existingFlight;
		try {
			existingFlight = flightdetailsDao.selectFlight(flight_id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("addflight.jsp");
			request.setAttribute("flightdetails", existingFlight);
			dispatcher.forward(request, response);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void updateFlight(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int flight_id = Integer.parseInt(request.getParameter("flight_id"));
		String flight_name = request.getParameter("flight_name");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		String etd = request.getParameter("etd");
		String seating_capacity = request.getParameter("seating_capacity");
		String reservaton_type = request.getParameter("reservaton_type");
		String reservaton_capacity = request.getParameter("reservaton_capacity");
		
		FlightDetails book = new FlightDetails(flight_id, flight_name, source, destination, etd, seating_capacity, reservaton_type, reservaton_capacity);
		flightdetailsDao.updateFlight(book);
		response.sendRedirect("list");
	}
	private void listFlight(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<FlightDetails> listFlight = flightdetailsDao.selectAllFlights();
		request.setAttribute("listFlight", listFlight);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminhome.jsp");
		dispatcher.forward(request, response);
	}
}
	