<%@ page import="java.util.Collections" %>
<%@ page import="MYSQLConnection.UserDetails" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="SortComparator.UserComparator" %><%--
  Created by IntelliJ IDEA.
  User: Manase
  Date: 26 Jun 2019
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%
    MYSQLConnection.ValidData fetch = new MYSQLConnection.ValidData("root", "12345");
    String email = request.getParameter("username");
    String password = request.getParameter("password");

    int rowCount;

    try
    {
        ArrayList<UserDetails> userList = fetch.getLogin();
        // rowCount = userList.size();

        UserDetails redefined = new UserDetails(email, password);
        userList.sort(new UserComparator());

        int findUser = Collections.binarySearch(userList, redefined, new UserComparator());

        response.sendRedirect(findUser >= 0 ? "booking.html" : "registration form.jsp");

//        for (int range = 0; range < rowCount; range++)
//        \

//            if (userList.get(range).getUsername().contains(email) && userList.get(range).getPassword().contains(password)) {
//
//                return;
//            }
//        }
//
//        System.out.println(fetch.getLogin().get(1));


    } catch (Exception error) {
       System.out.println(error);
    }
%>