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
			response.sendRedirect("Uhome.jsp");
		}
	}
}
