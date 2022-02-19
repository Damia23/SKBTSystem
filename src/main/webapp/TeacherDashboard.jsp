<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 25/1/2022
  Time: 9:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if ((session.getAttribute("teacherEmail") == null) || (session.getAttribute("teacherEmail") == "")) {
%>

<%} else {
%>
<%
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Teacher Dashboard</title>
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
        height: 600px;
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

</style>
<body>
<div class="main">
    <label>Hello, <%=session.getAttribute("useremail")%>!</label>
    <label2>You can borrow and return book at your fingertips!</label2>
    <a href="ViewBookStudentTeacher.jsp"><button>View Book</button></a>
    <a href="TeacherBorrow.jsp"><button>Borrow Book</button></a>
    <a href='TeacherLogout.jsp'><button>Log out</button></a>
</div>
</body>
</html>
