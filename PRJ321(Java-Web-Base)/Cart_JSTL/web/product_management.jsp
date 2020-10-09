<%-- 
    Document   : product_management
    Created on : Oct 8, 2020, 10:17:20 AM
    Author     : User
--%>

<%@page import="danhnlc.dtos.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Shoppping</title>
    </head>
    <body>
        <h1>Product Management Page</h1>
        <h2>Welcome, <%= session.getAttribute("LOGIN_USER")%></h2><br/>
        <div class="logout"><a href="MainController?btnAction=Logout">Logout</a></div><br/>

        <%
            List<Product> list = (List<Product>) request.getAttribute("PLIST");
            if (list != null) {
        %>

        <table border="1">
            <thead>
                <tr>
                    <th>ProductID</th>
                    <th>ProductName</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <%
                for (Product product : list) {
            %>
            <form action="MainController">
                <tbody>
                    <tr>
                        <td>
                            <%= product.getProductID()%>
                            <input type="hidden" name="txtProductID" value="<%= product.getProductID()%>" />
                        </td>
                        <td>
                            <input type="text" name="txtProductName" value="<%= product.getProductName()%>" />
                        </td>
                        <td>
                            <input type="text" name="txtPrice" value="<%= product.getPrice()%>" />
                        </td>
                        <td>
                            <input type="text" name="txtQuantity" value="<%= product.getQuantity()%>" />
                        </td>
                        <td>
                            <input type="submit" name="action" value="Update" />
                        </td>
                        <td>
                            <input type="submit" name="action" value="Delete" />
                        </td>
                    </tr>
                </tbody>
            </form>
            <% }%>
        </table>
        <form action="MainController">
            <input type="submit" name="action" value="Create New Product" />
        </form>
        <% }%>
    </body>
</html>
