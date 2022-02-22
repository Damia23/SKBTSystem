<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 23/2/2022
  Time: 12:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String DB_DRIVER = "org.postgresql.Driver";
    String DB_HOST = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
    String DB_USER = "wzhkegxdhdsbgm";
    String DB_PASSWORD = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
    Connection conn ;
    Statement stat ;
    ResultSet res ;
    Class.forName(DB_DRIVER);
    conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
    stat = conn.createStatement();
    String data =  "select * from library_user where useremail = '"+session.getAttribute("useremail")+"'";
    res = stat.executeQuery(data);
    while(res.next()){

        Integer userID = res.getInt("userid");
        Integer bookId = Integer.valueOf(request.getParameter ("g"));
        String returnlatedate = request.getParameter("returnLatedate");
        PrintWriter pout = response.getWriter();

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
        String dataaa =  "select * from book where bookid = '"+bookId+"'";
        resti = state.executeQuery(dataaa);
        while (resti.next()) {
            int b = resti.getInt("bookavailability");
            if (b !=0) {
                Class.forName("org.postgresql.Driver");
                String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
                String user =  "wzhkegxdhdsbgm";
                String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
                Connection connection = DriverManager.getConnection(dbURL, user, pass);

                //Date returnDate ;
                Calendar c = Calendar.getInstance(); //returnDate
                c.add(Calendar.DATE, 7);
                c.getTime();

                Calendar c1 = Calendar.getInstance();// borrowDate
                c1.getTime();

                java.sql.PreparedStatement st;
                String query = "insert into borrowreturninfo(borrowreturnid,borrowdate,returndate,userid,bookid,returnlatedate)" +
                        " values(nextval('borrowreturninfo_borrowid_seq'),?,?,?,?,?)";
                st = connection.prepareStatement(query);

                st.setString(1, String.valueOf(c1.getTime()));
                st.setString(2, String.valueOf(c.getTime()));
                st.setInt(3, userID);
                st.setInt(4, bookId);
                st.setString(5, returnlatedate);

                int row = st.executeUpdate();

                if (row > 0) {
                    pout.println("<script type=\"text/javascript\">");
                    pout.println("alert('Borrow Success!');");
                    pout.println("location='ViewBookStudentTeacher2.jsp';");
                    pout.println("</script>");

                } else {

                }

                Class.forName("org.postgresql.Driver");
                String db_URL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
                String db_user = "wzhkegxdhdsbgm";
                String db_pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
                Connection connection2 = DriverManager.getConnection(db_URL, db_user, db_pass);
                java.sql.PreparedStatement sta;
                String bestie = "update book set bookAvailability = bookAvailability - 1  where bookID = '" + bookId + "'";
                sta = connection2.prepareStatement(bestie);
                sta.executeUpdate();

            }else{
                pout.println("<script type=\"text/javascript\">");
                pout.println("alert('Book Borrow Error! No book available!');");
                pout.println("location='ViewBookStudentTeacher2.jsp';");
                pout.println("</script>");
            }
        }
    }
%>
