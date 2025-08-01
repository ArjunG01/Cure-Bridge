<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
  // Get form parameters (match names from form!)
  String patientName = request.getParameter("patientName");
  String doctorIdStr = request.getParameter("doctorId");
  String appointmentDate = request.getParameter("appointmentDate");
  String appointmentTime = request.getParameter("appointmentTime");
  String problem = request.getParameter("problem");

  // Simple validation check
  if(patientName == null || doctorIdStr == null || appointmentDate == null || appointmentTime == null || problem == null 
      || patientName.trim().isEmpty() || doctorIdStr.trim().isEmpty() || appointmentDate.trim().isEmpty() 
      || appointmentTime.trim().isEmpty() || problem.trim().isEmpty()) {
%>
      <script>
          alert("Please fill in all fields.");
          window.history.back();
      </script>
<%
      return;
  }

  int doctorId = 0;
  try {
      doctorId = Integer.parseInt(doctorIdStr);
  } catch(Exception e) {
%>
      <script>
          alert("Invalid doctor selection.");
          window.history.back();
      </script>
<%
      return;
  }

  Connection con = null;
  PreparedStatement ps = null;

  try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_appointment", "root", "@Arjun001@");

      // Lookup patient_id by patientName
      int patientId = 0;
      PreparedStatement psPat = con.prepareStatement("SELECT patient_id FROM patients WHERE name = ?");
      psPat.setString(1, patientName);
      ResultSet rsPat = psPat.executeQuery();
      if(rsPat.next()) {
          patientId = rsPat.getInt("patient_id");
      } else {
%>
          <script>
              alert("Patient not found. Please register first.");
              window.location.href = "patientRegister.jsp";
          </script>
<%
          return;
      }
      rsPat.close();
      psPat.close();

      // Insert appointment
      String insertSQL = "INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, problem, status) VALUES (?, ?, ?, ?, ?, 'Pending')";
      ps = con.prepareStatement(insertSQL);
      ps.setInt(1, patientId);
      ps.setInt(2, doctorId);
      ps.setDate(3, java.sql.Date.valueOf(appointmentDate));
      ps.setTime(4, java.sql.Time.valueOf(appointmentTime + ":00"));  // Append seconds if needed
      ps.setString(5, problem);

      int row = ps.executeUpdate();
      if(row > 0) {
%>
          <script>
              alert("Appointment booked successfully!");
              window.location.href = "patientDashboard.jsp";
          </script>
<%
      } else {
%>
          <script>
              alert("Failed to book appointment. Try again.");
              window.history.back();
          </script>
<%
      }
  } catch(Exception e) {
%>
      <script>
          alert("Error: <%= e.getMessage().replace("\"", "\\\"") %>");
          window.history.back();
      </script>
<%
  } finally {
      try { if(ps != null) ps.close(); } catch(Exception e) {}
      try { if(con != null) con.close(); } catch(Exception e) {}
  }
%>
