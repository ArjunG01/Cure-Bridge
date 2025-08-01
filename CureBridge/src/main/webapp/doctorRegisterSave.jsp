<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Registration Save</title>
</head>
<body>

<%
    String name = request.getParameter("name");
    String specialization = request.getParameter("specialization");
    String email = request.getParameter("email");
    String contact = request.getParameter("contact");
    String clinic = request.getParameter("clinic");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");

    if (!password.equals(confirmPassword)) {
%>
        <script>
            alert('Password and Confirm Password do not match!');
            window.location.href = 'doctorRegister.jsp';
        </script>
<%
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hospital_appointment", "root", "@Arjun001@");

            // Insert into doctors table (adding clinic as specialty or extra column as needed)
            // Assuming your doctors table has a 'clinic' column, else adjust accordingly.
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO doctors(name, email, contact, specialty, password, created_at) " +
                "VALUES('" + name + "', '" + email + "', '" + contact + "', '" + specialization + "','" + clinic + "', '" + password + "', NOW())"
            );

            int i = ps.executeUpdate();

            if (i > 0) {
%>
                <script>
                    alert('Doctor Registered Successfully!');
                    window.location.href = 'doctorLogin.jsp';
                </script>
<%
            } else {
%>
                <script>
                    alert('Registration Failed!');
                    window.location.href = 'doctorRegister.jsp';
                </script>
<%
            }

            ps.close();
            con.close();
        } catch (Exception e) {
%>
            <script>
                alert('Error: <%= e.getMessage() %>');
                window.location.href = 'doctorRegister.jsp';
            </script>
<%
        }
    }
%>

</body>
</html>
