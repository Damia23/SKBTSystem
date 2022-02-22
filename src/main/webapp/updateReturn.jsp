<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 20/2/2022
  Time: 2:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PrintWriter pout = response.getWriter();
    String id = request.getParameter("r");

    Calendar c1 = Calendar.getInstance();// borrowDate
    c1.getTime();

    Class.forName("org.postgresql.Driver");
    String db_URL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
    String db_user = "wzhkegxdhdsbgm";
    String db_pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
    Connection connection = DriverManager.getConnection(db_URL, db_user, db_pass);
    java.sql.PreparedStatement sta;
    String bestie = "update borrowreturninfo set returnlatedate=? where borrowreturnid = '"+id+"'";
    sta = connection.prepareStatement(bestie);
    sta.setString(1, String.valueOf(c1.getTime()));
    sta.executeUpdate();
    pout.println("<script type=\"text/javascript\">");
    pout.println("alert('Return Success!');");
    pout.println("location='viewReturn.jsp';");
    pout.println("</script>");

    String dbdriverr = "org.postgresql.Driver";
    String dbhostt = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
    String dbuserr = "wzhkegxdhdsbgm";
    String dbpasswordd = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
    Connection connection3 ;
    Statement state ;
    ResultSet resti ;
    Class.forName(dbdriverr);
    connection3 = DriverManager.getConnection(dbhostt, dbuserr, dbpasswordd);
    state = connection3.createStatement();
    String dataaa =  "select * from borrowreturninfo br join book b " +
            "on b.bookid = br.bookid where borrowreturnid = '"+id+"'";
    resti = state.executeQuery(dataaa);
    while (resti.next()) {
        Integer bookID = resti.getInt("bookid");
        Integer amount = resti.getInt("bookamount");
        Integer available = resti.getInt("bookavailability");

        if(available < amount) {
            Class.forName("org.postgresql.Driver");
            String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
            String dbuser = "wzhkegxdhdsbgm";
            String dbpass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
            Connection connection2 = DriverManager.getConnection(dbURL, dbuser, dbpass);
            java.sql.PreparedStatement stas;
            String bestiee = "update book set bookavailability = bookavailability + 1  where bookid = '" + bookID + "'";
            stas = connection2.prepareStatement(bestiee);
            stas.executeUpdate();
        }
    }




%>




