<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Admin's Dashboard</title>
    <style>
    .sidebar {
    width: 200px;
    background-color: #f1f1f1;
    position: fixed;
    height: 100%;
    overflow: auto;
  }
  
  /* Sidebar links */
  .sidebar a {
    display: block;
    color: black;
    padding: 16px;
    text-decoration: none;
  }
  
  /* Active/current link */
  .sidebar a.active {
    background-color: #04AA6D;
    color: white;
  }
  
  /* Links on mouse-over */
  .sidebar a:hover:not(.active) {
    background-color: #555;
    color: white;
  }
  
  /* Page content. The value of the margin-left property should match the value of the sidebar's width property */
  div.content {
    margin-top: 56px;
    margin-left: 200px;
    padding: 1px 16px;
    height: 1000px;
  }
  
  /* On screens that are less than 700px wide, make the sidebar into a topbar */
  @media screen and (max-width: 700px) {
    .sidebar {
      width: 100%;
      height: auto;
      position: relative;
    }
    .sidebar a {float: left;}
    div.content {margin-left: 0;}
  }
  
  /* On screens that are less than 400px, display the bar vertically, instead of horizontally */
  @media screen and (max-width: 400px) {
    .sidebar a {
      text-align: center;
      float: none;
    }
  }
  .navbar{
    overflow: hidden;
    position: fixed;
    top: 0;
    width: 100%;
    }
    footer{
    width: 100%;
    background-color: black;
    padding: 2px;
}
footer p{
    color: #f1f1f1;
    text-align: center;

}
  
    </style>
</head>
<body>
    <div>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-fixed" >
            <div class="container-fluid">
              <a class="navbar-brand" href="#">XYZ</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="adminhome.jsp">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link active" href="viewpassenger.jsp">View Passenger details</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link" href="Alogin.jsp">Logout</a>
                  </li>
                </ul>
                <form class="d-flex">
                  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                  <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
              </div>
            </div>
          </nav>
          <!-- The sidebar -->
<div class="sidebar">
    <a class="active" href="addflight.jsp">Add Flight Details</a>
    <a class="active" href="addfschedule.jsp">Add Flight Schedule</a>
    <a class="active" href="addroute.jsp">Add Route</a>
  </div>
  <div class="content">
  	<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Show Flight details</a></li>
			</ul>
      <p><h2><b>Flight Details</b></h2></p>
    <table class="table">
        <thead>
          <tr>
            <th scope="col">Flight ID</th>
            <th scope="col">Flight Name</th>
            <th scope="col">Source</th>
            <th scope="col">Destination</th>
            <th scope="col">Estimated Travel Duration</th>
            <th scope="col">Seating capacity</th>
            <th scope="col">Reservation Type</th>
            <th scope="col">Reservation Capacity</th>
            <th scope="col">Actions</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="flightdetails" items="${listFlight}">
          <tr>
            <td><c:out value="${flightdetails.flight_id}"></c:out></td>
            <td><c:out value="${flightdetails.flight_name}"></c:out></td>
            <td><c:out value="${flightdetails.source}"></c:out></td>
            <td><c:out value="${flightdetails.destination}"></c:out></td>
            <td><c:out value="${flightdetails.etd}"></c:out></td>
            <td><c:out value="${flightdetails.seating_capacity}"></c:out></td>
            <td><c:out value="${flightdetails.reservaton_type}"></c:out></td>
            <td><c:out value="${flightdetails.reservaton_capacity}"></c:out></td>
            <td><a href="edit?flight_id=<c:out value='${flightdetails.flight_id}' />">Edit</a>
			&nbsp;&nbsp;&nbsp;&nbsp; <a href="delete?flight_id=<c:out value='${flightdetails.flight_id}' />">Delete</a></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <div class="container text-left">
				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
					New Flight</a>
			</div>
  </div>

  <footer>
    <p>Copyright &copy; XYZ All Rights Reserved Air Flight Ltd.</p>
</footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>