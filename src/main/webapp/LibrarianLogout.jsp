<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 25/1/2022
  Time: 11:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.setAttribute("librarianEmail", null);
    session.invalidate();
    response.sendRedirect("LibrarianLogin.jsp");
%>
