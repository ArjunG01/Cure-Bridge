<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String alertMessage = null;
String alertType = "danger"; // default bootstrap alert color for errors

if(request.getMethod().equalsIgnoreCase("POST")){
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if(email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()){
        alertMessage = "Please enter email and password.";
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_appointment","root","@Arjun001@");
            PreparedStatement ps = con.prepareStatement("SELECT patient_id, name FROM patients WHERE email=? AND password=?");
            ps.setString(1,email);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                session.setAttribute("patientId", rs.getInt("patient_id"));
                session.setAttribute("patientName", rs.getString("name"));
                alertType = "success";
                alertMessage = "Login successful! Redirecting...";
%>
<meta http-equiv="refresh" content="2;url=patientDashboard.jsp" />
<%
            } else {
                alertMessage = "Invalid email or password.";
            }
            rs.close();
            ps.close();
            con.close();
        } catch(Exception e){
            alertMessage = "Error: " + e.getMessage();
        }
    }
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Patient Login - CureBridge</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    body {
      background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      padding: 15px;
    }
    .login-container {
      background: #fff;
      padding: 40px 30px;
      border-radius: 12px;
      box-shadow: 0 12px 25px rgba(0, 123, 255, 0.2);
      max-width: 400px;
      width: 100%;
      text-align: center;
    }
    h3 {
      color: #007bff;
      font-weight: 700;
      margin-bottom: 30px;
    }
    .form-control {
      border-radius: 8px;
      padding: 12px 15px;
      font-size: 1rem;
      border: 1.5px solid #007bff;
      transition: border-color 0.3s ease;
    }
    .form-control:focus {
      border-color: #0056b3;
      box-shadow: 0 0 8px #0056b3;
      outline: none;
    }
    button.btn-primary {
      width: 100%;
      padding: 14px;
      font-size: 1.1rem;
      border-radius: 10px;
      font-weight: 600;
      transition: background-color 0.3s ease;
      margin-bottom: 10px;
    }
    button.btn-primary:hover {
      background-color: #0056b3;
    }
    .register-link {
      color: #007bff;
      font-weight: 600;
      cursor: pointer;
      text-decoration: none;
      font-size: 1rem;
      transition: color 0.3s ease;
      display: inline-block;
      margin-top: 15px;
    }
    .register-link:hover {
      color: #0056b3;
      text-decoration: underline;
    }
    .alert {
      margin-bottom: 20px;
      font-weight: 600;
      font-size: 0.95rem;
      text-align: left;
    }
  </style>
</head>
<body>

  <div class="login-container shadow">
    <h3>Patient Login</h3>

    <% if(alertMessage != null){ %>
      <div class="alert alert-<%= alertType %> alert-dismissible fade show" role="alert">
        <%= alertMessage %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    <% } %>

    <form method="post" action="patientLogin.jsp" novalidate>
      <div class="mb-4 text-start">
        <label for="email" class="form-label">Email address</label>
        <input type="email" id="email" name="email" class="form-control" placeholder="you@example.com" required autofocus />
      </div>

      <div class="mb-4 text-start">
        <label for="password" class="form-label">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required />
      </div>

      <button type="submit" class="btn btn-primary">Login</button>
    </form>

    <a href="patientRegister.jsp" class="register-link">Register</a>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
