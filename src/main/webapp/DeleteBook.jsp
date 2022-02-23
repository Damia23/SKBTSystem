<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 24/1/2022
  Time: 11:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%
    String id = request.getParameter("d");


    String DB_DRIVER = "org.postgresql.Driver";
    String DB_HOST = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
    String DB_USER = "wzhkegxdhdsbgm";
    String DB_PASSWORD = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
    Connection conn ;
    Statement stat ;
    java.sql.ResultSet rest;
    Class.forName(DB_DRIVER);
    conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
    stat = conn.createStatement();
    String data =  "select * from borrowreturninfo ";
    rest = stat.executeQuery(data);
    PrintWriter pout = response.getWriter();
    while (rest.next()){

        String bi = request.getParameter("bookID");
        if(bi != id)
        {
            String DBDRIVER = "org.postgresql.Driver";
            String DBHOST = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
            String DBUSER = "wzhkegxdhdsbgm";
            String DBPASSWORD = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
            Class.forName(DBDRIVER);
            int row = 0;


            try(Connection connection = DriverManager.getConnection(DBHOST, DBUSER, DBPASSWORD)){
                PreparedStatement statement = connection.prepareStatement("delete from book where bookid = ?");
                statement.setString(1, id);
                row =statement.executeUpdate();
            }
            catch (Exception exception){

            }

            if(row == 0){
                pout.println("<script type=\"text/javascript\">");
                pout.println("alert('Book CANNOT Deleted !');");
                pout.println("location='ViewBook.jsp';");
                pout.println("</script>");
            }

            else{
                pout.println("<script type=\"text/javascript\">");
                pout.println("alert('Book Deleted !');");
                pout.println("location='ViewBook.jsp';");
                pout.println("</script>");
            }


        }
        // else {




        //}
    }
%>

