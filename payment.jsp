<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Payment</title>
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
        width: 25%;
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
                    <a class="nav-link active" aria-current="page" href="userhome.jsp">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Blogs</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Pages</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link active" href="#">About Us</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Contact Us</a>
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
    <a class="active" href="viewflight.jsp">View Flight Details</a>
    <a class="active" href="reserveticket.jsp">Reserve Flight Tickets</a>
    <a class="active" href="printticket.jsp">View/Print Flight Tickets</a>
    <a class="active" href="cancelticket.jsp">Cancel Flight Tickets</a>
    <a href="Ulogin.jsp">Quit Session</a>
  </div>
  <div class="content">
      <p><b><h4>Please fill the payment details to confirm booking</h4></b></p>
      <form action="reservsuccess.jsp"   method="POST">
        <div class="mb-3">
        <label for="userID" class="form-label">Credit Card Number</label>
        <input type="text" class="form-control" id="userID" name="ccn">
      </div>
      <div class="mb-3">
        <label for="Validfrom" class="form-label">Valid from</label>
        <input type="date" class="form-control" id="Validfrom" name="valid_from">
      </div>
    <div class="mb-3">
    <label for="Validtill" class="form-label">Valid till</label>
    <input type="date" class="form-control" id="Validtill" name="valid_till">
    <p>
        Ticket Price : <span class="price" style="color:black"><b>$30</b></span></p>
  </div>
  <button type="submit" class="btn btn-primary" name="sub">Proceed to payment</button>
  </form>

  </div>
    <footer>
        <p>Copyright &copy; XYZ All Rights Reserved Air Flight Ltd.</p>
    </footer>
    
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    </body>
    </html>