<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Doctor Dashboard - CureBridge</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<%
    // Session check at the top — must be pure Java code block
    Integer doctorId = (Integer) session.getAttribute("doctorId");
    if (doctorId == null) {
        response.sendRedirect("doctorLogin.jsp");
        return; // Stop further execution
    }
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-success px-4">
    <a class="navbar-brand" href="#">CureBridge</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a href="doctorProfile.jsp" class="nav-link">Profile</a></li>
            <li class="nav-item"><a href="logout.jsp" class="nav-link">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container mt-4">
    <h2>Welcome Dr. <b><%= session.getAttribute("doctorName") != null ? session.getAttribute("doctorName") : "Guest" %></b></h2>
    <h4>Today's Appointments</h4>

    <table class="table table-bordered mt-3">
        <thead>
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

            // doctorId is already retrieved above and checked
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_appointment", "root", "@Arjun001@");

                String sql = "SELECT a.appointment_id, a.appointment_date, a.appointment_time, a.problem, a.status, p.name AS patient_name " +
                             "FROM appointments a JOIN patients p ON a.patient_id = p.patient_id " +
                             "WHERE a.doctor_id = ? AND a.appointment_date = CURDATE()";

                ps = con.prepareStatement(sql);
                ps.setInt(1, doctorId);
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
                        <%
                            String status = rs.getString("status");
                            if ("Pending".equalsIgnoreCase(status)) {
                        %>
                            <form action="updateAppointmentStatus.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="appointmentId" value="<%= rs.getInt("appointment_id") %>" />
                                <button type="submit" name="action" value="Approved" class="btn btn-sm btn-success">Approve</button>
                                <button type="submit" name="action" value="Rejected" class="btn btn-sm btn-danger">Reject</button>
                            </form>
                        <%
                            } else {
                                out.print(status);
                            }
                        %>
                        </td>
                    </tr>
        <%
                }
                if (!found) {
                    out.println("<tr><td colspan='6' class='text-center'>No appointments found for today.</td></tr>");
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='6' class='text-danger text-center'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) {}
                try { if (ps != null) ps.close(); } catch (Exception e) {}
                try { if (con != null) con.close(); } catch (Exception e) {}
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
