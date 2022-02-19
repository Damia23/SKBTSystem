package com.example.skbtsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "LibrarianBorrowServlet", value = "/LibrarianBorrowServlet")
public class LibrarianBorrowServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try{
            Integer userID = Integer.valueOf(request.getParameter("userID"));
            Integer numberBorrow = Integer.valueOf(request.getParameter("numberBorrow"));
            String borrowDate = request.getParameter("borrowDate");
            String returnDate = request.getParameter ("returnDate");
            String bookId = request.getParameter ("bookId");

            Class.forName("org.postgresql.Driver");
            String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
            String user = "wzhkegxdhdsbgm";
            String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            PreparedStatement st;
            String query="insert into borrowreturninfo( borrowreturnID,numberBorrow,borrowDate,returnDate,returnlatedate, userid, bookId)" +
                    " values( default ,?,?,?,?,?,?)";
            st = conn.prepareStatement(query);

            st.setInt(1,userID);
            st.setInt(2,numberBorrow);
            st.setString(3,borrowDate);
            st.setString(4,returnDate);
            st.setString(5,bookId);
            int row= st.executeUpdate();

            if(row>0){
                out.println("Record inserted");
                out.println("<html><body> <br/><br/>");
                out.println("<a href='viewBorrow.jsp'>View Borrow List</a>");
                out.println("</body></html>");
            }else{
                out.println("Record failed");
            }

        }catch(Exception e){
            out.println(e);
        }
    }
}
