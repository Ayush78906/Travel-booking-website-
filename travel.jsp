<%-- 
    Document   : tavel
    Created on : 22 Feb, 2024, 10:13:28 AM
    Author     : Ayush
--%>
<%@ page import="java.lang.Thread" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
      
            String service = request.getParameter("service-type");
            String dep_location = request.getParameter("departure-location");
            String destination = request.getParameter("destination");
            String dept_date = request.getParameter("departure-date");
            String ret_date = request.getParameter("return-date");
            String num_of_pas = request.getParameter("passenger-count");
            
            out.println(service);
            out.println(dep_location);
            out.println(dept_date);
            out.println(destination);
            out.println(ret_date);
            out.println(num_of_pas);
            
            String errorMessage = null; // Initialize error message to null
            String jdbcUrl = "jdbc:derby://localhost:1527/sample";
            String dbUser = "app";
            String dbPassword = "app";
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
            String Sql = "INSERT INTO travel_booking ( service,  dep_location,destination,dept_date,ret_date,num_of_pas) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement Pstmt = conn.prepareStatement(Sql);
            Pstmt.setString(1, service); // Use the cus_id entered by the user
            Pstmt.setString(2, dep_location);
            Pstmt.setString(3, destination);
            Pstmt.setString(4, dept_date);
            Pstmt.setString(5, ret_date);
            Pstmt.setString(6, num_of_pas);
            Pstmt.executeUpdate();
            out.println("<H1>sucessfull booking<H1>");
 
            response.sendRedirect("payment.html");
            
            }catch(Exception e){
                out.println(e);
            }
        %>
       
    </body>
</html>
