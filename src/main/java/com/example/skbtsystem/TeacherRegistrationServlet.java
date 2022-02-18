package com.example.skbtsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "TeacherRegistrationServlet", value = "/TeacherRegistrationServlet")
public class TeacherRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try{
            String tcName = request.getParameter("teacherName");
            String tcPhone = request.getParameter("teacherPhone");
            String tcEmail = request.getParameter("teacherEmail");
            String tcPass = request.getParameter("teacherPass");

            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/d9pq1r2tte9jfs";
            String user = "wzhkegxdhdsbgm";
            String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99";
            Connection conn = DriverManager.getConnection(url, user, pass);

            PreparedStatement st;
            String query="insert into library_user(userid,username,userpass," +
                    "useremail,userphone,accountid) " +
                    "values(nextval('library_user_pkey'),?,?,?,?,20)";
            st = conn.prepareStatement(query);
            st.setString(1,tcName);
            st.setString(2,tcPass);
            st.setString(3,tcEmail);
            st.setString(4,tcPhone);
            int row= st.executeUpdate();

            if(row>0){
                //out.println("Success Registration");
                response.sendRedirect("TeacherRegister.jsp");
            }else{
                out.println("Failed Registration");
            }


        } catch (Exception e) {
            out.println(e);
        }

    }
}
