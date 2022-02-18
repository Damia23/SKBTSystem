package com.example.skbtsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "LibrarianRegistrationServlet", value = "/LibrarianRegistrationServlet")
public class LibrarianRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try{
            String libName = request.getParameter("librarianName");
            String libPhone = request.getParameter("librarianPhone");
            String libEmail = request.getParameter("librarianEmail");
            String libPass = request.getParameter("librarianPass");

            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
            String user = "wzhkegxdhdsbgm";
            String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
            Connection con = DriverManager.getConnection(url, user, pass);

            PreparedStatement st;
            String query="insert into library_user(userid,username,userpass," +
                    "useremail,userphone,accountid) " +
                    "values(userid_req.nextval,?,?,?,?,10)";
            st = con.prepareStatement(query);
            st.setString(1,libName);
            st.setString(2,libPass);
            st.setString(3,libEmail);
            st.setString(4,libPhone);
            int row= st.executeUpdate();

            if(row>0){
                //out.println("Success Registration");
                response.sendRedirect("LibrarianLogin.jsp");
            }else{
                out.println("Failed Registration");
            }



        } catch (Exception e) {
            out.println(e);
        }

    }

    }
