<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Book Appointment - Simple CureBridge</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { padding: 30px; background-color: #f8f9fa; font-family: Arial, sans-serif; }
        .form-container { max-width: 600px; margin: auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 10px #ddd; }
    </style>
</head>
<body>

<div class="form-container">
    <h3 class="mb-4 text-center">Book an Appointment</h3>
    <form action="saveAppointment.jsp" method="post" onsubmit="return validateForm()">
        <div class="mb-3">
            <label for="patientName" class="form-label">Patient Name</label>
            <input type="text" id="patientName" name="patientName" class="form-control" placeholder="Enter your full name" required />
        </div>
        <div class="mb-3">
            <label for="doctorId" class="form-label">Select Doctor</label>
            <select id="doctorId" name="doctorId" class="form-select" required>
                <option value="">-- Select Doctor --</option>
                <%
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_appointment", "root", "@Arjun001@");
                        String sql = "SELECT doctor_id, name, specialty FROM doctors ORDER BY name";
                        ps = con.prepareStatement(sql);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            int id = rs.getInt("doctor_id");
                            String name = rs.getString("name");
                            String spec = rs.getString("specialty");
                %>
                    <option value="<%= id %>"><%= name %> - <%= spec %></option>
                <%
                        }
                    } catch(Exception e) {
                %>
                    <option disabled>Error loading doctors</option>
                <%
                    } finally {
                        try { if(rs != null) rs.close(); } catch(Exception e) {}
                        try { if(ps != null) ps.close(); } catch(Exception e) {}
                        try { if(con != null) con.close(); } catch(Exception e) {}
                    }
                %>
            </select>
        </div>
        <div class="mb-3">
            <label for="appointmentDate" class="form-label">Appointment Date</label>
            <input type="date" id="appointmentDate" name="appointmentDate" class="form-control" required 
                   min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" />
        </div>
        <div class="mb-3">
            <label for="appointmentTime" class="form-label">Preferred Time</label>
            <input type="time" id="appointmentTime" name="appointmentTime" class="form-control" required />
        </div>
        <div class="mb-3">
            <label for="problem" class="form-label">Brief About the Problem</label>
            <textarea id="problem" name="problem" class="form-control" rows="3" required placeholder="Describe your issue..."></textarea>
        </div>
        <button type="submit" class="btn btn-primary w-100">Confirm Appointment</button>
    </form>
</div>

<script>
    function validateForm() {
        var dateInput = document.getElementById('appointmentDate').value;
        var timeInput = document.getElementById('appointmentTime').value;
        var now = new Date();
        var selectedDate = new Date(dateInput + "T" + timeInput);
        if (selectedDate < now) {
            alert("Please select a future date and time for your appointment.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>
