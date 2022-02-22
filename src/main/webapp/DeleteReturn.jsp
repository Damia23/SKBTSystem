<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 23/2/2022
  Time: 5:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String id = request.getParameter("d");
    PrintWriter pout = response.getWriter();
    String DB_DRIVER = "org.postgresql.Driver";
    String DB_HOST = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
    String DB_USER = "wzhkegxdhdsbgm";
    String DB_PASSWORD = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
    Class.forName(DB_DRIVER);
    Connection conn = DriverManager.getConnection(DB_HOST,DB_USER,DB_PASSWORD);
    Statement stat = conn.createStatement();
    stat.executeUpdate("delete from borrowreturninfo where borrowreturnid = '"+ id +"'");
    pout.println("<script type=\"text/javascript\">");
    pout.println("alert('Delete Success!');");
    pout.println("location='viewReturn.jsp';");
    pout.println("</script>");
    //response.sendRedirect("viewBorrow.jsp");
%>