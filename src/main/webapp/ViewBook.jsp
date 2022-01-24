<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/1/2022
  Time: 11:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<html>
<head>
    <title>Book Directories</title>


<body style="background-color:whitesmoke">
</body>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: plum">
        <div style="text-align: center;">
            <a href="index.jsp" class="navbar-brand" style="color:black"> SKBT Library Directories </a>
        </div>
    </nav>
</header>
<br>

<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center" style="color:black">List of Books</h3>
        <hr>

        <div class="col-md-6">
            <a href="Addbook.jsp" class="btn btn-primary">Add New Data</a>
        </div>


        <p></p>
        <table class="table table-bordered table-striped table-hover">
            <thead>

            <tr>
                <th class="text-center" style="color:black">Book ID</th>
                <th class="text-center" style="color:black">Book Title</th>
                <th class="text-center" style="color:black">Book Pub Year</th>
                <th class="text-center" style="color:black">Book Author</th>
                <th class="text-center" style="color:black">Book Amount</th>
                <th class="text-center" style="color:black">Book Publisher</th>
                <th class="text-center" style="color:black">Action</th>

            </tr>
            </thead>
            <tbody>
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
                String data = "select * from book order by bookId";
                res = stat.executeQuery(data);
                while(res.next()){
            %>
            <tr>
                <td style="color:black"><%=res.getString("bookId")%></td>
                <td style="color:black"><%=res.getString("bookTitle")%></td>
                <td style="color:black"><%=res.getString("bookPubYear")%></td>
                <td style="color:black"><%=res.getString("bookAuthor")%></td>
                <td style="color:black"><%=res.getString("bookAmount")%></td>
                <td style="color:black"><%=res.getString("bookPublisher")%></td>
                <td class="text-center">
                    <a href='Updatebook.jsp?u=<%=res.getString("bookId")%>' class="btn btn-success">Update</a>
                    <a href='?d=<%=res.getString("bookId")%>' class="btn btn-danger">Delete</a>
                </td>
            </tr>

            <%
                }
            %>

            </tbody>

        </table>
    </div>
</body>
</html>


