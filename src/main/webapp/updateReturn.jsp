<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 20/2/2022
  Time: 2:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Return Book Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: plum">
        <div>
            <a href="LibrarianDashboard.jsp" class="navbar-brand" style="color:black">Home</a>
        </div>
    </nav>
</header>
<br>
<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center">Return Details</h3>
        <hr>
        <%

            String DB_DRIVER = "org.postgresql.Driver";
            String DB_HOST = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
            String DB_USER = "wzhkegxdhdsbgm";
            String DB_PASSWORD = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";

            Connection conn ;
            Statement stat ;
            ResultSet res ;
            PreparedStatement stmt ;
            Class.forName(DB_DRIVER);
            conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
        %>
        <form action="" method="post">
            <%
                stat = conn.createStatement();
                String u = request.getParameter("u");
                String data = "select * from borrowreturninfo br join book b on br.bookId = b.bookId where borrowreturnID='"+u+"'";
//"select br.borrowreturnID, b.bookTitle, br.numberBorrow, br.borrowDate, br.returnLateDate from borrowreturninfo br join book b on br.bookId = b.bookId order by borrowreturnID where borrowreturnID='"+u+"'";
                res = stat.executeQuery(data);
                while(res.next()){
            %>
            <input type="hidden" name="borrowreturnID" value='<%=res.getString("borrowreturnID") %>'/>

            <div class="form-group">
                <label>Number of Borrow</label>
                <input type="text" class="form-control" name="numberBorrow" value='<%=res.getString("numberBorrow") %>'/>
            </div>

            <div class="form-group">
                <label>Borrow Date</label>
                <input type="date" class="form-control" name="borrowDate" value='<%=res.getString("borrowDate") %>'/>
            </div>

            <div class="form-group">
                <label>Date Should Return</label>
                <input type="date" class="form-control" name="returnDate" value='<%=res.getString("returnDate") %>'/>
            </div>

            <div class="form-group">
                <label>Return Date</label>
                <input type="date" class="form-control" name="returnLateDate" value='<%=res.getString("returnLateDate") %>'/>
            </div>


            <button type="submit" class="btn btn-warning" onclick="return confirm('Are you sure to update return record')">Update</button>
            <a href="ViewBorrow.jsp" class="btn btn-default">Back</a>
            <%
                }
            %>
        </form>
    </div></div>
</body>
</html>
<%
    String a = request.getParameter("borrowreturnID");
    String b = request.getParameter("numberBorrow");
    String c = request.getParameter("borrowDate");
    String d = request.getParameter("returnDate");
    String e = request.getParameter("returnLateDate");


    if (!(a == null && b == null && c == null && d == null && e == null))
    {
        String query = "update borrowreturninfo set numberBorrow=?,borrowDate=?, returnDate=?, returnLateDate=? where borrowreturnID='" + a + "'";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, b);
        stmt.setString(2, c);
        stmt.setString(3, d);
        stmt.setString(4, e);



        stmt.executeUpdate();
        response.sendRedirect("viewReturn.jsp");
    }

%>




