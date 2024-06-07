<%-- 
    Document   : register
    Created on : 22 Feb, 2024, 10:44:10 AM
    Author     : Ayush
--%>

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
         try  {
            
            String cus_name = request.getParameter("myname1");
            String cus_email = request.getParameter("myemail");
            String cus_phone = request.getParameter("myphone");
            String cus_age = request.getParameter("myage");
            String cus_gender = request.getParameter("mygender");
            String departure_date = request.getParameter("departuredate");
            String return_date = request.getParameter("returndate");
            String travel_destination = request.getParameter("td");
            String travel_package = request.getParameter("locations");
            
            out.println("<h1>"+cus_name+"<h1>");
            out.println("<h1>"+cus_email+"<h1>");
            out.println("<h1>"+cus_phone+"<h1>");
            out.println("<h1>"+cus_age+"<h1>");
            out.println("<h1>"+cus_gender+"<h1>");
            out.println("<h1>"+departure_date+"<h1>");
            out.println("<h1>"+return_date+"<h1>");
            out.println("<h1>"+travel_destination+"<h1>");
            out.println("<h1>"+travel_package+"<h1>");
            String errorMessage = null; // Initialize error message to null
            String jdbcUrl = "jdbc:derby://localhost:1527/sample";
            String dbUser = "app";
            String dbPassword = "app";
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
            String Sql = "INSERT INTO Registration ( cus_name,  cus_email,cus_phone,cus_age,cus_gender,departure_date,return_date,travel_destinations,travel_package) VALUES (?, ?, ?, ?, ?, ?,?,?,?)";
            PreparedStatement Pstmt = conn.prepareStatement(Sql);
            Pstmt.setString(1, cus_name); // Use the cus_id entered by the user
            Pstmt.setString(2, cus_email);
            Pstmt.setString(3, cus_phone);
            Pstmt.setString(4, cus_age);
            Pstmt.setString(5, cus_gender);
            Pstmt.setString(6, departure_date);
            Pstmt.setString(7, return_date);
            Pstmt.setString(8, travel_destination);
            Pstmt.setString(9, travel_package);
            // Check if the provided email and password match a record in the 'customer' table
//            String sql = "";
//            PreparedStatement pstmt = conn.prepareStatement(sql);
//            pstmt.setString(1, flightName);
//            pstmt.setString(2, departure);
//            pstmt.setString(3, destination);
//            pstmt.setString(4, departureDate);
//            pstmt.setStrin    g(5, arrivalDate);
             Pstmt.executeUpdate();
             out.println("success");
             response.sendRedirect("travel.html");
                     
             
        }catch(Exception e){
            out.println(e);
            
        }
        %>
        <h1>Hello World!</h1>
    </body>
</html>
