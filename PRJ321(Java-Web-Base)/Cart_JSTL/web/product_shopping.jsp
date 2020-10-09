<%-- 
    Document   : product_shopping
    Created on : Oct 8, 2020, 9:52:17 PM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="danhnlc.dtos.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Shopping</title>
    </head>
    <body>
        <h1>Product Shopping Page</h1>
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
                            <%= product.getProductName()%>
                            <input type="hidden" name="txtProductName" value="<%= product.getProductName()%>" />
                        </td>
                        <td>
                            <%= product.getPrice()%>
                            <input type="hidden" name="txtPrice" value="<%= product.getPrice()%>" />
                        </td>
                        <td>
                            <%= product.getQuantity()%>
                            <input type="hidden" name="txtQuantity" value="<%= product.getQuantity()%>" />
                        </td>
                        <td>
                            <input type="submit" name="btnAction" value="Add to Cart" />
                        </td>
                    </tr>
                </tbody>
            </form>
            <% }%>
        </table>
        <form action="MainController">
            <input type="submit" name="btnAction" value="View Cart" />
        </form>
        <% }%>
    </body>
</html>
