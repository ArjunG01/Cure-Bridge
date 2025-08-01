<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About - CureBridge</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
        }

        .hero-section {
            background: linear-gradient(to right, #198754, #28a745);
            color: white;
            padding: 60px 20px;
            text-align: center;
        }

        .section-content {
            padding: 40px 20px;
        }

        .section-content h3 {
            color: #198754;
        }

        .highlight {
            color: #28a745;
            font-weight: 600;
        }

        .footer {
            background-color: #198754;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success px-4">
    <a class="navbar-brand" href="#">CureBridge</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
            <li class="nav-item"><a class="nav-link active" href="about.jsp">About</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
            
        </ul>
    </div>
</nav>

<!-- Hero Section -->
<div class="hero-section">
    <h1>About CureBridge</h1>
    <p class="lead">Your trusted bridge to quality healthcare and expert doctors</p>
</div>

<!-- Main Content -->
<div class="container section-content">
    <div class="row">
        <div class="col-md-6">
            <h3>Who We Are</h3>
            <p>
                <span class="highlight">CureBridge</span> is a smart and efficient doctor appointment system built to streamline the patient-doctor connection. 
                Whether it's scheduling appointments, managing profiles, or accessing vital information — CureBridge simplifies it all.
            </p>
        </div>
        <div class="col-md-6">
            <h3>What We Offer</h3>
            <ul>
                <li>Secure registration for patients and doctors</li>
                <li>Easy appointment booking & real-time scheduling</li>
                <li>Doctor dashboards for managing daily consultations</li>
                <li>Clean UI with modern, responsive design</li>
            </ul>
        </div>
    </div>

    <div class="mt-5">
        <h3>Our Mission</h3>
        <p>
            To bridge the gap between healthcare providers and patients by providing a seamless, user-friendly, and efficient online platform.
            We aim to enhance healthcare accessibility and convenience for everyone.
        </p>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 CureBridge. All rights reserved.
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
