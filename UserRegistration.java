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

