<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    boolean isValid = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_db_name", "your_username", "your_password");

        ps = con.prepareStatement("SELECT * FROM doctors WHERE email = ? AND password = ?");
        ps.setString(1, email);
        ps.setString(2, password);

        rs = ps.executeQuery();

        if (rs.next()) {
            isValid = true;
            session.setAttribute("doctor_id", rs.getInt("doctor_id"));
            session.setAttribute("doctor_name", rs.getString("name"));
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }

    if (isValid) {
%>
        <script>
            alert('Login Successful!');
            window.location.href = 'doctorDashboard.jsp';
        </script>
<%
    } else {
%>
        <script>
            alert('Invalid email or password!');
            window.location.href = 'doctorLogin.jsp';
        </script>
<%
    }
%>
