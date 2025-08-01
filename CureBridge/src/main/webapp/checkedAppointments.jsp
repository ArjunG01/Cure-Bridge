<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%
    // Session validation
    Integer doctorId = (Integer) session.getAttribute("doctorId");
    String doctorName = (String) session.getAttribute("doctorName");

    if (doctorId == null || doctorName == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Doctor Dashboard - CureBridge</title>   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-success px-4">
    <a class="navbar-brand" href="#">CureBridge</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a href="doctorDashboard.jsp" class="nav-link active">Dashboard</a></li>
            <li class="nav-item"><a href="doctorProfile.jsp" class="nav-link">Profile</a></li>
            <li class="nav-item"><a href="logout.jsp" class="nav-link">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container mt-4">
    <h2>Welcome Dr. <b><%= doctorName %></b></h2>
    <h4 class="mb-4">Today's Appointments</h4>

    <table class="table table-bordered table-striped">
        <thead class="table-success">
            <tr>
                <th>Patient</th>
                <th>Date</th>
                <th>Time</th>
                <th>Problem</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_appointment", "root", "@Arjun001@");

                // Get today's date as java.sql.Date
                java.util.Date today = new java.util.Date();
                java.sql.Date sqlToday = new java.sql.Date(today.getTime());

                String sql = "SELECT a.appointment_id, a.appointment_date, a.appointment_time, a.problem, a.status, " +
                             "p.name AS patient_name " +
                             "FROM appointments a " +
                             "JOIN patients p ON a.patient_id = p.patient_id " +
                             "WHERE a.doctor_id = ? AND a.appointment_date = ? " +
                             "ORDER BY a.appointment_time";

                ps = con.prepareStatement(sql);
                ps.setInt(1, doctorId);
                ps.setDate(2, sqlToday);
                rs = ps.executeQuery();

                boolean found = false;

                while (rs.next()) {
                    found = true;
        %>
                    <tr>
                        <td><%= rs.getString("patient_name") %></td>
                        <td><%= rs.getDate("appointment_date") %></td>
                        <td><%= rs.getTime("appointment_time") %></td>
                        <td><%= rs.getString("problem") %></td>
                        <td><%= rs.getString("status") %></td>
                        <td>
                            <a href="approveAppointment.jsp?id=<%= rs.getInt("appointment_id") %>" class="btn btn-sm btn-success">Approve</a>
                            <a href="rejectAppointment.jsp?id=<%= rs.getInt("appointment_id") %>" class="btn btn-sm btn-danger">Reject</a>
                        </td>
                    </tr>
        <%
                }

                if (!found) {
        %>
                    <tr><td colspan="6" class="text-center">No appointments found for today.</td></tr>
        <%
                }

            } catch (Exception e) {
        %>
                <tr><td colspan="6" class="text-danger text-center">Error: <%= e.getMessage() %></td></tr>
        <%
                e.printStackTrace();
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) {}
                try { if (ps != null) ps.close(); } catch (Exception e) {}
                try { if (con != null) con.close(); } catch (Exception e) {}
            }
        %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
