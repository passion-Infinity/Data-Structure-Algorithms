<%@page import="danhnlc.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="danhnlc.dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Home Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <script src="js/jquery-1.11.0.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script src="js/jquery.easydropdown.js"></script>
        <script type="text/javascript" src="js/memenu.js"></script>
        <link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
    </head>
    <body>

        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <c:if test="${sessionScope.LOGIN_USER.role == 'admin'}">
            <c:redirect url="admin_index.jsp" />
        </c:if>

        <c:if test="${param.btnAction == null}">
            <c:redirect url="MainController?btnAction=Search" />
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

        <!--product-starts-->
        <div class="product">
            <div class="container">
                <div class="product-top">
                    <div class="product-one">
                        <c:set var="listProduct" value="${sessionScope.LIST}" />
                        <c:if test="${not empty listProduct}">
                            <c:forEach var="product" items="${listProduct}">
                                <form action="MainController">
                                    <div class="col-md-3 product-left">
                                        <div class="product-main simpleCart_shelfItem">
                                            <button type="submit" name="btnAction" value="Show_Detail_Product" class="mask img-thumbnail">
                                                <img
                                                    class="img-responsive zoom-img"
                                                    src="${product.image}"
                                                    alt=""
                                                    width="125"
                                                    height="200"
                                                    />
                                            </button>
                                            <div class="product-bottom">
                                                <input type="hidden" name="productCode" value="${product.productCode}" />
                                                <input type="hidden" name="description" value="${product.description}" />
                                                <input type="hidden" name="image" value="${product.image}" />
                                                <h3>
                                                    ${product.productName}
                                                    <input type="hidden" name="productName" value="${product.productName}" />
                                                </h3>
                                                <p>
                                                    Quantity: ${product.quantity}
                                                    <input type="hidden" name="quantity" value="${product.quantity}" />
                                                </p>
                                                <h4>
                                                    <a class="item_add" href="#"><i></i></a>
                                                    <span class="item_price">${product.price}</span>
                                                    <input type="hidden" name="price" value="${product.price}" />
                                                </h4>
                                            </div>
                                            <input type="hidden" name="txtSearch" value="${sessionScope.SEARCH}" />    
                                            <button type="submit" name="btnAction" value="Add_To_Cart" class="btn btn-info" style="margin-top: 10px">
                                                <span class="color10" style="font-size: 14px">ADD TO CART</span>
                                            </button>
                                            <div class="srch">
                                                <span>Pick up!</span>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" name="index" value="${requestScope.INDEX_PAGE}" />
                                </form>
                            </c:forEach>
                        </c:if>
                        <div class="clearfix"></div>
                    </div>
                        <h3 style="color: red; text-align: center">${requestScope.emptyList}</h3>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <!--product-end-->
        <!--Start-product-Paging-->
        <div class="container" style="text-align: center">
            <ul class="pagination pagination-lg">
                <c:forEach begin="1" end="${sessionScope.END_PAGE}" var="i">
                    <li class="page-item ${(requestScope.INDEX_PAGE == i) ? "active":""}"><a href="MainController?btnAction=Search&index=${i}&txtSearch=${sessionScope.SEARCH}" class="page-link">${i}</a></li>
                    </c:forEach>
            </ul>
        </div>
        <!--End-product-Paging-->
        <!--information-starts-->
        <jsp:include page="./common/information.jsp" />
        <!--information-end-->
        <!--footer-starts-->
        <jsp:include page="./common/footer.jsp" />

        <c:if test="${requestScope.message_addCart_failure != null}">
            <script>
                window.alert("Quantity of product is not enough. Please try again.");
            </script>
        </c:if>
        <!--footer-end-->
    </body>
</html>
