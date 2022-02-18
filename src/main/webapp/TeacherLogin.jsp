<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 25/1/2022
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String useremail = request.getParameter("useremail");
    String userpass = request.getParameter("userpass");
    Class.forName("org.postgresql.Driver");
    String url = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
    String user = "wzhkegxdhdsbgm";
    String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
    Connection conn ;
    Statement stat ;
    ResultSet res ;
    conn = DriverManager.getConnection(url, user, pass);
    stat = conn.createStatement();
    String data = "select * from library_user where useremail='"+ useremail +"' and userpass='"+ userpass +"'";
    res = stat.executeQuery(data);
    if (res.next()) {
        int teacherID = res.getInt("accountid");
        if(teacherID == 2)
        {
            session.setAttribute("useremail", useremail);
            //out.println("welcome " + teacherEmail);
            //out.println("<a href='logout.jsp'>Log out</a>");
            response.sendRedirect("TeacherDashboard.jsp");
        } else
        {
            response.sendRedirect("TeacherRegister.jsp");
        }
    } else {
        //out.println("Invalid password <a href='index.jsp'>try again</a>");
        response.sendRedirect("TeacherRegister.jsp");
    }
%>
