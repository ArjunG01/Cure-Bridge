<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_appointment", "root", "@Arjun001@");

            String sql = "SELECT doctor_id, name, password FROM doctors WHERE email = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password");
                if (dbPassword.equals(password)) {
                    session.setAttribute("doctorId", rs.getInt("doctor_id"));
                    session.setAttribute("doctorName", rs.getString("name"));
                    response.sendRedirect("doctorDashboard.jsp");
                    return;
                } else {
%>
<script>alert("Invalid password!"); window.location.href='doctorLogin.jsp';</script>
<%
                    return;
                }
            } else {
%>
<script>alert("No user found with this email!"); window.location.href='doctorLogin.jsp';</script>
<%
                return;
            }
        } catch (Exception e) {
%>
<script>alert("Error: <%= e.getMessage().replace("\"", "\\\"") %>"); window.location.href='doctorLogin.jsp';</script>
<%
            return;
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Doctor Login - CureBridge</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    body {
      background: linear-gradient(135deg, #43cea2, #185a9d);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: 'Segoe UI', sans-serif;
    }
    .login-card {
      background-color: #fff;
      padding: 40px 30px;
      border-radius: 15px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
      max-width: 400px;
      width: 100%;
    }
    h2 {
      color: #185a9d;
      font-weight: 700;
      margin-bottom: 25px;
      text-align: center;
    }
    .form-label {
      font-weight: 600;
      color: #333;
    }
    .form-control {
      border-radius: 8px;
      padding: 12px;
      font-size: 1rem;
      border: 1.5px solid #185a9d;
      transition: border 0.3s;
    }
    .form-control:focus {
      border-color: #43cea2;
      box-shadow: 0 0 6px rgba(24, 90, 157, 0.4);
    }
    .btn-primary {
      background-color: #185a9d;
      border: none;
      padding: 12px;
      font-size: 1.1rem;
      font-weight: 600;
      border-radius: 10px;
      transition: background-color 0.3s ease;
    }
    .btn-primary:hover {
      background-color: #1570b6;
    }
    .register-link {
      margin-top: 20px;
      font-size: 0.95rem;
      text-align: center;
    }
    .register-link a {
      text-decoration: none;
      color: #185a9d;
      font-weight: 600;
    }
    .register-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="login-card">
    <h2>Doctor Login</h2>
    <form method="post" action="doctorLogin.jsp">
      <div class="mb-3">
        <label for="email" class="form-label">Email address</label>
        <input type="email" name="email" class="form-control" id="email" placeholder="doctor@example.com" required />
      </div>
      <div class="mb-4">
        <label for="password" class="form-label">Password</label>
        <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password" required />
      </div>
      <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>
    <div class="register-link mt-3">
      Not registered? <a href="doctorRegister.jsp">Register here</a>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
