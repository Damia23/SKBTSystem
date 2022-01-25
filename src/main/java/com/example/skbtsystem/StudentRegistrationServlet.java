package com.example.skbtsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "StudentRegistrationServlet", value = "/StudentRegistrationServlet")
public class StudentRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try{
            String studName = request.getParameter("studentName");
            String studPhone = request.getParameter("studentPhone");
            String studEmail = request.getParameter("studentEmail");
            String studPass = request.getParameter("studentPass");

            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
            String user = "wzhkegxdhdsbgm";
            String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
            Connection conn = DriverManager.getConnection(url, user, pass);

            PreparedStatement st;
            String query="insert into student(studentName,studentPhone,studentEmail,studentPass) values(?,?,?,?)";
            st = conn.prepareStatement(query);
            st.setString(1,studName);
            st.setString(2,studPhone);
            st.setString(3,studEmail);
            st.setString(4,studPass);
            int row = st.executeUpdate();

            if (row>0)
            {
                out.println("Success");
            }else{
                out.println("Failed");
            }


        } catch (Exception e) {
            out.println(e);
        }

    }
}
