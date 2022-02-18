package com.example.skbtsystem;

import com.example.skbtsystem.AddBook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "AddbookServlet", value = "/AddbookServlet")
public class AddbookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session= request.getSession();

        int bookid = (int) session.getAttribute("bookId");
        String booktitle = (String) session.getAttribute("bookTitle");
        String bookpubyear = (String) session.getAttribute("bookPubYear");
        String bookauthor = (String) session.getAttribute("bookAuthor");
        int bookamount = (int) session.getAttribute("bookAmount");
        String bookpublisher = (String) session.getAttribute("bookPublisher");

        AddBook addbook = new AddBook (bookid,booktitle,bookpubyear,bookauthor,bookamount,bookpublisher);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String booktitle = request.getParameter("bookTitle");
            String bookpubyear = request.getParameter("bookPubYear");
            String bookauthor = request.getParameter("bookAuthor");
            int bookamount = Integer.parseInt(request.getParameter("bookAmount"));
            String bookpublisher = request.getParameter("bookPublisher");

            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
            String user = "wzhkegxdhdsbgm";
            String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
            Connection con = DriverManager.getConnection(url, user, pass);

            String query="INSERT into book (bookid,booktitle,bookauthor,bookamount,bookpublisher,bookpubyear) " +
                    "values(nextval('bookid_seq'),?,?,?,?,?)";
            PreparedStatement st;
            st = con.prepareStatement(query);
            st.setString(1,booktitle);
            st.setString(2,bookauthor);
            st.setInt(3,bookamount);
            st.setString(4,bookpublisher);
            st.setString(5,bookpubyear);
            int row= st.executeUpdate();//return no of row effected

            if(row>0){
                //out.println("Record inserted");
                response.sendRedirect("ViewBook.jsp");
            }else{
                out.println("Record failed");
            }

        }catch(Exception e){
            out.println(e);
        }


    }
    }
