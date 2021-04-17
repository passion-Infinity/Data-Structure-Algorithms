<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/template/css/bootstrap.min.css" />">
        <script  src="<c:url value="/template/js/jquery-3.2.1.min.js" />"></script>
        <script  src="<c:url value="/template/js/bootstrap.min.js" />"></script> 
        <!---->
        <link rel="stylesheet" type="text/css" href="<c:url value="/template/css/slick.css" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/template/css/slick-theme.css" />"/>
        <!--slide-->
        <link rel="stylesheet" type="text/css" href="<c:url value="/template/css/style.css" />">
        <link href="<c:url value="template/css/danh.css" />" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <%@include file="/common/header.jsp" %>
        <%@include file="/common/menu.jsp" %>

        <c:set var="listCarType" value="${sessionScope.listCarType}" />
        <c:set var="listCar" value="${requestScope.listCar}" />
        <c:set var="customer" value="${sessionScope.customer}" />


        <!--Search-->
        <div class="container">
            <form action="MainController" onsubmit="return checkDate()">
                <div class="danh-group text-right">
                    <strong>Ngày thuê:</strong>
                    <input id="date1" type="date" name="txtPickupDate" class="danh-form-select" min="${requestScope.now}"  value="${sessionScope.pickupDate}" />
                    <strong>Ngày trả:</strong>
                    <input id="date2" type="date" name="txtDropoutDate" class="danh-form-select" min="${requestScope.now}" value="${sessionScope.dropoutDate}"/>
                </div>
                <div class="danh-group text-right">
                    <strong>Hãng xe:</strong>
                    <select class="danh-form-select" name="typeId">
                        <option value="">Mặc định</option>
                        <c:forEach items="${listCarType}" var="rows">
                            <option value="${rows.id}" <c:if test="${requestScope.typeId == rows.id}">selected=""</c:if>>${rows.name}</option>
                        </c:forEach>
                    </select>
                    <strong>Số lượng:</strong>
                    <input type="number" class="danh-form-select" placeholder="Số lượng" name="txtNumber" value="${requestScope.number}"/>
                    <input type="text" class="danh-form" placeholder="Tìm kiếm theo tên xe..." name="txtSearch" value="${requestScope.search}"/>
                    <button type="submit" class="btn btn-primary" name="btnAction" value="Search">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </form>
        </div>

        <div id="maincontent">
            <div class="container">
                <div class="col-md-3  fixside" >
                    <div class="box-left box-menu" >
                        <h3 class="box-title"><i class="fa fa-list"></i>  Danh mục</h3>
                        <ul>
                            <c:forEach items="${listCarType}" var="rows">
                                <li style="display: inherit; <c:if test="${requestScope.typeId == rows.id}">background: #c9c7c7</c:if>">
                                    <a style="display: inherit" href="MainController?btnAction=Search&typeId=${rows.id}&txtSearch=${requestScope.search}&txtPickupDate=${sessionScope.pickupDate}&txtDropoutDate=${sessionScope.dropoutDate}&txtNumber=${requestScope.number}">${rows.name}</a> 
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-md-9 bor">
                    <section class="box-main1">
                        <h3 class="title-main" style="text-align: center;"><a href=""> Ô tô </a> </h3>
                        <div class="showitem">
                            <c:forEach items="${listCar}" var="rows">
                                <form action="MainController" onsubmit="return checkLogin(${customer})">
                                    <div class="col-md-3 item-product bor">
                                        <a href="MainController?btnAction=GetCarDetail&txtCarId=${rows.id}">
                                            <input type="hidden" name="txtImage" value="${rows.image}"/>
                                            <img src="<c:url value="${rows.image}" />" class="" width="100%" height="180">
                                        </a>
                                        <div class="info-item">
                                            <input type="hidden" name="txtCarName" value="${rows.name}"/>
                                            <p><b style="font-size: 20px">${rows.name}</b></p>
                                            <input type="hidden" name="txtQuantity" value="${rows.quantity}"/>
                                            <p>Còn: ${rows.quantity} chiếc</p>
                                            <input type="hidden" name="txtPrice" value="${rows.price}"/>
                                            <p><b class="price">${rows.price} $</b></p>
                                            <input type="text" class="form-control" name="txtDiscount" value="" placeholder="Nhập mã giảm giá"/>

                                            <input type="hidden" name="txtTypeId" value="${requestScope.typeId}"/>
                                            <input type="hidden" name="txtCarId" value="${rows.id}"/>
                                            <input type="hidden" name="typeId" value="${requestScope.typeId}"/>
                                            <input type="hidden" name="txtTypeName" value="${rows.typeName}"/>
                                            <input type="hidden" name="index" value="${requestScope.indexPage}"/>
                                            <input type="hidden" name="txtSearch" value="${requestScope.search}"/>
                                            <input type="hidden" name="txtPickupDate" value="${sessionScope.pickupDate}"/>
                                            <input type="hidden" name="txtDropoutDate" value="${sessionScope.dropoutDate}"/>
                                        </div>
                                        <div class="text-center">
                                            <button style="cursor: pointer; outline: none" type="submit" name="btnAction" value="AddToCart" class="btn btn-danger"
                                                    onclick="return checkQuantity(${rows.quantity})">
                                                Thêm vào danh sách thuê xe
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </c:forEach>
                        </div>
                    </section>
                </div>
                <div class="text-center">
                    <c:if test="${requestScope.emptyList == 'empty'}">
                        <h1><b>Không tìm thấy dữ liệu</b></h1>
                    </c:if>
                </div>
            </div>

        </div>

        <div class="container text-right danh-paging-margin-top">
            <ul class="pagination">
                <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                    <li class="page-item ${(requestScope.indexPage == i) ? "active":""}">
                        <a href="MainController?btnAction=Search&index=${i}&typeId=${requestScope.typeId}&txtSearch=${requestScope.search}&txtPickupDate=${sessionScope.pickupDate}&txtDropoutDate=${sessionScope.dropoutDate}&txtNumber=${requestScope.number}" 
                           class="page-link">${i}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <c:if test="${requestScope.message_addCart_failure != null}">
            <script>
                window.alert("Số lượng xe đã hết hoặc không đủ. Vui lòng chọn xe khác!");
            </script>
        </c:if> 
        <script>
            function checkDate() {
                var date1 = document.getElementById('date1').value;
                var date2 = document.getElementById('date2').value;

                if (date1 > date2) {
                    window.alert("Ngày trả phải lớn hơn ngày thuê");
                    return false;
                }
                return true;
            }

            function checkLogin(check) {
                debugger;
                if (check !== undefined) {
                    return true;
                } else {
                    window.alert('Vui lòng đăng nhập để thực hiện thao tác!');
                    if (confirm('Bạn có muốn đăng nhập tài khoản ?')) {
                        close();
                        window.open("MainController?btnAction=Login_Page");
                    }
                    return false;
                }
            }
        </script>
        <c:if test="${sessionScope.customer != null}">
            <script>
                function checkQuantity(check) {
                    if (check === 0) {
                        window.alert("Số lượng xe đã hết hoặc không đủ. Vui lòng chọn xe khác!");
                        return false;
                    } else {
                        return true;
                    }
                }
            </script>
        </c:if>
        <script  src="<c:url value="/template/js/slick.min.js" />"></script>
    </body>
</html>
