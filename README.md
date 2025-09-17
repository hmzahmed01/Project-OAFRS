
CODES

Login.java
package com.wipro.web;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//import com.mysql.jdbc.Connection;
//import com.mysql.jdbc.PreparedStatement;

public class loginDao {
	String jdbcurl="jdbc:mysql://localhost:3306/database?useSSL=false";
	String jdbcusername="root";
	String jdbcpassword="rootsql";
	public boolean check(String uname,String password){
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection(jdbcurl,jdbcusername,jdbcpassword);
			PreparedStatement st= con.prepareStatement("select * from user where uname=? and password=?");
			st.setString(1,uname);
			st.setString(2,password);
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return false;
	}

}

Login Servlet

package com.wipro.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.wipro.web.loginDao;
/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin.java")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname=request.getParameter("uname");
		String password=request.getParameter("password");
		loginDao dao=new loginDao();
		if(dao.check(uname,password)) {
			HttpSession session=request.getSession();
			session.setAttribute("username", uname);
			response.sendRedirect("Uhome.jsp");
		}
		else
		{
			response.sendRedirect("loginfailed.jsp");
		}
	}
}

Registration Members
package com.wipro.web;


public class UserMember {
	private String fname, lname, dob, gender, uname, password, address, phoneNo;
	
	public UserMember() {
		super();
	}
	
	public UserMember(String fname, String lname, String dob, String gender, String uname, String password, String address, String phoneNo) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.dob = dob;
		this.gender = gender;
		this.uname = uname;
		this.password = password;
		this.address =address;
		this.phoneNo = phoneNo;
	}
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
	
	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}
	
	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	
}


Registration Servlet
package com.wipro.web;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserRegistration
 */
@WebServlet("/UserRegistration.java")
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public UserRegistration() {
        super();
        // TODO Auto-generated constructor stub
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
		
		String fname= request.getParameter("fname");
		String lname= request.getParameter("lname");
		String dob= request.getParameter("dob");
		String gender= request.getParameter("gender");
		String uname= request.getParameter("uname");
		String password= request.getParameter("password");
		String address= request.getParameter("address");
		String phoneNo= request.getParameter("phoneNo");
		RequestDispatcher dispatcher = null;
		Connection con= null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "rootsql");
			PreparedStatement ps= con.prepareStatement("insert into user(fname, lname, dob, gender, uname, password, address, phoneNo) values(?,?,?,?,?,?,?,?) ");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, dob);
			ps.setString(4, gender);
			ps.setString(5, uname);
			ps.setString(6, password);
			ps.setString(7, address);
			ps.setString(8, phoneNo);
			
			int rowCount = ps.executeUpdate();
			dispatcher = request.getRequestDispatcher("registrationSuccess.jsp");
			if(rowCount > 0)
			{
				request.setAttribute("status", "Success");
			}
			else
			{
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}	
	}
}

Flight Details.java
package com.wipro.web;

public class FlightDetails {
	private int flight_id;
	private String flight_name;
	private String source;
	private String destination;
	private String etd;
	private String seating_capacity;
	private String reservaton_type;
	private String reservaton_capacity;
	
		
	public FlightDetails(String flight_name, String source, String destination, String etd, String seating_capacity,
			String reservaton_type, String reservaton_capacity) {
		super();
		this.flight_name = flight_name;
		this.source = source;
		this.destination = destination;
		this.etd = etd;
		this.seating_capacity = seating_capacity;
		this.reservaton_type = reservaton_type;
		this.reservaton_capacity = reservaton_capacity;
	}
	public FlightDetails(int flight_id, String flight_name, String source, String destination, String etd,
			String seating_capacity, String reservaton_type, String reservaton_capacity) {
		super();
		this.flight_id = flight_id;
		this.flight_name = flight_name;
		this.source = source;
		this.destination = destination;
		this.etd = etd;
		this.seating_capacity = seating_capacity;
		this.reservaton_type = reservaton_type;
		this.reservaton_capacity = reservaton_capacity;
	}
	public int getFlight_id() {
		return flight_id;
	}
	public void setFlight_id(int flight_id) {
		this.flight_id = flight_id;
	}
	public String getFlight_name() {
		return flight_name;
	}
	public void setFlight_name(String flight_name) {
		this.flight_name = flight_name;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getEtd() {
		return etd;
	}
	public void setEtd(String etd) {
		this.etd = etd;
	}
	public String getSeating_capacity() {
		return seating_capacity;
	}
	public void setSeating_capacity(String seating_capacity) {
		this.seating_capacity = seating_capacity;
	}
	public String getReservaton_type() {
		return reservaton_type;
	}
	public void setReservaton_type(String reservaton_type) {
		this.reservaton_type = reservaton_type;
	}
	public String getReservaton_capacity() {
		return reservaton_capacity;
	}
	public void setReservaton_capacity(String reservaton_capacity) {
		this.reservaton_capacity = reservaton_capacity;
	}
	

}

FLightDetailsDao 
package com.wipro.web;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.wipro.web.FlightDetails;

public class FlightDetailsDao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/database?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "rootsql";
	private String jdbcDriver ="com.mysql.cj.jdbc.Driver";
	private static final String INSERT_USERS_SQL = "INSERT INTO flightdetails" + "  (flight_name, source, destination, etd, seating_capacity, reservaton_type, reservaton_capacity) VALUES "
			+ " (?, ?, ?, ?, ?, ?, ?);";
	
	private static final String SELECT_USER_BY_ID = "select flight_id,flight_name,source,destination,etd,seating_capacity,reservaton_type,reservaton_capacity from flightdetails where flight_id =?";
	private static final String SELECT_ALL_USERS = "select * from flightdetails";
	private static final String DELETE_USERS_SQL = "delete from flightdetails where flight_id = ?;";
	private static final String UPDATE_USERS_SQL = "update flightdetails set flight_name = ?, source= ?, destination=?, etd=?, seating_capacity=?, reservaton_type=?, reservaton_capacity=? where flight_id = ?;";
	
	public FlightDetailsDao() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName(jdbcDriver);
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	public void insertFlight(FlightDetails flightdetails) throws SQLException {
		System.out.println(INSERT_USERS_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, flightdetails.getFlight_name());
			preparedStatement.setString(2, flightdetails.getSource());
			preparedStatement.setString(3, flightdetails.getDestination());
			preparedStatement.setString(4, flightdetails.getEtd());
			preparedStatement.setString(5, flightdetails.getSeating_capacity());
			preparedStatement.setString(6, flightdetails.getReservaton_type());
			preparedStatement.setString(7, flightdetails.getReservaton_capacity());
			
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public FlightDetails selectFlight(int flight_id) {
		FlightDetails flightdetails = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setInt(1, flight_id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String flight_name = rs.getString("flight_name");
				String source = rs.getString("source");
				String destination = rs.getString("destination");
				String etd = rs.getString("etd");
				String seating_capacity = rs.getString("seating_capacity");
				String reservaton_type = rs.getString("reservaton_type");
				String reservaton_capacity = rs.getString("reservaton_capacity");
				flightdetails = new FlightDetails(flight_id, flight_name, source, destination, etd, seating_capacity, reservaton_type,   reservaton_capacity);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return flightdetails;
	}
	
	public List<FlightDetails> selectAllFlights() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<FlightDetails> flightdetails = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int flight_id = rs.getInt("flight_id");
				String flight_name = rs.getString("flight_name");
				String source = rs.getString("source");
				String destination = rs.getString("destination");
				String etd = rs.getString("etd");
				String seating_capacity = rs.getString("seating_capacity");
				String reservaton_type = rs.getString("reservaton_type");
				String reservaton_capacity = rs.getString("reservaton_capacity");
				flightdetails.add(new FlightDetails(flight_id, flight_name, source, destination, etd, seating_capacity, reservaton_type, reservaton_capacity));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return flightdetails;
	}
	
	public boolean updateFlight(FlightDetails flightdetails) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
			System.out.println("updated Flight:"+statement);
			statement.setString(1, flightdetails.getFlight_name());
			statement.setString(2, flightdetails.getSource());
			statement.setString(3, flightdetails.getDestination());
			statement.setString(4, flightdetails.getEtd());
			statement.setString(5, flightdetails.getSeating_capacity());
			statement.setString(6, flightdetails.getReservaton_type());
			statement.setString(7, flightdetails.getReservaton_capacity());
			statement.setInt(8, flightdetails.getFlight_id());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	
	public boolean deleteFlight(int flight_id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
			statement.setInt(1, flight_id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}
	
	
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}

Flight Servlet to add/edit/delete flights
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
	

