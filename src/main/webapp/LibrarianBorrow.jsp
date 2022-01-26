<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 26/1/2022
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> BULOH INC BORROW BOOK FORM </title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
        body
        {
            color: #566787;
            height: 1000px;
            background-color: #ACA3BB;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }
        h1
        {
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 3px;
            font-size: 3.2em;
            line-height: 55px;
            padding-bottom: -10px;
            color: #5543ca;
            background: #5543ca;
            background: -moz-linear-gradient(left,#f4524d  0%,#5543ca 100%) !important;
            background: -webkit-linear-gradient(left,#f4524d  0%,#5543ca 100%) !important;
            background: linear-gradient(to right,#f4524d  0%,#5543ca  100%) !important;
            -webkit-background-clip: text !important;
            -webkit-text-fill-color: transparent !important;
        }
        p {color: grey;}

        .center {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 200px;
            border: 3px solid black;
        }
        html, body {
            height: 100%;
        }
        body, input, select {
            padding: 0;
            margin: 0;
            outline: none;
            font-family: Roboto, Arial, sans-serif;
            font-size: 16px;
        }
        h1, h3 {
            font-weight: 400;
        }
        h1 {
            font-size: 32px;
        }
        .main-block, .info {
            display: flex;
            flex-direction: column;
        }
        .main-block {
            justify-content: center;
            align-items: center;
            width: 100%;
            min-height: 100%;
            no-repeat: center;
            background-size: cover;
        }
        div {
            text-align: center;
            font-size: 20px;
        }
        form {
            width: 40%;
            padding: 25px;
            margin-bottom: 20px;
            background: #FFFFFF;
        }
        input, select {
            padding: 5px;
            margin-bottom: 20px;
            background: transparent;
            border: none;
            border-bottom: 1px solid #000000;
            text-align: center;
        }
        input::placeholder {
            color: #000000;
        }
        option {
            background: black;
            border: none;
        }
        .metod {
            display: flex;
        }
        .button1 {
            display: block;
            width: 200px;
            padding: 10px;
            margin: 20px auto 0;
            border: none;
            border-radius: 5px;
            background-color: #000;
            background-image: linear-gradient(125deg,#a72879,#5543ca);
            font-size: 14px;
            font-weight: 600;
            color: #fff;
        }
        .button2 {
            display: block;
            width: 200px;
            padding: 10px;
            margin: 20px auto 0;
            border: none;
            border-radius: 5px;
            background: darkred;
            font-size: 14px;
            font-weight: 600;
            color: #fff;
        }
        .button1:hover {
            background: #5543ca;
        }
        .button2:hover {
            background: #6F0000;
        }
        @media (min-width: 568px) {
            .info {
                flex-flow: row wrap;
                justify-content: space-between;
            }
            input {
                width: 46%;
            }
            input.fname {
                width: 100%;
            }
            select {
                width: 48%;
            }
        }
    </style>

</head>
<body>
<div class="main-block">
    <h1>Borrow Book Form</h1><br>
    <form action="BorrowDetailsServlet" method="post">
        <div>Book ID<br>
            <input type="text" name="bookID">
            <br>Librarian ID<br>
            <input type="text" name="librarianID">
            <br>Number of Books Borrow<br>
            <input type="text" name="numberBorrow">
        </div>
        <div>Date of Borrow Book<br>
            <input type="date" name="borrowDate">
            <br>Date of Return Book<br>
            <input type="date" name="returnDate">
        </div>
        <button type="submit" class="button1">Borrow</button>
        <button href="Welcome.jsp" class="button2">Cancel</button>
    </form>
</div>


<%
    String myText = request.getParameter("bookID");

    if(myText == null){

    }
    else{
        session.setAttribute("bookID",request.getParameter("bookID"));
        session.setAttribute("librarianID",request.getParameter("librarianID"));
        session.setAttribute("numberBorrow",request.getParameter("numberBorrow"));
        session.setAttribute("borrowDate",request.getParameter("borrowDate"));
        session.setAttribute("returnDate",request.getParameter("returnDate"));
    }
%>
</body>
</html>
