<%-- 
    Document   : insertProduct
    Created on : Oct 8, 2020, 11:25:39 AM
    Author     : User
--%>

<%@page import="danhnlc.dtos.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ProductError error = (ProductError) request.getAttribute("ERROR");
            if (error == null) {
                error = new ProductError("", "", "", "");
            }
        %>
        <h1>Create new product Page</h1>
        <form action="MainController">
            <label>ProductID:</label>
            <input type="text" name="txtProductID" size="30" />
            <%= error.getProductIDError()%><br/><br/>
            <label>ProductName:</label> 
            <input type="text" name="txtProductName"  size="30" />
            <%= error.getProductNameError()%><br/><br/>
            <label>Price:</label> 
            <input type="text" name="txtPrice" size="30" />
            <%= error.getPriceError()%><br/><br/>
            <label>Quantity:</label> 
            <input type="text" name="txtQuantity" size="30" />
            <%= error.getQuantity()%><br/><br/>
            <input type="submit" name="action" value="Create" />
            <input type="reset" value="Reset" />
        </form> 
    </body>
</html>
