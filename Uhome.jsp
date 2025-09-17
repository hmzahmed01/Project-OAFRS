<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Welcome</title>
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
    .content .img{
        float: right;
    }
    .container h2{
        padding: 1px;
        font-family: cursive;
    }
    .container p{
        font-family: Verdana, Geneva, Tahoma, sans-serif;
        font-size: large;
        font-style: italic;

    }
    .content a{
            float: left;
            text-decoration: none;
            padding: 14px;
            margin-top: 10px;
            margin: 50px;
            background-color: lavender;
            color: black;
            font-weight: bold;
            border: 2px solid black;
            border-radius: 8px;
        }
        .content a:hover{
            background-color: black;
            color: violet;
            border: none;
            border-bottom: 4px solid blueviolet;
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
Welcome ${username}<br>
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
      <div class="img">
          <img src="book-flight.png">
      </div>
      <div class="container">
          <h2>Ready to Fly again?</h2><br>
          <p>XYZ is a technology company focused on empowering Indian travellers to plan, book and manage their trips across rail, air, buses and hotels. We assist travellers in making smarter travel decisions by leveraging artificial intelligence, machine learning and data science led innovations on our OTA platforms, comprising our websites and mobile applications. Our vision is to become the most customer-centric travel company, by offering the best customer experience to our users. Our focus on travel utility and customer experience for travellers in the 'next billion user' segment is driven by technology, cost-efficiency and our culture of innovation has made us India's leading travel ecosystem for the 'next billion users'. Our OTA platforms allow travellers to book flight tickets while providing travel utility tools and services developed using in-house proprietary algorithms and crowd-sourced information, including train PNR status and confirmation predictions, train seat availability alerts, train running status updates and delay predictions, flight status updates, bus running status, pricing and availability alerts, deal discovery, destination content, personalized recommendations, instant fare alerts and automated customer support services.
        </p><br>
        <p><b><i>Your Safety is our Priority</i></b><br></p>
        <p><b>Click below button to Register your Flight now!</b> </p>
      </div>
     <a href="reserveticket.jsp" role="button">Book Ticket</a>
  </div>

  <footer>
    <p>Copyright &copy; XYZ All Rights Reserved Air Flight Ltd.</p>
</footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>