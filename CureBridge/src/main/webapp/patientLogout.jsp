<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the current session to log out the user
    if (session != null) {
        session.invalidate();
    }
    // Redirect to patient login page after logout
    response.sendRedirect("patientLogin.jsp");
%>
