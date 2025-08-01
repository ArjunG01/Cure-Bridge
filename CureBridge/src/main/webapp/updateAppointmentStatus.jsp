<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String appointmentId = request.getParameter("appointmentId");
    String action = request.getParameter("action"); // Approved or Rejected

    if (appointmentId == null || action == null || 
       !(action.equalsIgnoreCase("Approved") || action.equalsIgnoreCase("Rejected"))) {
        out.println("<script>alert('Invalid request'); window.location='doctorDashboard.jsp';</script>");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_appointment", "root", "@Arjun001@");

        PreparedStatement ps = con.prepareStatement("UPDATE appointments SET status=? WHERE appointment_id=?");
        ps.setString(1, action);
        ps.setInt(2, Integer.parseInt(appointmentId));

        int updated = ps.executeUpdate();

        if (updated > 0) {
            out.println("<script>alert('Appointment " + action + " successfully.'); window.location='doctorDashboard.jsp';</script>");
        } else {
            out.println("<script>alert('Failed to update appointment status.'); window.location='doctorDashboard.jsp';</script>");
        }

        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("<script>alert('Error: " + e.getMessage() + "'); window.location='doctorDashboard.jsp';</script>");
    }
%>
