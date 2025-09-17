<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
 String admin_id =  request.getParameter("admin_id");
 String password = request.getParameter("password");
 
 if((admin_id.equals("Team") && password.equals("Sixteen")))
 {
	 response.sendRedirect("adminhome.jsp");
 }
 else
 {
	 response.sendRedirect("errorAlogin.html");
 }
%>

</body>
</html>