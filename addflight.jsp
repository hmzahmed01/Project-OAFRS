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
    <title>Add Flights</title>
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
     .content form{
        padding: 5px;
        margin: 6px;
        border: 2px solid black;
        border-radius: 15px;
        box-shadow: 10px 10px 8px #888888;
        box-sizing: border-box;
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
                    <a class="nav-link" href="Ulogin.jsp">Logout</a>
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
      
        <c:if test="${flightdetails != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${flightdetails == null}">
					<form action="insert" method="post">
				</c:if>
				<caption>
					<h2>
						<c:if test="${flightdetails != null}">
            			Edit Flight
            		</c:if>
						<c:if test="${flightdetails == null}">
            			Add New Flight
            		</c:if>
					</h2>
				</caption>
          
        <div class="mb-3">
        <c:if test="${flightdetails != null}">
        <label for="FlightID" class="form-label">Flight ID</label>
        <input type="hidden" class="form-control" value="<c:out value='${flightdetails.flight_id}' />" name="flight_id">  
      	</c:if>
      </div>
      <div class="mb-3">
        <label for="FlightName" class="form-label">Flight Name</label>
        <input type="text" class="form-control" value="<c:out value='${flightdetails.flight_name}' />" name="flight_name">
      </div>
    <div class="mb-3">
    <label for="Source" class="form-label">Source</label>
    <input type="text" class="form-control" value="<c:out value='${flightdetails.source}' />" name="source">
  </div>
  <div class="mb-3">
    <label for="Destination" class="form-label">Destination</label>
    <input type="text" class="form-control" value="<c:out value='${flightdetails.destination}' />" name="destination">
  </div>
  <div class="mb-3">
    <label for="ETD" class="form-label">Estimated Travel Duration</label>
    <input type="text" class="form-control" value="<c:out value='${flightdetails.etd}' />" name="etd">
  </div>
  <div class="mb-3">
    <label for="SeatingCapacity" class="form-label">Seating Capacity</label>
    <input type="text" class="form-control" value="<c:out value='${flightdetails.seating_capacity}' />" name="seating_capacity">
  </div>
  <div class="mb-3">
    <label for="ReservationType" class="form-label">Reservation Type</label>
    <input type="text" class="form-control" value="<c:out value='${flightdetails.reservaton_type}' />" name="reservaton_type">
  </div>
  <div class="mb-3">
    <label for="ReservationCapacity" class="form-label">Reservation Capacity</label>
    <input type="text" class="form-control" value="<c:out value='${flightdetails.reservaton_capacity}' />" name="reservaton_capacity">
  </div>
  <button type="submit" class="btn btn-primary" name="sub">Submit</button>
  </form>
        </div>
     
<footer>
  <p>Copyright &copy; XYZ All Rights Reserved Air Flight Ltd.</p>
</footer>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>