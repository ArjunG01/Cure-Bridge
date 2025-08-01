<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Doctor Profile - CureBridge</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<style>
    body {
        background-color: #f8f9fa;
    }
    .profile-container {
        max-width: 600px;
        margin: 50px auto;
        padding: 30px;
        background: white;
        border-radius: 12px;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }
    .profile-label {
        font-weight: 600;
        color: #333;
    }
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-success px-4">
    <a class="navbar-brand" href="doctorDashboard.jsp">CureBridge</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a href="doctorDashboard.jsp" class="nav-link">Dashboard</a></li>
            <li class="nav-item"><a href="logout.jsp" class="nav-link">Logout</a></li>
        </ul>
    </div>
</nav>

<div class="container profile-container">
    <h3 class="mb-4 text-center">Doctor Profile</h3>

    <%
        Integer doctorId = (Integer) session.getAttribute("doctorId");
        if (doctorId == null) {
    %>
        <div class="alert alert-warning text-center">
            Please <a href="doctorLogin.jsp">login</a> first to view your profile.
        </div>
    <%
        } else {
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_appointment", "root", "@Arjun001@");

                String sql = "SELECT name, email, contact, specialty, clinic, created_at FROM doctors WHERE doctor_id = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, doctorId);
                rs = ps.executeQuery();

                if (rs.next()) {
    %>
                    <table class="table table-bordered">
                        <tr>
                            <th class="profile-label">Full Name</th>
                            <td><%= rs.getString("name") %></td>
                        </tr>
                        <tr>
                            <th class="profile-label">Email</th>
                            <td><%= rs.getString("email") %></td>
                        </tr>
                        <tr>
                            <th class="profile-label">Contact Number</th>
                            <td><%= rs.getString("contact") %></td>
                        </tr>
                        <tr>
                            <th class="profile-label">Specialty</th>
                            <td><%= rs.getString("specialty") %></td>
                        </tr>
                        <tr>
                            <th class="profile-label">Clinic/Hospital</th>
                            <td><%= rs.getString("clinic") %></td>
                        </tr>
                        <tr>
                            <th class="profile-label">Member Since</th>
                            <td><%= rs.getTimestamp("created_at") %></td>
                        </tr>
                    </table>
    <%
                } else {
    %>
                    <div class="alert alert-danger text-center">
                        Profile not found.
                    </div>
    <%
                }
            } catch (Exception e) {
    %>
                <div class="alert alert-danger text-center">
                    Error: <%= e.getMessage() %>
                </div>
    <%
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) {}
                try { if (ps != null) ps.close(); } catch (Exception e) {}
                try { if (con != null) con.close(); } catch (Exception e) {}
            }
        }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
