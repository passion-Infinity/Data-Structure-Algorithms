<%-- 
    Document   : showCart
    Created on : Oct 7, 2020, 1:41:17 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        <h1>Cart Shopping Page</h1>
        <c:set var="shop" value="${sessionScope.SHOP}" />
        <c:if test="${not empty shop}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ProductID</th>
                        <th>ProductName</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <form action="MainController">
                    <c:set var="count" value="0" />
                    <c:forEach var="rows" items="${shop}">
                        <c:set var="count" value="${count + 1}" />
                        <tr>
                            <td>${count}</td>
                            <td>${rows.value.productCart.productID}</td>
                            <td>${rows.value.productCart.productName}</td>
                            <td>${rows.value.productCart.price}</td>
                            <td>${rows.value.quantity}</td>
                            <td>
                                <input type="checkbox" name="remove" value="${rows.value.productCart.productID}" />
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <c:url var="add" value="MainController">
                            <c:param name="btnAction" value="Add more" />
                        </c:url>
                        <td colspan="2">
                            <a href="${add}">Add more</a>
                        </td>
                        <td>
                            <input type="submit" name="btnAction" value="Remove" />
                        </td>
                    </tr>
                </form>
            </tbody>
        </table>
    </c:if>
</body>
</html>
