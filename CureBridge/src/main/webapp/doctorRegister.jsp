<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Registration - CureBridge</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #e0f7fa, #fff);
            font-family: 'Segoe UI', sans-serif;
        }

        .register-box {
            max-width: 600px;
            margin: 50px auto;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-weight: 500;
        }

        .btn-primary {
            background-color: #1976d2;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0d47a1;
        }

        .form-control:focus {
            border-color: #1976d2;
            box-shadow: 0 0 0 0.2rem rgba(25, 118, 210, 0.25);
        }

        .back-btn {
            font-size: 14px;
            padding: 6px 12px;
        }

        .heading-border {
            border-bottom: 2px solid #1976d2;
            display: inline-block;
            padding-bottom: 5px;
        }
    </style>
</head>
<body>

<div class="register-box">
    <h3 class="text-center mb-4"><span class="heading-border">Doctor Registration</span></h3>
    <form action="doctorRegisterSave.jsp" method="post">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="Dr. John Smith" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="specialization" class="form-label">Specialization</label>
                <input type="text" class="form-control" name="specialization" id="specialization" placeholder="Cardiologist" required>
            </div>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email address</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="doctor@example.com" required>
        </div>
        <div class="mb-3">
            <label for="contact" class="form-label">Contact Number</label>
            <input type="text" class="form-control" name="contact" id="contact" placeholder="9876543210" required>
        </div>
        <div class="mb-3">
            <label for="clinic" class="form-label">Clinic/Hospital Name</label>
            <input type="text" class="form-control" name="clinic" id="clinic" placeholder="City Care Hospital" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Create Password</label>
            <input type="password" class="form-control" name="password" id="password" placeholder="Enter password" required>
        </div>
        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Re-enter password" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Register</button>
    </form>

    <div class="text-center mt-4">
        <p>Already registered? <a href="doctorLogin.jsp">Login here</a></p>
        <a href="loginChoice.jsp" class="btn btn-outline-secondary back-btn">Back</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
