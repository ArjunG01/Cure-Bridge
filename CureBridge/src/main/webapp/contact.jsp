<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact - CureBridge</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
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

        .footer {
            background-color: #198754;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 40px;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #198754;
        }

        .btn-success {
            background-color: #198754;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-success px-4">
    <a class="navbar-brand" href="#">CureBridge</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link"href="index.html">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
            <li class="nav-item"><a class="nav-link active" href="contact.jsp">Contact</a></li>
        </ul>
    </div>
</nav>

<!-- Hero -->
<div class="hero-section">
    <h1>Contact Us</h1>
    <p class="lead">We are here to assist you with any questions or concerns</p>
</div>

<!-- Main Content -->
<div class="container section-content">
    <div class="row">
        <!-- Contact Form -->
        <div class="col-md-6">
            <h4>Send us a message</h4>
            <form action="#" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Your Name *</label>
                    <input type="text" class="form-control" id="name" required placeholder="Enter your name">
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email *</label>
                    <input type="email" class="form-control" id="email" required placeholder="example@mail.com">
                </div>
                <div class="mb-3">
                    <label for="message" class="form-label">Message *</label>
                    <textarea class="form-control" id="message" rows="4" required placeholder="Type your message here..."></textarea>
                </div>
                <button type="submit" class="btn btn-success">Send Message</button>
            </form>
        </div>

        <!-- Contact Info -->
        <div class="col-md-6 mt-4 mt-md-0">
            <h4>Contact Information</h4>
            <p><strong>Address:</strong> CureBridge,India</p>
            <p><strong>Email:</strong> support@curebridge.in</p>
            <p><strong>Phone:</strong> +91 7058377969</p>
            <p><strong>Working Hours:</strong> 24 hours </p>
        </div>
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
