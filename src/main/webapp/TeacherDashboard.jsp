<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 25/1/2022
  Time: 9:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if ((session.getAttribute("teacherEmail") == null) || (session.getAttribute("teacherEmail") == "")) {
%>
You are not logged in<br/>
<a href="teacherLogin.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("teacherEmail")%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>
