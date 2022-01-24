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
        String studentName = request.getParameter("studentName");
        String studentPhone = request.getParameter("studentPhone");
        String studentEmail = request.getParameter("studentEmail");
        String studentPass = request.getParameter("studentPass");

        PrintWriter out = response.getWriter();
        out.print(studentName);
        out.print(studentPhone);
        out.print(studentEmail);
        out.print(studentPass);


}
}

