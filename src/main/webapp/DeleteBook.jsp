<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/1/2022
  Time: 11:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("bookId");
    try
    {
        Class.forName("org.postgresql.Driver");
        String url = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
        String user = "wzhkegxdhdsbgm";
        String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
        Connection conn = DriverManager.getConnection(url, user, pass);
        Statement st = conn.createStatement();
        int i = st.executeUpdate("DELETE FROM book WHERE bookid=" + id);

    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }
%>
