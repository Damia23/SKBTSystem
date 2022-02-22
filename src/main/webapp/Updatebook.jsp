<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 19/2/2022
  Time: 12:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Book Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: mediumpurple">
        <div>
            <a href="LibrarianDashboard.jsp" class="navbar-brand" style="color:black">Home</a>
        </div>
    </nav>
</header>
<br>
<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center">Update Book Details</h3>
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
                String data = "select * from book where bookid='"+u+"'";
                res = stat.executeQuery(data);
                while(res.next()){
            %>
            <input type="hidden" name="bookId" value='<%=res.getString("bookId") %>'/>
            <div class="form-group">
                <label>Book Title</label>
                <input type="text" class="form-control" name="bookTitle" value='<%=res.getString("booktitle") %>'/>
            </div>

            <div class="form-group">
                <label>Publish Year</label>
                <input type="text" class="form-control" name="bookPubYear" value='<%=res.getString("bookpubyear") %>'/>
            </div>

            <div class="form-group">
                <label>Author</label>
                <input type="text" class="form-control" name="bookAuthor" value='<%=res.getString("bookauthor") %>'/>
            </div>

            <div class="form-group">
                <label>Amount</label>
                <input type="text" class="form-control" name="bookAmount" value='<%=res.getString("bookamount") %>'/>
            </div>

            <div class="form-group">
                <label>Book Publisher</label>
                <input type="text" class="form-control" name="bookPublisher" value='<%=res.getString("bookpublisher") %>'/>
            </div>

            <%
                }
            %>
            <button type="submit" class="btn btn-warning"
                    onclick="return confirm('Are you sure to update record?')">Update</button>
            <a href="ViewBook.jsp" class="btn btn-default">Back</a>
        </form>
    </div></div>
</body>
</html>
<%
    //String a = request.getParameter("bookId");
    //String b = request.getParameter("bookTitle");
    //String c = request.getParameter("bookPubYear");
    //String d = request.getParameter("bookAuthor");
    //String e = request.getParameter("bookAmount");
    //String f = request.getParameter("bookPublisher");

    int a=0, f=0, g=0;
    String b= null,c=null,d=null,e=null;
    //String b = request.getParameter("booktitle");
    //String c = request.getParameter("bookpubyear");
    //String d = request.getParameter("bookauthor");
    //String e = request.getParameter("bookpublisher");

    if( Integer.parseInt(request.getParameter("bookid"))!=0 || request.getParameter("booktitle")!=null || request.getParameter("bookpubyear")!=null
    || request.getParameter("bookauthor")!=null || request.getParameter("bookpublisher")!=null || Integer.parseInt(request.getParameter("bookamount"))!= 0
    || Integer.parseInt(request.getParameter("bookavailability"))!= 0)
    {
        a = Integer.parseInt(request.getParameter("bookid"));
        b = request.getParameter("booktitle");
        c = request.getParameter("bookpubyear");
        d = request.getParameter("bookauthor");
        e = request.getParameter("bookpublisher");
        f = Integer.parseInt(request.getParameter("bookamount"));
        g = Integer.parseInt(request.getParameter("bookavailability"));

    }

    if (a!=0 && b!=null && c!=null && d!=null && e!=null && f!=0 && g!=0)
    {
        String query = "update book set booktitle=?,bookpubyear=?,bookauthor=?, bookpublisher=?, bookamount=?, bookavailability=? where bookid='"+a+"'";
        stmt = conn.prepareStatement(query);
        stmt.setString(1,b);
        stmt.setString(2,c);
        stmt.setString(3,d);
        stmt.setString(4,e);
        stmt.setInt(5,f);
        stmt.setInt(6,g);


        stmt.executeUpdate();
        response.sendRedirect("ViewBook.jsp");
    }
%>

