<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Detail Page</title>
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
            session.setAttribute("ADMIN_PRODUCT", "");
        %>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="MainController?btnAction=Search" />
        </c:if>
        <c:if test="${param.btnAction == null}">
            <c:redirect url="MainController?btnAction=Search" />
        </c:if>

        
        
        <jsp:include page="./common/top-header.jsp" />
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
                                            <a href="#"class="mask">
                                                <img
                                                    class="img-responsive zoom-img"
                                                    src="${product.image}"
                                                    alt=""
                                                    width="125"
                                                    height="200"
                                                    />
                                            </a>
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
                                            <input type="hidden" name="txtSearch" value="${requestScope.SEARCH}" />    
                                            <div class="srch">
                                                <span>Pick up!</span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </c:forEach>
                        </c:if>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <!--product-end-->
        <!--Start-product-Paging-->
        <div class="container" style="text-align: center">
            <ul class="pagination pagination-lg">
                <c:forEach begin="1" end="${sessionScope.END_PAGE}" var="i">
                    <li class="page-item ${(requestScope.INDEX_PAGE == i) ? "active":""}"><a href="MainController?btnAction=Search&index=${i}" class="page-link">${i}</a></li>
                    </c:forEach>
            </ul>
        </div>
        <!--End-product-Paging-->
        <!--information-starts-->
        <jsp:include page="./common/information.jsp" />
        <!--information-end-->
        <!--footer-starts-->
        <jsp:include page="./common/footer.jsp" />
        <!--footer-end-->
    </body>
</html>
