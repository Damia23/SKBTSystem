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
    String teacherEmail = request.getParameter("teacherEmail");
    String teacherPass = request.getParameter("teacherPass");
    Class.forName("org.postgresql.Driver");
    String url = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
    String user = "wzhkegxdhdsbgm";
    String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
    Connection con = DriverManager.getConnection(url, user, pass);
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from teacher where teacherEmail='" + teacherEmail + "' and teacherPass='" + teacherPass + "'");
    if (rs.next()) {
        session.setAttribute("teacherEmail",teacherEmail);
        //out.println("welcome " + teacherEmail);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("TeacherDashboard.jsp");
    } else {
        //out.println("Invalid password <a href='index.jsp'>try again</a>");
        response.sendRedirect("TeacherRegister.jsp");
    }
%>