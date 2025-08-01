<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login Choice - CureBridge</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(to right, #6dd5ed, #2193b0);
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .login-card {
      background: white;
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
      max-width: 400px;
      width: 100%;
    }

    .login-card h2 {
      font-weight: 600;
      color: #343a40;
      margin-bottom: 30px;
    }

    .btn-custom {
      padding: 10px 30px;
      font-size: 16px;
      font-weight: 500;
      border-radius: 10px;
      transition: 0.3s ease;
    }

    .btn-custom:hover {
      transform: scale(1.05);
    }

    .link-text {
      margin-top: 20px;
      font-size: 14px;
    }

    .link-text a {
      color: #007bff;
      text-decoration: none;
      font-weight: 500;
    }

    .link-text a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="login-card text-center">
    <h2>Login As</h2>
    <div class="d-grid gap-3">
      <a href="doctorLogin.jsp" class="btn btn-primary btn-custom">Doctor</a>
      <a href="patientLogin.jsp" class="btn btn-success btn-custom">Patient</a>
    </div>
    <p class="link-text">
      Don't have an account? <a href="registerChoice.jsp">Register here</a>
    </p>
  </div>
</body>
</html>
