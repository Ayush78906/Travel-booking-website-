<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Result</title>
    </head>
    <body>
        <%
            String email = request.getParameter("myemail");
            String password = request.getParameter("mypassword");
            String errorMessage = null; // Initialize error message to null
            String jdbcUrl = "jdbc:derby://localhost:1527/sample";
            String dbUser = "app";
            String dbPassword = "app";
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Check if the provided email and password match a record in the 'customer' table
            String sql = "SELECT * FROM customer WHERE cus_email = ? AND cus_password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Authentication successful
                // Create a session and store user attributes
                HttpSession userSession = request.getSession();
                userSession.setAttribute("userEmail", email);
                userSession.setAttribute("isLoggedIn", true);

                // Redirect to a protected page or dashboard (e.g., index.html)
                response.sendRedirect("index.html");
            } else {
                // Invalid email or password
                errorMessage = "Invalid email or password. Please try again.";
            }
        %>
        <%-- Perform the redirection or display an error message --%>
        <script>
            <% if (errorMessage == null) { %>
            // Redirect to the dashboard or another protected page
            window.location.href = "index.html";
            <% } else {%>
            // Display an error message and redirect to the login page on error
            alert("<%= errorMessage%>");
            window.location.href = "login.html";
            <% }%>
        </script>
    </body>
</html>
