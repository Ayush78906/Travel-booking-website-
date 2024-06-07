<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup Result</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
            String mobile = request.getParameter("cus_mobile");
            String address = request.getParameter("cus_address");
            String email = request.getParameter("myemail");
            String password = request.getParameter("mypassword");
            int cus_id = Integer.parseInt(request.getParameter("cus_id")); // Retrieve cus_id entered by the user

            String jdbcUrl = "jdbc:derby://localhost:1527/sample";
            String dbUser = "app";
            String dbPassword = "app";
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Insert the new user into the 'customer' table
            String customerSql = "INSERT INTO customer (cus_id, cus_name, cus_mobile, cus_address, cus_email, cus_password) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement customerPstmt = conn.prepareStatement(customerSql);
            customerPstmt.setInt(1, cus_id); // Use the cus_id entered by the user
            customerPstmt.setString(2, name);
            customerPstmt.setString(3, mobile);
            customerPstmt.setString(4, address);
            customerPstmt.setString(5, email);
            customerPstmt.setString(6, password);

            int rowsAffected = customerPstmt.executeUpdate();

            // Insert the query into the 'queries' table with the customer ID
            String querySql = "INSERT INTO queries (cus_id, cus_name, cus_email, cus_subject, cus_msg) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement queryPstmt = conn.prepareStatement(querySql);
            queryPstmt.setInt(1, cus_id); // Use the cus_id entered by the user
            queryPstmt.setString(2, name);
            queryPstmt.setString(3, email);
            queryPstmt.setString(4, "Your subject here"); // Replace with actual subject
            queryPstmt.setString(5, "Your message here"); // Replace with actual message

            int queryRowsAffected = queryPstmt.executeUpdate();

            if (rowsAffected > 0 && queryRowsAffected > 0) {
                // Both customer and query data inserted successfully
        %>
        <h2>Registration Successful!</h2>
        <p>Your Customer ID is: <%= cus_id %></p>
        <p>Name: <%= name %></p>
        <p>Mobile: <%= mobile %></p>
        <p>Address: <%= address %></p>
        <p>Email: <%= email %></p>
        <p>Please make a note of your Customer ID. You will be redirected to the login page in 30 seconds.</p><p>Or<a href="login.html">  LOGIN HERE.</a></p>

        <script>
            // Redirect to the login page after a 30-second delay
            setTimeout(function() {
                window.location.href = "login.html";
            }, 30000); // 30,000 milliseconds = 30 seconds
        </script>
        <%
            } else {
                // Handle the case where data insertion failed
        %>
        <p>Failed to register. Please try again.</p>
        <%
            }
        %>
    </body>
</html>
