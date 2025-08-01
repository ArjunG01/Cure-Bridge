<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if patient is logged in
    Integer patientId = (Integer) session.getAttribute("patientId");
    if (patientId == null) {
        response.sendRedirect("patientLogin.jsp");
        return;
    }

    String name = "";
    int age = 0;
    String gender = "";
    String disease = "";
    String email = "";
    String contact = "";
    String createdAt = "";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_appointment", "root", "@Arjun001@");

        ps = con.prepareStatement("SELECT name, age, gender, disease, email, contact, created_at FROM patients WHERE patient_id = ?");
        ps.setInt(1, patientId);
        rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            age = rs.getInt("age");
            gender = rs.getString("gender");
            disease = rs.getString("disease");
            email = rs.getString("email");
            contact = rs.getString("contact");
            createdAt = rs.getString("created_at");
        } else {
            // No patient found - redirect to login
            response.sendRedirect("patientLogin.jsp");
            return;
        }
    } catch(Exception e) {
        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
    } finally {
        try { if(rs != null) rs.close(); } catch(Exception e) {}
        try { if(ps != null) ps.close(); } catch(Exception e) {}
        try { if(con != null) con.close(); } catch(Exception e) {}
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Patient Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8fafd;
            font-family: 'Segoe UI', sans-serif;
            padding: 40px 0;
        }
        .profile-container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
        }
        .profile-header {
            margin-bottom: 30px;
            text-align: center;
            color: #007bff;
        }
        .profile-row {
            margin-bottom: 15px;
        }
        .profile-label {
            font-weight: 600;
            color: #333;
        }
        .logout-btn {
            margin-top: 25px;
            width: 100%;
        }
    </style>
</head>
<body>

<div class="profile-container">
    <h2 class="profile-header">Patient Profile</h2>

    <div class="profile-row">
        <span class="profile-label">Full Name:</span> <span><%= name %></span>
    </div>
    <div class="profile-row">
        <span class="profile-label">Age:</span> <span><%= age %></span>
    </div>
    <div class="profile-row">
        <span class="profile-label">Gender:</span> <span><%= gender %></span>
    </div>
    <div class="profile-row">
        <span class="profile-label">Disease / Health Concern:</span> <span><%= (disease != null && !disease.isEmpty()) ? disease : "N/A" %></span>
    </div>
    <div class="profile-row">
        <span class="profile-label">Email:</span> <span><%= email %></span>
    </div>
    <div class="profile-row">
        <span class="profile-label">Contact Number:</span> <span><%= (contact != null && !contact.isEmpty()) ? contact : "N/A" %></span>
    </div>
    <div class="profile-row">
        <span class="profile-label">Registered On:</span> <span><%= createdAt %></span>
    </div>

    <form action="patientLogout.jsp" method="post">
        <button type="submit" class="btn btn-danger logout-btn">Logout</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
