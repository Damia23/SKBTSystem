<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 19/2/2022
  Time: 1:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>User View</title>


<body style="background-color:whitesmoke">
</body>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: plum">
        <div style="text-align: center;">
            <a href="LibrarianDashboard.jsp">Home</a>
        </div>
    </nav>
</header>
<br>

<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center" style="color:black">List of Library User</h3>
        <hr>


        <p></p>
        <table class="table table-bordered table-striped table-hover">
            <thead>

            <tr>
                <th class="text-center" style="color:black">User ID</th>
                <th class="text-center" style="color:black">User Name</th>
                <th class="text-center" style="color:black">User Password</th>
                <th class="text-center" style="color:black">User Email</th>
                <th class="text-center" style="color:black">User Phone</th>
                <th class="text-center" style="color:black">Role name</th>
                <th class="text-center" style="color:black">Authorize By:</th>

            </tr>
            </thead>
            <tbody>
            <%
                String DB_DRIVER = "org.postgresql.Driver";
                String DB_HOST = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
                String DB_USER = "wzhkegxdhdsbgm";
                String DB_PASSWORD ="2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
                Connection conn ;
                Statement stat ;
                ResultSet res ;
                Class.forName(DB_DRIVER);
                conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
                stat = conn.createStatement();
                String data = "select * from account r join library_user lu " +
                        "on r.accountid = lu.accountid order by userid";
                res = stat.executeQuery(data);
                while(res.next()){
            %>
            <tr>
                <td style="color:black"><%=res.getString("userid")%></td>
                <td style="color:black"><%=res.getString("username")%></td>
                <td style="color:black"><%=res.getString("userpass")%></td>
                <td style="color:black"><%=res.getString("useremail")%></td>
                <td style="color:black"><%=res.getString("userphone")%></td>
                <td style="color:black"><%=res.getString("accountname")%></td>

            </tr>

            <%
                }
            %>

            </tbody>

        </table>
    </div>
</div>
</body>
</html>
