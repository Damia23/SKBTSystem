<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 20/2/2022
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%ResultSet resultset =null;%>

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
            border-bottom: 1px solid black;
            text-align: center;
        }
        input::placeholder {
            color: white;
        }
        option {
            background: white;
            border: none;
        }
        .metod {
            display: flex;
        }
        table, th, td {
            border:1px solid black;
        }

        .button1 {
            display: block;
            width: 200px;
            padding: 10px;
            margin: 20px auto 0;
            border: none;
            border-radius: 5px;
            background-color: white;
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

        #list {
            font-family: Arial, Helvetica, sans-serif;
            border: 2px solid black;
            border-collapse: collapse;
            width: 45%;
            margin-left: auto;
            margin-right: auto;
            text-align: center;

        }

        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            position: center;
        }

        #list tr:nth-child(even){background-color: #f2f2f2;}

        #list tr:hover {background-color: #ddd;}

        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #04AA6D;
            color: white;
            position: center;
            text-align: center;

        }

        h2{
            text-align: center;
            color: white;
        }
    </style>

</head>
<body>
<div class="main-block">
    <h1>Borrow Book Form</h1><br>
    <form action="TeacherBorrowServlet" method="post">

        <%
            try {
                //Integer bookID = Integer.valueOf(request.getParameter("bookID"));
//Class.forName("com.mysql.jdbc.Driver").newInstance();
                Class.forName("org.postgresql.Driver");
                String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
                String user = "wzhkegxdhdsbgm";
                String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
                Connection connection = DriverManager.getConnection(dbURL, user, pass);

                Statement statement = connection.createStatement();

                resultset = statement.executeQuery("select * from book");
        %>

        <div>User ID<br>
            <input type="text" name="userID">
            <br>Number of Books Borrow<br>
            <input type="text" name="numberBorrow">
        </div>
        <div>Date of Borrow Book<br>

            <input type="date" name="borrowDate">
            <br>Date of Return Book<br>
            <input type="date" name="returnDate">
            <br><label for="bookID">Choose Book:</label><br>
            <select id="bookId" name="bookId">

                <% while (resultset.next()) { %>
                <option> <%= resultset.getString("bookID")%> </option>
                <% } %>

            </select>

        </div>
        <button type="submit" class="button1">Borrow</button>
        <a href='TeacherDashboard.jsp'><button class="button2">Cancel</button></a>

        <% } finally {

        } %>
    </form>
</div>


<%
    String myText = request.getParameter("bookId");

    if(myText == null){

    }
    else{

        session.setAttribute("userID",request.getParameter("userID"));
        session.setAttribute("numberBorrow",request.getParameter("numberBorrow"));
        session.setAttribute("borrowDate",request.getParameter("borrowDate"));
        session.setAttribute("returnDate",request.getParameter("returnDate"));
        session.setAttribute("bookId",request.getParameter("bookId"));
    }
%>

<h2>SKBT BOOK LIST</h2>

<table id="list"  >
    <tr>
        <th>Book ID</th>
        <th>Book Title</th>

    </tr>
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
        String data =  "select * from book";
        res = stat.executeQuery(data);
        while(res.next()){
    %>
    <tr>
        <td><%=res.getInt("bookID")%></td>
        <td><%=res.getString("bookTitle")%></td>

    </tr>
    <% } %>
</table>
<br>
</body>
</html>