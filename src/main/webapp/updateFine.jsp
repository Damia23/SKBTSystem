<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 21/2/2022
  Time: 3:59 AM
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
            <a href="index.jsp" class="navbar-brand" style="color:black"> Update Fine </a>
        </div>
    </nav>
</header>
<br>
<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center">Fine Details</h3>
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
                String data = "select * from borrowreturninfo br join book b on br.bookid = b.bookid join library_user us on br.userid = us.userid where borrowreturnid='"+ u +"'";
                res = stat.executeQuery(data);
                while(res.next()){
            %>
            <input type="hidden" name="borrowreturnid" value='<%=res.getString("borrowreturnid") %>'/>


            <div class="form-group">
                <label>User ID</label>
                <input id="userid" type="text" class="form-control" name="userid" readonly value='<%=res.getString("userid") %>'/>
            </div>

            <div class="form-group">
                <label>User Name</label>
                <input id="username" type="text" class="form-control" name="username" readonly value='<%=res.getString("username") %>'/>
            </div>

            <div class="form-group">
                <label>Book ID</label>
                <input id="bookid" type="text" class="form-control" name="bookid" readonly value='<%=res.getString("bookid") %>'/>
            </div>

            <div class="form-group">
                <label>Book Title</label>
                <input id="booktitle" type="text" class="form-control" name="booktitle" readonly value='<%=res.getString("booktitle") %>'/>
            </div>

            <div class="form-group">
                <label>Date Should Return</label>
                <input id="returndate" type="date" class="form-control" name="returndate" readonly value='<%=res.getString("returndate") %>'/>
            </div>

            <div class="form-group">
                <label>Return Date</label>
                <input id="returnlatedate" type="date" class="form-control" name="returnlatedate" value='<%=res.getString("returnlatedate") %>'/>
            </div>

            <div class="form-group">
                <label>Fine Amount</label>
                <input id="fineamount" class="form-control" name="fineamount" type="text" required>
            </div>




            <button type="submit" class="button1">Submit</button>
            <a href="ViewBorrow.jsp" class="btn btn-default">Back</a>
            <%
                }
            %>
        </form>

            <%
        Integer a = Integer.parseInt(request.getParameter("fineamount"));
        Integer b = Integer.parseInt(request.getParameter("userid"));
        Integer c = Integer.parseInt(request.getParameter("borrowreturnid"));
        Integer d = Integer.parseInt(request.getParameter("bookid"));


     if (a != null && b != null && c != null && d != null  )
     {
            String query = "insert into fine( fineid, fineamount, userid, borrowreturnid, bookid) values (nextval('fine_fineid_seq') ,?,?,?,?)";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, a);
            stmt.setInt(2, b);
            stmt.setInt(3, c);
            stmt.setInt(4, d);



            stmt.executeUpdate();

            response.sendRedirect("ManageFine.jsp");
    }

%>


</body>
</html>


