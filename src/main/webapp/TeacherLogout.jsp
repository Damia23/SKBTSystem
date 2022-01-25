<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 25/1/2022
  Time: 10:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    session.setAttribute("teacherEmail", null);
    session.invalidate();
    response.sendRedirect("TeacherLogin.jsp");
%>

