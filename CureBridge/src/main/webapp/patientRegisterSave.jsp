<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Get form parameters
    String name = request.getParameter("name");
    String ageStr = request.getParameter("age");
    String gender = request.getParameter("gender");
    String disease = request.getParameter("disease");
    String email = request.getParameter("email");
    String contact = request.getParameter("contact");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");

    // Basic validation
    if (name == null || ageStr == null || gender == null || email == null || password == null || confirmPassword == null ||
        name.trim().isEmpty() || ageStr.trim().isEmpty() || gender.trim().isEmpty() || email.trim().isEmpty() ||
        password.trim().isEmpty() || confirmPassword.trim().isEmpty()) {
%>
        <script>
            alert("Please fill in all required fields.");
            history.back();
        </script>
<%
        return;
    }

    if (!password.equals(confirmPassword)) {
%>
        <script>
            alert("Passwords do not match.");
            history.back();
        </script>
<%
        return;
    }

    int age = 0;
    try {
        age = Integer.parseInt(ageStr);
    } catch (NumberFormatException e) {
%>
        <script>
            alert("Please enter a valid age.");
            history.back();
        </script>
<%
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_appointment", "root", "@Arjun001@");

        // Check if email already exists
        ps = con.prepareStatement("SELECT patient_id FROM patients WHERE email = ?");
        ps.setString(1, email);
        rs = ps.executeQuery();
        if (rs.next()) {
%>
            <script>
                alert("Email is already registered. Please login or use another email.");
                history.back();
            </script>
<%
            rs.close();
            return;
        }
        rs.close();
        ps.close();

        // Insert patient data
        ps = con.prepareStatement("INSERT INTO patients(name, age, gender, disease, email, contact, password) VALUES (?, ?, ?, ?, ?, ?, ?)");
        ps.setString(1, name);
        ps.setInt(2, age);
        ps.setString(3, gender);
        ps.setString(4, disease);
        ps.setString(5, email);
        ps.setString(6, contact);
        ps.setString(7, password); // In real apps, hash passwords

        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
%>
            <script>
                alert("Registration successful! Please login.");
                window.location.href = "patientLogin.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Registration failed. Please try again.");
                history.back();
            </script>
<%
        }
    } catch (Exception e) {
%>
        <script>
            alert("Error: <%= e.getMessage().replace("\"", "\\\"") %>");
            history.back();
        </script>
<%
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (con != null) con.close(); } catch (Exception e) {}
    }
%>
