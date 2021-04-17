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
        %>
        <c:if test="${sessionScope.LOGIN_USER.role == 'admin'}">
            <c:redirect url="admin_index.jsp" />
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
        <!--banner-starts-->


        <c:set var="product" value="${sessionScope.PRODUCT}" />

        <form action="MainController">
            <div class="single contact">
                <div class="container">
                    <div class="single-main">
                        <div class="col-md-9 single-main-left">
                            <div class="sngl-top">
                                <div class="col-md-5 single-top-left">	
                                    <div class="flexslider">
                                        <ul class="slides">
                                            <li data-thumb=${product.image}>
                                                <div class="thumb-image"> <img src="${product.image}" data-imagezoom="true" class="img-responsive" alt=""/> </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- FlexSlider -->
                                    <script src="js/imagezoom.js"></script>
                                    <script defer src="js/jquery.flexslider.js"></script>
                                    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
                                    <script>
            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails"
                });
            });
                                    </script>
                                </div>

                                <div class="col-md-7 single-top-right">
                                    <div class="single-para simpleCart_shelfItem">
                                        <input type="hidden" name="productCode" value="${product.productCode}" />
                                        <h2>
                                            ${product.productName}
                                            <input type="hidden" name="productName" value="${product.productName}" />
                                        </h2>
                                        <div class="star-on">
                                            <ul class="star-footer">
                                                <li><a href="#"><i> </i></a></li>
                                                <li><a href="#"><i> </i></a></li>
                                                <li><a href="#"><i> </i></a></li>
                                                <li><a href="#"><i> </i></a></li>
                                                <li><a href="#"><i> </i></a></li>
                                            </ul>
                                            <div class="review">
                                                <a href="#"> 1 customer review </a>

                                            </div>
                                            <div class="clearfix"></div>
                                        </div>

                                        <input type="hidden" name="image" value="${product.image}" />
                                        <h5 class="item_price">${product.price} $</h5>
                                        <input type="hidden" name="quantity" value="${product.quantity}" />
                                        <input type="hidden" name="price" value="${product.price}" />
                                        <p>Description: ${product.description}</p>
                                        <input type="hidden" name="description" value="${product.description}" />
                                        <br/><br/>

                                        <button type="submit" name="btnAction" value="Add_To_Cart" class="btn btn-info">
                                            <span class="color13" style="font-size: 18px">ADD TO CART</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </form>


        <!--information-starts-->
        <jsp:include page="./common/information.jsp" />
        <!--information-end-->
        <!--footer-starts-->
        <jsp:include page="./common/footer.jsp" />
        <!--footer-end-->
    </body>
</html>
