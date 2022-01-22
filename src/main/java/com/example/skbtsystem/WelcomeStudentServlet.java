package com.example.skbtsystem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "WelcomeStudentServlet", value = "/WelcomeStudentServlet")
public class WelcomeStudentServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    @Override
    protected void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType ("text/html");
        PrintWriter out = response.getWriter ();
        String user = request.getParameter ("name");
        out.println ("</br></br>");
        out.println ("Welcome " + user);
        out.println ("</br></br>");
        out.println ("<a >Click here to Login</a>");
    }
}
