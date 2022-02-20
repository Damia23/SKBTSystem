package com.example.skbtsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "TeacherBorrowServlet", value = "/TeacherBorrowServlet")
public class TeacherBorrowServlet extends HttpServlet {

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
            String returnLateDate = request.getParameter("returnlatedate");
            Integer bookId = Integer.valueOf(request.getParameter ("bookId"));

            Class.forName("org.postgresql.Driver");
            String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
            String user = "wzhkegxdhdsbgm";
            String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            PreparedStatement st;
            String query="insert into borrowreturninfo( borrowreturnID,numberBorrow,borrowDate,returnDate,returnlatedate, userid, bookId)" +
                    " values( default ,?,?,?,?,?,?)";
            st = conn.prepareStatement(query);

            st.setInt(1,numberBorrow);
            st.setString(2,borrowDate);
            st.setString(3,returnDate);
            st.setString(4,returnLateDate);
            st.setInt(5,userID);
            st.setInt(6,bookId);


            int row= st.executeUpdate();

            if(row>0){
                out.println("Record inserted");
                out.println("<html><body> <br/><br/>");
            }else{
                out.println("Record failed");
            }

        }catch(Exception e){
            out.println(e);
        }
    }

    }
