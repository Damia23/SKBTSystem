<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 20/2/2022
  Time: 2:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<html>
<head>
  <title>Book Return Directories</title>


<body style="background-color:whitesmoke">
</body>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
<header>
  <nav class="navbar navbar-expand-md navbar-dark" style="background-color: mediumpurple">
    <div style="text-align: center;">
      <a href="LibrarianDashboard.jsp" class="navbar-brand" style="color:black">Home</a>
    </div>
  </nav>
</header>
<br>

<div class="row">
  <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

  <div class="container">
    <h3 class="text-center" style="color:black">List of Books Return</h3>
    <hr>

    <div class="col-md-6">
      <a href=# style="color: mediumpurple">Return List</a>
    </div>


    <p></p>
    <table class="table table-bordered table-striped table-hover">
      <thead>

      <tr>
        <th class="text-center" style="color:black">Borrow Return ID</th>
        <th class="text-center" style="color:black">Name</th>
        <th class="text-center" style="color:black">Book Title</th>
        <th class="text-center" style="color:black">Borrow Date</th>
        <th class="text-center" style="color:black">Date Should Return</th>
        <th class="text-center" style="color:black">Date Returned</th>

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
        String data = "select * from borrowreturninfo br join book b on br.bookId = b.bookId join library_user li on br.userid = li.userid";
        res = stat.executeQuery(data);
        while(res.next()){
      %>
      <tr>
        <td style="color:black"><%=res.getString("borrowreturnid")%></td>
        <td style="color:black"><%=res.getString("username")%></td>
        <td style="color:black"><%=res.getString("booktitle")%></td>
        <td style="color:black"><%=res.getString("borrowdate")%></td>
        <td style="color:black"><%=res.getString("returndate")%></td>
        <td style="color:black"><%=res.getString("returnlatedate")%></td>

        <td class="text-center">
          <a href='updateFine.jsp?u=<%=res.getString("borrowreturnid")%>' class="btn btn-success" onclick="return confirm('Are you sure to manage fine ')">Fine</a>
          <a href='DeleteBorrow.jsp?d=<%=res.getString("borrowreturnid")%>' class="btn btn-danger" onclick="return confirm('Are you sure to delete return record ')">Delete</a>
        </td>
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