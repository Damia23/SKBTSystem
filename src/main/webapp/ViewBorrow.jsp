<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 26/1/2022
  Time: 4:03 PM
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

<div class="row">
    <div class="container">
        <h3 class="text-center" style="color:black">List of Borrowers</h3>
        <hr>
        <p></p>
        <table class="table table-bordered table-striped table-hover">
            <thead>
            <tr>
                <th class="text-center" style="color:black">Borrow ID</th>
                <th class="text-center" style="color:black">Book ID</th>
                <th class="text-center" style="color:black">Librarian ID</th>
                <th class="text-center" style="color:black">Number of Books Borrowed</th>
                <th class="text-center" style="color:black">Borrow Date</th>
                <th class="text-center" style="color:black">Return Date</th>
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
                ResultSet res;
                Class.forName(DB_DRIVER);
                conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
                stat = conn.createStatement();
                String data = "select * from borrowreturninfo order by borrowdate desc";
                res = stat.executeQuery(data);
                while(res.next()){
            %>
            <tr>
                <td style="color:black"><%=res.getString("borrowid")%></td>
                <td style="color:black"><%=res.getString("bookid")%></td>
                <td style="color:black"><%=res.getString("librarianid")%></td>
                <td style="color:black"><%=res.getString("numberborrow")%></td>
                <td style="color:black"><%=res.getString("borrowdate")%></td>
                <td style="color:black"><%=res.getString("returndate")%></td>
                <td class="text-center">
                    <a href='DeleteBorrow.jsp?d=<%=res.getString("borrowid")%>' class="btn btn-danger" style="color:black" onclick="return confirm('Are you sure to delete the book?')">Delete</a>
                </td>

            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <div class="clearfix">
            <div class="hint-text">Library Management System</div>
            <ul class="pagination">
                <li class="page-item disabled">SK (Felda) Bukit Tajau</li>
            </ul>
        </div>
    </div>
</div>
</div>
</body>
</html>
