<%@ page import="java.security.SecureRandom" %>
<%--
  Created by IntelliJ IDEA.
  User: Manase
  Date: 28 Jun 2019
  Time: 09:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    MYSQLConnection.ValidData standard = new MYSQLConnection.ValidData("root", "12345");
    SecureRandom chained = new SecureRandom();
    SecureRandom shiftValue = new SecureRandom();

    String userEmail = request.getParameter("email");
    String username = request.getParameter("username");
    String userPassword = request.getParameter("password");

    int bound = (chained.nextInt(500) + shiftValue.nextInt(10)) + 1;
    int updated = 0;

    try
    {
        updated = standard.insertNewUser(bound, userEmail, username, userPassword);

        switch (updated)
        {
            case 0:
                System.out.println("An error occurred while trying to perform action.");
                break;

            case 1:
                standard.insertNewUser(bound);
                break;
        }
    }
    catch(Exception severe) {
        System.out.println(severe);
    }

    System.out.printf("Press ATO returned %d%n", updated);
    response.sendRedirect(updated >= 1 ? "index.jsp" : "registration form.jsp");
%>