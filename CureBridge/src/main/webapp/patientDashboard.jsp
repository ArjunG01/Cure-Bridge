<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Patient Dashboard - CureBridge</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary px-4">
    <a class="navbar-brand" href="#">CureBridge</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a href="appointment.jsp" class="nav-link">Book Appointment</a></li>
            <li class="nav-item"><a href="patientProfile.jsp" class="nav-link">Profile</a></li>
            <li class="nav-item"><a href="logout.jsp" class="nav-link">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container mt-4">
    <h2>Welcome, <b><%= session.getAttribute("patientName") != null ? session.getAttribute("patientName") : "Guest" %></b></h2>
    <h4>Your Upcoming Appointments</h4>

    <table class="table table-bordered mt-3">
        <thead>
            <tr>
                <th>Doctor</th>
                <th>Date</th>
                <th>Time</th>
                <th>Problem</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            Integer patientId = (Integer) session.getAttribute("patientId");

            if (patientId == null) {
                out.println("<tr><td colspan='5' class='text-center'>Please login first.</td></tr>");
            } else {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_appointment", "root", "@Arjun001@");

                    String sql = "SELECT a.appointment_date, a.appointment_time, a.problem, a.status, d.name AS doctor_name " +
                                 "FROM appointments a JOIN doctors d ON a.doctor_id = d.doctor_id " +
                                 "WHERE a.patient_id = ? AND a.appointment_date >= CURDATE() " +
                                 "ORDER BY a.appointment_date, a.appointment_time";

                    ps = con.prepareStatement(sql);
                    ps.setInt(1, patientId);
                    rs = ps.executeQuery();

                    boolean found = false;
                    while (rs.next()) {
                        found = true;
        %>
                        <tr>
                            <td><%= rs.getString("doctor_name") %></td>
                            <td><%= rs.getDate("appointment_date") %></td>
                            <td><%= rs.getTime("appointment_time") %></td>
                            <td><%= rs.getString("problem") %></td>
                            <td><%= rs.getString("status") %></td>
                        </tr>
        <%
                    }
                    if (!found) {
                        out.println("<tr><td colspan='5' class='text-center'>No upcoming appointments found.</td></tr>");
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='5' class='text-danger text-center'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    try { if (rs != null) rs.close(); } catch (Exception e) {}
                    try { if (ps != null) ps.close(); } catch (Exception e) {}
                    try { if (con != null) con.close(); } catch (Exception e) {}
                }
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
