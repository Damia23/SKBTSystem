package com.example.skbtsystem;

import com.example.skbtsystem.connection.Postgres;

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
public class StudentRegistrationServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String studentName = request.getParameter("studentName");
        String studentPhone = request.getParameter("studentPhone");
        String studentEmail = request.getParameter("studentEmail");
        String studentPass = request.getParameter("studentPass");
        RequestDispatcher dispatcher = null;
        Connection conn = null;

        try
        {
            Class.forName("org.postgresql.Driver");
            String dbURL = "postgresql://postgres:system@localhost:5432/library"; //ni url dri heroku database
            String user = "wzhkegxdhdsbgm"; //ni user dri heroku database
            String pass = "2de0ec5650e40e6383f4ad61c98e44dec650a6a8f9d79fdf03efa59408d53f99"; //ni password dri heroku database
            conn = DriverManager.getConnection(dbURL, user, pass);

            PreparedStatement pst = conn.prepareStatement("insert into student(studentname, studentPass, studentEmail, studentPhone) values (?,?,?,?)");
            pst.setString(1,studentName);
            pst.setString(2,studentPhone);
            pst.setString(3,studentEmail);
            pst.setString(4,studentPass);

            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("StudentRegister.jsp");

            if (rowCount >0)
            {
                request.setAttribute("status", "success");


            }else{
                request.setAttribute("status", "failed");
            }
            dispatcher.forward(request, response);

        } catch (Exception e)
        {
            e.printStackTrace();


}finally{
        try{
            conn.close();

        } catch (SQLException e)
        {
            e.printStackTrace();
        }
}
}}

