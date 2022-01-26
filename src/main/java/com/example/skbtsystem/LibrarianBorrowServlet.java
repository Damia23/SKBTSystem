package com.example.skbtsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
            Integer bookid = Integer.valueOf(request.getParameter("bookID"));
            Integer librarianid = Integer.valueOf(request.getParameter("librarianID"));
            Integer numberborrow = Integer.valueOf(request.getParameter("numberBorrow"));
            String borrowdate = request.getParameter("borrowDate");
            String returndate = request.getParameter ("returnDate");

            Class.forName("org.postgresql.Driver");
            String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
            String user = "wzhkegxdhdsbgm";
            String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            PreparedStatement st;
            String query="insert into borrowreturninfo(borrowid,numberborrow,borrowdate,returndate,librarianid,bookid) values(nextval('borrowreturninfo_borrowid_seq'),?,?,?,?,?)";
            st = conn.prepareStatement(query);
            st.setInt(1,numberborrow);
            st.setString(2,borrowdate);
            st.setString(3,returndate);
            st.setInt(4,librarianid);
            st.setInt(5,bookid);
            int row= st.executeUpdate();

            if(row>0){
                out.println("Record inserted");
            }else{
                out.println("Record failed");
            }

        }catch(Exception e){
            out.println(e);
        }

    }

}
