<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Processing</title>
</head>
<body>

<%
    // Retrieve payment details from the form
    String cardNumber = request.getParameter("cardNumber");
    String expirationDate = request.getParameter("expirationDate");
    String cvv = request.getParameter("cvv");
String jdbcUrl = "jdbc:derby://localhost:1527/sample";
            String dbUser = "app";
            String dbPassword = "app";
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Check if the provided email and password match a record in the 'customer' table
            String sql = "insert into payment(card_number,expiry_date,cvv) values(?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, cardNumber);
            pstmt.setString(2, expirationDate);
             pstmt.setString(3, cvv);
            pstmt.executeUpdate();
            %>
        <h1>payment Succesful</h1>
    <%

            response.sendRedirect("index.html");
            
  
%>

</body>
</html>
