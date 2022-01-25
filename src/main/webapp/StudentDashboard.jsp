<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 25/1/2022
  Time: 9:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if ((session.getAttribute("studentEmail") == null) || (session.getAttribute("studentEmail") == "")) {
%>
You are not logged in<br/>
<a href="studentLogin.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("studentEmail")%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>
