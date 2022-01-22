package com.example.skbtsystem;

import com.example.skbtsystem.connection.Postgres;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;


@WebServlet(name = "StudentRegistrationServlet", value = "/StudentRegistrationServlet")
public class StudentRegistrationServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType ("text/html");
        PrintWriter out = response.getWriter ();
        String name = request.getParameter ("name");
        String password = request.getParameter ("password");
        String email = request.getParameter ("email");
        String phone = request.getParameter("phone");

        HttpSession session = request.getSession ();
        session.setAttribute ("email", email);
        try
        {
            Connection conn = Postgres.getConnection();
            PreparedStatement ps = conn.prepareStatement ("insert into student values(?,?,?,?)");
            ps.setString (1, name);
            ps.setString (2, password);
            ps.setString (3, email);
            ps.setString (4, phone);

            int i = ps.executeUpdate ();
            if (i > 0)
                out.print ("You are successfully registered...");
            request.getRequestDispatcher ("WelcomeStudentServlet").include (request, response);
        }
        catch (Exception e2)
        {
            System.out.println (e2);
        }
        out.close ();
    }

}
