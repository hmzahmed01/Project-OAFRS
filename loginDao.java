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