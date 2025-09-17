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
        *{
            box-sizing: border-box;
        }
        body{
            background-image: url('planebg.png');
            background-size: cover;
        }
        .container{
            align-items: center;
        }
        .userLogin img{
            width: 30%;
            padding: 3px;
        }
        .adminLogin img{
            width: 30%;
            padding: 11px;
            margin-right: 10px;
        }
        .container a{
            text-decoration: none;
            padding: 4px;
            margin: 50px;
            background-color: lavender;
            color: black;
            font-weight: bold;
            border: 2px solid black;
            border-radius: 8px;
        }
        .container a:hover{
            background-color: black;
            color: violet;
            border: none;
            border-bottom: 4px solid blueviolet;
        }
    </style>
    <title>Select Login</title>
</head>
<body>
    <div class="container">
        <div class="userLogin">
            <div class="userimg">
                <img src="userlogin.png">
                <a href="Ulogin.jsp" role="button">User Login</a>
            </div>
        <div class="adminLogin">
            <div class="adminimg">
                <img src="adminlogin.png">
                <a href="Alogin.jsp" role="button">Admin Login</a>
            </div>
               
        </div>
    </div>
</body>
</html>