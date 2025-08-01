<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Patient Registration</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<style>
  body {
    background-color: #f8fafd;
    font-family: 'Segoe UI', sans-serif;
    padding: 40px 0;
  }
  .register-container {
    max-width: 550px;
    margin: auto;
    background-color: #fff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 0 12px rgba(0,0,0,0.1);
  }
  .btn-success {
    background-color: #28a745;
    border: none;
  }
  .btn-success:hover {
    background-color: #218838;
  }
</style>
</head>
<body>

<div class="register-container">
  <h3 class="text-center mb-4">Patient Registration</h3>
  <form action="patientRegisterSave.jsp" method="post">
    <div class="mb-3">
      <label for="name" class="form-label">Full Name</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="John Doe" required />
    </div>
    <div class="mb-3">
      <label for="age" class="form-label">Age</label>
      <input type="number" class="form-control" id="age" name="age" placeholder="30" required />
    </div>
    <div class="mb-3">
      <label for="gender" class="form-label">Gender</label>
      <select class="form-select" id="gender" name="gender" required>
        <option selected disabled value="">Select Gender</option>
        <option>Male</option>
        <option>Female</option>
        <option>Other</option>
      </select>
    </div>
    <div class="mb-3">
      <label for="disease" class="form-label">Disease / Health Concern</label>
      <input type="text" class="form-control" id="disease" name="disease" placeholder="e.g., Diabetes, Fever" />
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">Email Address</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="patient@example.com" required />
    </div>
    <div class="mb-3">
      <label for="contact" class="form-label">Contact Number</label>
      <input type="text" class="form-control" id="contact" name="contact" placeholder="9876543210" />
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Create Password</label>
      <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required />
    </div>
    <div class="mb-3">
      <label for="confirmPassword" class="form-label">Confirm Password</label>
      <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Re-enter password" required />
    </div>

    <button type="submit" class="btn btn-success w-100">Register</button>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
