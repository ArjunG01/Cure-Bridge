# 🏥 CureBridge — Hospital Doctor Appointment Management System

> **Your Health, Our Priority**  
> A modern web platform connecting patients and doctors for seamless appointment booking and management.

---

## Table of Contents

- [About the Project](#about)
- [Key Features](#features)
- [Tech Stack](#tech)
- [Project Structure](#structure)
- [Database Schema](#database)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [UI Highlights](#ui)
- [Future Improvements](#future)
- [Contributing](#contributing)
- [License](#license)
- [Author](#author)

---

<a id="about"></a>
## About the Project 📖

**CureBridge** is a full-stack hospital appointment management system that allows patients to easily book doctor appointments and enables doctors to manage requests in a centralized dashboard.

The system is built using **JSP, Java Servlets, JDBC, and MySQL**, with a modern responsive UI and secure session-based authentication.

It simulates a real-world healthcare booking workflow and demonstrates full-stack development skills including database design, backend logic, and UI/UX.

---

<a id="features"></a>
## Key Features ✨

### Patient Side 👤

- Secure registration and login
- Browse doctors by specialty
- Book appointments with date, time, and problem description
- View appointment history and status:
  - Pending
  - Approved
  - Rejected
- Manage personal profile
- Logout with session handling

### Doctor Side 🩺

- Dedicated doctor login portal
- View appointment requests in dashboard
- Approve or reject bookings
- Manage profile
- Track upcoming appointments

### General Features 🌐

- Role-based authentication (Patient / Doctor)
- Session-based security
- Responsive UI
- Modern glassmorphism design
- Animated dashboard interface
- Contact & About pages
- Background video landing page

---

<a id="tech"></a>
## Tech Stack 🛠️

| Layer        | Technology |
|-------------|------------|
| Frontend    | HTML5, CSS3, Bootstrap, JSP |
| Backend     | Java (Servlets, JSP, JDBC) |
| Database    | MySQL 8.x |
| Server      | Apache Tomcat |
| Build Tool  | Apache Maven |
| Fonts/UI    | Google Fonts, Boxicons |

---

<a id="structure"></a>
## Project Structure 📁

```
CureBridge/
├── pom.xml
└── src/main/webapp/
    ├── index.html
    ├── styles.css
    ├── about.jsp
    ├── contact.jsp
    ├── loginChoice.jsp
    ├── registerChoice.jsp
    │
    ├── patientRegister.jsp
    ├── patientLogin.jsp
    ├── patientDashboard.jsp
    ├── patientProfile.
