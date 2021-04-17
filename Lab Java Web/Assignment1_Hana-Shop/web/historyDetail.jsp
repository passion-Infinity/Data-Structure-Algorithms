<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>History Page</title>
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
            <c:redirect url="MainController?btnAction=Load_History" />
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



        <div class="container">
            <table style="margin: 0 auto" class="table-bordered table-condensed table-hover table-striped">
                <thead>
                    <tr style="background: #009ceb; color: white">
                        <th style="text-align: center">Item</th>
                        <th style="text-align: center">ProductCode</th>
                        <th style="text-align: center">ProductName</th>
                        <th style="text-align: center">Quantity</th>
                        <th style="text-align: center">Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="history" value="${sessionScope.LIST_ORDERDETAIL}" />
                    <c:forEach var="rows" items="${history}">
                        <tr>
                            <td><img width="80" src="${rows.product.image}" ></td>
                            <td>${rows.product.productCode}</td>
                            <td>${rows.product.productName}</td>
                            <td>${rows.quantity}</td>
                            <td>${rows.price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>


        <!--Start-product-Paging-->
        <div class="container" style="text-align: center">
            <ul class="pagination pagination-lg">
                <c:forEach begin="1" end="${sessionScope.END_PAGE_ORDERDETAIL}" var="i">
                    <li class="page-item ${(requestScope.INDEX_PAGE_ORDERDETAIL == i) ? "active":""}"><a href="MainController?btnAction=Load_OrderDetail_History&index=${i}" class="page-link">${i}</a></li>
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