<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        body{
            background-image: url('Airplanesignup.jpg');
            background-size: cover;
        }
        form{
            background-color: lavender;
            margin-top: 6em;
            margin-left: 25em;
            margin-right: 10em;
            margin-bottom: 5em;
            padding: 30px;
            box-shadow: 10px 10px 8px #888888;
        }
        form h1{
          text-align: center;
          color: blueviolet;
          font-family: fantasy;
        }
        form h2{
            margin-left: 5em;
            color: black;
            font-family: 'Times New Roman', Times, serif;
            font-weight: bolder;
            
        }
        form h3{
        	font-family:'Times New Roman', Times, serif;
        	padding : 10px;
        	font-weight: bolder;
        	color: Green;
        }
    </style>
    <title>User Registration</title>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    <div class="container">
    <form action="UserRegistration.java" method="post">
        <h1>XYZ Flight Ltd.</h1>
        <h2>USER RESGISTRATION</h2>
    <div class="mb-3">
    <label for="exampleInputFirstName" class="form-label">First Name</label>
    <input type="text" class="form-control" id="exampleInputFirstName" name="fname" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputLastName" class="form-label">Last Name</label>
    <input type="text" class="form-control" id="exampleInputLastName" name="lname" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputAge" class="form-label">Date of birth</label>
    <input type="date" class="form-control" id="exampleInputAge" name="dob" required>
  </div>
  <div class="mb-3">
    <label for="exampleSelectGender" class="form-label">Your Gender</label>
    <select class="form-select" required aria-label="Default select example" id="exampleSelectGender" name="gender" required>
        <option value="">Please select your Gender </option>
        <option value="1">Male</option>
        <option value="2">Female</option>
        <option value="3">Other</option>
      </select>
    </div>
    <div class="mb-3">
    <label for="exampleInputUsername" class="form-label">Username</label>
    <input type="text" class="form-control" id="exampleInputUsername" name="uname" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="password" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputAddress" class="form-label">Address</label>
    <textarea class="form-control" id="exampleInputAddress" style="height: 100px" name="address" required></textarea>
  </div>
  <div class="mb-3">
    <label for="exampleInputPhoneNumber" class="form-label">Phone Number</label>
    <input type="text" class="form-control" id="exampleInputPhoneNumber" name="phoneNo" required>
  </div>
  
  <button type="submit" class="btn btn-primary">Submit</button>
  <br>
  Already a member? <a href="Ulogin.jsp">Log in</a>
     <br>
  <h3>Your account has been Created Successfully</h3>
</form>
</div>
</body>
</html>