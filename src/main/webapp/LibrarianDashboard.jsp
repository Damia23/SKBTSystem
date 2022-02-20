<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 9/1/2022
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if ((session.getAttribute("librarianEmail") == null) || (session.getAttribute("librarianEmail") == "")) {
%>

<%} else {
%>

<%
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Librarian Dashboard</title>
    <link rel="stylesheet" type="text/css" href="slide navbar style.css">
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
</head>
<style>
    body{
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        font-family: 'Jost', sans-serif;
        background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
    }
    .main{
        width: 95%;
        height: 700px;
        background: red;
        overflow: hidden;
        background: url("https://doc-08-2c-docs.googleusercontent.com/docs/securesc/68c90smiglihng9534mvqmq1946dmis5/fo0picsp1nhiucmc0l25s29respgpr4j/1631524275000/03522360960922298374/03522360960922298374/1Sx0jhdpEpnNIydS4rnN4kHSJtU1EyWka?e=view&authuser=0&nonce=gcrocepgbb17m&user=03522360960922298374&hash=tfhgbs86ka6divo3llbvp93mg4csvb38") no-repeat center/ cover;
        border-radius: 30px;
        box-shadow: 5px 20px 50px #000;
    }

    label{
        color: #fff;
        font-size: 2.3em;
        justify-content: center;
        display: flex;
        margin: 50px;
        font-weight: bold;
    }

    label2{
        color: mediumpurple;
        font-size: 1.3em;
        justify-content: center;
        display: flex;
        margin: 50px;
        font-weight: bold;
    }

    h1{
        text-align: center;
        color: white;
    }

    h2{
        text-align: center;
        color: mediumpurple;
        font-size: 1.3em;
    }

    button{
        width: 30%;
        height: 40px;
        margin: 10px auto;
        justify-content: center;
        display: block;
        color: #fff;
        background: #573b8a;
        font-size: 1em;
        font-weight: bold;
        margin-top: 20px;
        outline: none;
        border: none;
        border-radius: 5px;
        transition: .2s ease-in;
        cursor: pointer;
    }


    button:hover{
        background: #6d44b8;
    }

    header ul
    {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    header ul li
    {
        list-style: none;
        margin-left: 20px;
        font-size: 25px
    }

    header ul li a
    {
        text-decoration: none;
        padding: 6px 15px;
        color: #fff;
        border-radius: 20px;
    }

    header ul li a:hover
    {
        background: #fff;
        color: #2b1055;
    }

    header
    {
        position: absolute;
        top: 0;
        left: 0;
        width: 80%;
        padding: 30px 100px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        z-index: 10000;
    }

    header .logo
    {
        color: #fff;
        font-weight: 700;
        text-decoration: none;
        font-size: 2em;
        text-transform: uppercase;
        letter-spacing: 2px;
    }

</style>
<body>

<header>
    <a href="#" class="logo">SKBT</a>
    <ul>
        <li><a href="LibrarianLogout.jsp">Logout</a></li>
    </ul>
</header>

<%
    String DB_DRIVER = "org.postgresql.Driver";
    String DB_HOST = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
    String DB_USER = "wzhkegxdhdsbgm";
    String DB_PASSWORD = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
    Connection conn ;
    Statement stat ;
    ResultSet res ;
    Class.forName(DB_DRIVER);
    conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
    stat = conn.createStatement();
    String data = "select * from library_user where useremail =  '"+session.getAttribute("useremail")+"'";
    res = stat.executeQuery(data);
    while(res.next()){
%>

<div class="main">
    <label>Hello, Admin (<%=session.getAttribute("useremail")%>!)</label>
    <h1> Here's Your Details:</h1>
    <h2>Name : <%=res.getString("username")%></h2>
    <h2>Your ID : <%=res.getString("userid")%></h2>
    <%
        }
    %>
    <label2>You have the authority to manage the library operations</label2>
    <a href="ViewBook.jsp"><button>Book List</button></a>
    <a href="LibrarianBorrow.jsp"><button>Borrow Book Form</button></a>
    <a href="ManageFine.jsp"><button>Fine</button></a>
    <a href="ViewBorrow.jsp"><button>Borrow List</button></a>
    <a href="viewReturn.jsp"><button>Return List</button></a>
    <a href="viewUser.jsp"><button>User List</button></a>

</div>
</body>
</html>

