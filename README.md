# 🏥 CureBridge — Hospital Doctor Appointment Management System

> **Your Health, Our Priority**  
> A modern web platform connecting patients and doctors for seamless appointment booking and management.

---

## Table of Contents

- [About the Project](#about-the-project)
- [Key Features](#key-features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [UI Highlights](#ui-highlights)
- [Future Improvements](#future-improvements)
- [Contributing](#contributing)
- [License](#license)
- [Author](#author)

---

## About the Project 📖

**CureBridge** is a full-stack hospital appointment management system that allows patients to easily book doctor appointments and enables doctors to manage requests in a centralized dashboard.

The system is built using **JSP, Java Servlets, JDBC, and MySQL**, with a modern responsive UI and secure session-based authentication.

It simulates a real-world healthcare booking workflow and demonstrates full-stack development skills including database design, backend logic, and UI/UX.

---

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
    ├── patientProfile.jsp
    ├── patientLogout.jsp
    │
    ├── doctorRegister.jsp
    ├── doctorLogin.jsp
    ├── doctorDashboard.jsp
    ├── doctorProfile.jsp
    ├── logout.jsp
    │
    ├── appointment.jsp
    ├── saveAppointment.jsp
    ├── updateAppointmentStatus.jsp
    └── checkedAppointments.jsp
```

---

## Database Schema 🗄️

Database name: **hospital_appointment**

### patients

| Column | Type | Description |
|--------|------|-------------|
| patient_id | INT (PK) | Unique ID |
| name | VARCHAR | Full name |
| email | VARCHAR | Email |
| password | VARCHAR | Login password |
| phone | VARCHAR | Contact number |

### doctors

| Column | Type | Description |
|--------|------|-------------|
| doctor_id | INT (PK) | Unique ID |
| name | VARCHAR | Doctor name |
| specialty | VARCHAR | Field |
| email | VARCHAR | Email |
| password | VARCHAR | Login password |

### appointments

| Column | Type | Description |
|--------|------|-------------|
| appointment_id | INT (PK) | Unique ID |
| patient_id | INT (FK) | Linked patient |
| doctor_id | INT (FK) | Linked doctor |
| appointment_date | DATE | Date |
| appointment_time | TIME | Time |
| problem | TEXT | Description |
| status | VARCHAR | Pending / Approved / Rejected |

---

## Getting Started 🚀

### Prerequisites

- Java JDK 8+
- MySQL 8+
- Apache Tomcat
- Maven 3.6+
- IDE (Eclipse / IntelliJ)

---

### 1. Clone Repository

```bash
git clone https://github.com/ArjunG01/CureBridge.git
cd CureBridge
```

---

### 2. Create Database

Run this in MySQL:

```sql
CREATE DATABASE hospital_appointment;
USE hospital_appointment;
```

Then create the tables using the schema above.

---

### 3. Configure Database Connection

Update JDBC credentials:

```java
DriverManager.getConnection(
  "jdbc:mysql://localhost:3306/hospital_appointment",
  "your_username",
  "your_password"
);
```

---

### 4. Run Project

```bash
mvn tomcat7:run
```

Open in browser:

```
http://localhost:8080/CureBridge
```

---

## Usage 📱

| Role | URL |
|------|-----|
| Patient | `/patientLogin.jsp` |
| Doctor | `/doctorLogin.jsp` |
| Guest | `/index.html` |

### Patient Flow

1. Register → Login
2. Book appointment
3. View status in dashboard

### Doctor Flow

1. Login
2. View requests
3. Approve / Reject

---

## UI Highlights 🎨

- Glassmorphism dashboard cards
- Gradient backgrounds
- Animated appointment tables
- Background video landing page
- Floating medical icons
- Mobile-friendly layout

---

## Future Improvements 🔮

- Admin dashboard
- Email notifications
- Doctor schedule management
- Online payments
- REST API integration
- React frontend version

---

## Contributing 🤝

Contributions are welcome!

1. Fork project
2. Create branch
3. Commit changes
4. Push
5. Open pull request

---

## License 📄

This project is licensed under the MIT License.

---

## Author 👨‍💻

**Arjun Ghadage**  
Built with ❤️ to simplify healthcare appointment management.

---

⭐ If you like this project, give it a star on GitHub!
