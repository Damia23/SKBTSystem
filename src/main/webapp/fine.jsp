<%@ page import="javax.xml.transform.Result" %>
<%@ page import="java.sql.*" %>
<%@  page import= "java.text.SimpleDateFormat"%>
<%@  page import= "java.util.Date"%>
<%@ page import="java.io.PrintWriter" %>

<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 23/2/2022
  Time: 5:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PrintWriter pout = response.getWriter();
    String id = request.getParameter("u");

    String DB_DRIVER = "org.postgresql.Driver";
    String DB_HOST =  "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
    String DB_USER = "wzhkegxdhdsbgm";
    String DB_PASSWORD = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
    Class.forName(DB_DRIVER);
    Connection conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
    Statement stmt = conn.createStatement();
    String data = "select * from borrowreturninfo where borrowreturnid='"+id+"'";
    ResultSet res = stmt.executeQuery(data);

    Class.forName("org.postgresql.Driver");
    String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
    String user = "wzhkegxdhdsbgm";
    String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
    Connection connection = DriverManager.getConnection(dbURL, user, pass);
    java.sql.PreparedStatement st;

    while(res.next())
    {
        String latedate = res.getString("returnlatedate");
        String actdate = res.getString("returndate");
        Date date1= new SimpleDateFormat("dd/MM/yyyy").parse(latedate);
        Date date2= new SimpleDateFormat("dd/MM/yyyy").parse(actdate);

        Class.forName("org.postgresql.Driver");
        String db_URL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
        String us_er = "wzhkegxdhdsbgm";
        String pa_ss = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
        Connection connec = DriverManager.getConnection(db_URL, us_er, pa_ss);
        java.sql.PreparedStatement sta;

        if(date1.after(date2))
        {
            int a = 0, b = 0, c = 0;
            if (request.getParameter("userid") != null || request.getParameter("borrowreturnid") != null
                    || request.getParameter("bookid") != null) {
                a = Integer.parseInt(request.getParameter("userid"));
                b = Integer.parseInt(request.getParameter("borrowreturnid"));
                c = Integer.parseInt(request.getParameter("bookid"));
            }

            if (a != 0 && b != 0 && c != 0)
            {
                String query = "insert into fine( fineid,fineamount,userid, borrowreturnid, bookid) values (nextval('fine_fineid_seq') ,1,?,?,?)";
                sta = connec.prepareStatement(query);
                sta.setInt(1, a);
                sta.setInt(2, b);
                sta.setInt(3, c);
                int row=sta.executeUpdate();
                if (row > 0) {
                    pout.println("<script type=\"text/javascript\">");
                    pout.println("alert('Fine Paid!');");
                    pout.println("location='ManageFine.jsp';");
                    pout.println("</script>");
                    //response.sendRedirect("viewBorrow.jsp");
                } else
                {
                    response.sendRedirect("viewReturn.jsp");
                }

            }

        }
    }
%>
