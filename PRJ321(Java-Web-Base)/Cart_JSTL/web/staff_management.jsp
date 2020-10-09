<%-- 
    Document   : staff_management
    Created on : Oct 7, 2020, 1:18:48 PM
    Author     : User
--%>

<%@page import="danhnlc.dtos.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Management</title>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            if (session.getAttribute("LOGIN_USER") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <h1 class="title">Staff Management Page</h1><br/>
        <div class="logout"><a href="MainController?btnAction=Logout">Logout</a></div><br/>
        <div><a href="MainController?btnAction=Admin_register">Click here to sign up!</a></div><br/>
        <%
            String value = (String) request.getParameter("txtSearch");
            if (value == null) {
                value = "";
            }
        %>
        <form action="MainController">
            <label>Search</label>
            <input type="text" name="txtSearch" value="<%= value%>" size="30" />
            <input type="submit" name="btnAction" value="Search" /><br/><br/>
        </form>
        <%
            List<User> list = (List<User>) request.getAttribute("LIST");

            if (list != null) {
                int count = 0;
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Username</th>
                    <th>Fullname</th>
                    <th>Password</th>
                    <th>Role</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <%
                for (User user : list) {
            %>
            <form action="MainController">
                <tbody>
                    <tr>
                        <td>
                            <%= ++count%>
                        </td>
                        <td>
                            <%= user.getUsername()%>
                            <input type="hidden" name="txtUsername" value="<%= user.getUsername()%>" />
                        </td>
                        <td>
                            <input type="text" name="txtFullname" value="<%= user.getFullname()%>" />
                        </td>
                        <td>
                            <input type="text" name="txtPassword" value="<%= user.getPassword()%>" />
                        </td>
                        <td>
                            <input type="text" name="txtRole" value="<%= user.getRole()%>" />
                        </td>
                        <td>
                            <input type="submit" name="btnAction" value="Update" />
                            <input type="hidden" name="txtSearch" value="<%= value%>" />
                        </td>
                        <td>
                            <a href="MainController?btnAction=Delete&txtUsername=<%= user.getUsername()%>&txtSearch=<%= value%>">Delete</a>
                        </td>
                    </tr>
                </tbody>
            </form>
            <% }%>
        </table>
        <% }%>
    </body>
</html>
