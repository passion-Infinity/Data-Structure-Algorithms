<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Checkout Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <script src="js/jquery-1.11.0.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script src="js/jquery.easydropdown.js"></script>
        <script type="text/javascript" src="js/memenu.js"></script>
        <link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" href="assets/font-awesome/4.2.0/css/font-awesome.min.css" />
    </head>
    <body> 

        <c:if test="${param.btnAction == null}">
            <c:redirect url="MainController?btnAction=View_Cart_Page" />
        </c:if>



        <!--top-header-->
        <jsp:include page="./common/top-header.jsp" />
        <!--top-header-->
        <!--start-logo-->
        <jsp:include page="./common/logo.jsp" />
        <!--start-logo-->
        <!--bottom-header-->
        <jsp:include page="./common/bottom-header.jsp" />
        <!--bottom-header-->
        <br/>
        <br/>
        <div class="container">
            <c:set var="count" value="${sessionScope.COUNT}"/>
            <c:set var="listCart" value="${sessionScope.CART}" />
            <c:if test="${count != null}">
                <c:if test="${not empty listCart}">
                    <c:set var="cart" value="${listCart.cart}"></c:set>

                        <table  class="table-bordered table-hover table-condensed table-striped table" style="text-align: center; margin: 0 auto">
                            <thead>
                                <tr style="background: #009ceb; color: white">
                                    <th style="text-align: center">Image</th>
                                    <th style="text-align: center">ProductCode</th>
                                    <th style="text-align: center">ProductName</th>
                                    <th style="text-align: center">Description</th>
                                    <th style="text-align: center">Quantity</th>
                                    <th style="text-align: center">Price</th>
                                    <th style="text-align: center"></th>
                                    <th colspan="2" style="text-align: center"></th>
                                </tr>
                            </thead>

                            <tbody>
                            <c:set var="total" value="0"></c:set>
                            <c:forEach var="rows" items="${cart}">
                                <c:set var="sum" value="${(rows.value.product.price) * (rows.value.quantity)}"></c:set>
                                <c:set var="total" value="${total + sum}"></c:set>
                                <form action="MainController" >
                                    <tr>
                                        <td>
                                            <img src="${rows.value.product.image}" width="80" />
                                        <input type="hidden" name="image" value="${rows.value.product.image}"/>
                                    </td>
                                    <td>
                                        ${rows.value.product.productCode}
                                        <input type="hidden" name="productCode" value="${rows.value.product.productCode}"/>
                                    </td>
                                    <td>
                                        ${rows.value.product.productName}
                                        <input type="hidden" name="productName" value="${rows.value.product.productName}"/>
                                    </td>
                                    <td>
                                        ${rows.value.product.description}
                                        <input type="hidden" name="description" value="${rows.value.product.description}"/>
                                    </td>

                                    <td>
                                        <input style="text-align: center" type="number" min="1" max="${rows.value.product.quantity}" name="quantity" value="${rows.value.quantity}" required=""/>
                                    </td>
                                    <td>
                                        ${rows.value.product.price}
                                        <input type="hidden" name="price" value="${rows.value.product.price}"/>
                                    </td>
                                    <td>
                                        ${sum}
                                    </td>
                                    <td class="actions">
                                        <button class="btn btn-info btn-sm" type="submit" name="btnAction" value="Update_Cart">
                                            <i class="fa fa-edit"></i>
                                        </button>
                                    </td>
                                    <td class="actions">
                                        <button class="btn btn-danger btn-sm" type="submit" name="btnAction" value="Delete_Cart" onclick="return comfirmToDelete()">
                                            <i class="fa fa-trash-o"></i>
                                        </button>								
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                        <form action="MainController">
                            <tr>
                                <td class="hidden-xs">
                                    <button type="submit" name="btnAction" value="Search" class="btn btn-warning"><i class="fa fa-angle-left">
                                        </i> Continue Booking
                                    </button>   
                                </td>
                                <td colspan="3"></td>
                                <td>
                                    <button type="submit" name="btnAction" value="Check_Out" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></button>
                                </td>
                                <td class="hidden-xs text-center" colspan="3">
                                    <h4>Total:<p style="display: inline-block; margin-left: 30px"><strong style="color: red">${total}</p></strong></h4>
                                    <input type="hidden" name="total" value="${total}" />
                                </td>
                                <td colspan="2">

                                </td>
                            </tr>
                        </form>
                    </table>
                </c:if>
            </c:if>
            <c:if test="${count == null}">
                <div class="container" style="text-align: center">
                    <h2 style="color: gray">"There is nothing in cart"</h2>
                    <br/>
                    <br/>
                    <a href="MainController?btnAction=Search" style="padding: 15px 20px; font-size: 16px" class="btn btn-info">PURCHASE NOW</a>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                </div>
            </c:if>
            <br/>
            <h4 style="color: red">${requestScope.MESSAGE}</h4>
        </div>
        <!--End-product-Paging-->

        <script>
            function comfirmToDelete() {
                var r = confirm("Do you want to delete?")
                if (r === true) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>

        <!--information-starts-->
        <jsp:include page="./common/information.jsp" />
        <!--information-end-->
        <!--footer-starts-->
        <jsp:include page="./common/footer.jsp" />
        <!--footer-end-->	
    </body>
</html>
