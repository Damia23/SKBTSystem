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
            Date borrowDate = Date.valueOf(request.getParameter("borrowDate"));
            Date returnDate = Date.valueOf(request.getParameter ("returnDate"));
            Integer bookID = Integer.valueOf(request.getParameter("bookID"));
            Date returnLateDate = Date.valueOf(request.getParameter("returnLateDate"));

            Class.forName("org.postgresql.Driver");
            String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
            String user = "wzhkegxdhdsbgm";
            String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            PreparedStatement st;
            String query="insert into borrowreturninfo(borrowreturniD,numberborrow,borrowdate," +
                    "returndate,returnLateDate,userid,bookid) " +
                    "values(borrowreturnid_seq.nextval,?,?,?,?,?,?)";
            st = conn.prepareStatement(query);

            st.setInt(1,numberBorrow);
            st.setDate(2,borrowDate);
            st.setDate(3,returnDate);
            st.setDate(4,returnLateDate);
            st.setInt(5,userID);
            st.setInt(6,bookID);
            int row= st.executeUpdate();

            if(row>0){
                out.println("Record inserted");
                response.sendRedirect("viewBorrow.jsp");
            }else{
                out.println("Record failed");
            }

        }catch(Exception e){
            out.println(e);
        }
    }
}
