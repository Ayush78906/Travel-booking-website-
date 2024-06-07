<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Form Submission</title>
        <!-- Add your CSS and other head content here -->
    </head>
    <body>
        <%
            // Retrieve form data from request
            String name = request.getParameter("myname");
            String email = request.getParameter("email");
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");
            String errorMessage = null; // Initialize error message to null
            // Database connection details (update with your database configuration)
            String jdbcUrl = "jdbc:derby://localhost:1527/sample";
            String dbUser = "app";
            String dbPassword = "app";
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
            // Define the SQL query to insert data into the 'queries' table
            String sql = "INSERT INTO queries (cus_id,cus_name, cus_email, cus_subject, cus_msg) VALUES (?, ?, ?, ?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, 1234);

            pstmt.setString(2, name);
            pstmt.setString(3, email);
            pstmt.setString(4, subject);
            pstmt.setString(5, message);

            // Execute the SQL query to insert data
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                response.sendRedirect("contact.html");
            } else {
                // Handle the case where the data insertion failed
                errorMessage = "Failed to submit the form. Please try again later.";
            }
            conn.close();
                
        %>
    </body>
</html>
