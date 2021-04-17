<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
</head>
<body>

    <%@include file="common/header.jsp" %>
    <%@include file="/common/menu.jsp" %>

    <c:set var="listOrder" value="${requestScope.listOrder}" />

    <div class="container">
        <br/>
        <form action="MainController" onsubmit="return checkDate()">
            <div class="danh-group text-right">
                <strong>Chọn ngày:</strong>
                <input type="date" name="txtDate" value="" class="danh-form"/>
                <input type="text" class="danh-form" placeholder="Tìm kiếm theo mã hóa đơn..." name="txtSearch" value="${requestScope.search}"/>
                <button type="submit" class="btn btn-primary" name="btnAction" value="GetHistory">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </form>
        <table  class="table-bordered table-hover table-condensed table-striped table" style="text-align: center; margin: 0 auto">
            <thead>
                <tr style="background: #009ceb;">
                    <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Mã hóa đơn</th>
                    <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Ngày thanh toán</th>
                    <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Tổng tiền</th>
                    <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Trạng thái hóa đơn</th>
                    <th style="text-align: center"></th>
                    <th style="text-align: center"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listOrder}" var="rows">
                <form action="MainController">
                    <tr>
                        <td>
                            ${rows.id}
                            <input type="hidden" name="txtOrderId" value="${rows.id}"/>
                        </td>
                        <td>
                            ${rows.date}
                            <input type="hidden" name="txtDate" value="${rows.date}"/>
                        </td>
                        <td>${rows.total}</td>
                        <td>${rows.status}</td>
                        <td>
                            <button 
                                class="btn btn-info btn-td-table" 
                                data-id="${rows.id}"
                                type="button" 
                                data-toggle="modal" 
                                data-target="#myModal">Xem chi tiết</button>
                        </td>
                        <td>
                            <button class="btn btn-danger" type="submit" 
                                    name="btnAction" value="Delete_Order" <c:if test="${rows.status == 'inactive'}">disabled=""</c:if>>Delete</button>
                            </td>
                        </tr>
                    </form>
            </c:forEach>
            </tbody>
        </table>
        <div class="text-center">
            <c:if test="${requestScope.emptyList == 'empty'}">
                <h1><b>Không tìm thấy dữ liệu</b></h1>
            </c:if>
        </div>
    </div>

    <div class="container text-right danh-paging-margin-top">
        <ul class="pagination">
            <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                <li class="page-item ${(requestScope.indexPage == i) ? "active":""}">
                    <a href="MainController?btnAction=GetHistory&index=${i}&txtSearch=${requestScope.search}" 
                       class="page-link">${i}</a>
                </li>
            </c:forEach>
        </ul>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><strong>Chi tiết hóa đơn</strong></h4>
                </div>
                <div class="modal-body">


                    <table  class="table-bordered table-hover table-condensed table-striped table" style="text-align: center; margin: 0 auto">
                        <thead>
                            <tr style="background: #009ceb;">
                                <th style="text-align: center"></th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Tên xe</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Màu xe</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Số ghế</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Giá</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Số lượng</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Ngày thuê</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Ngày trả</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">

                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>

        </div>
    </div>

    <script>
        <c:if test="${requestScope.success == 'success'}">
        window.alert("Hủy hóa đơn thành công.");
        </c:if>
        <c:if test="${requestScope.failure == 'failure'}">
        window.alert("Xe đã được sử dụng nên hủy hóa đơn thất bại");
        </c:if>
    </script>

    <script>
        $('.btn-td-table').on('click', function () {
            let id = $(this).data('id');
            $.ajax({
                url: "MainController?btnAction=GetListOrderDetail&txtOrderId=" + id,
                type: 'GET'
            }).done(function (res) {
                let tr = setHtml(res);
                $('#tbody').html(tr);

            })
        });

        function setHtml(response) {
            let html = '';
            response.map(function (item) {
                console.log('item', item.car.name)
                html += '<tr>'
                        + '<td><img src=".' + item.car.image + '" width="100px"/></td>'
                        + '<td>' + item.car.name + '</td>'
                        + '<td>' + item.car.color + '</td>'
                        + '<td>' + item.car.seat + '</td>'
                        + '<td>' + item.price + '</td>'
                        + '<td>' + item.quantity + '</td>'
                        + '<td>' + item.pickupDate + '</td>'
                        + '<td>' + item.dropoutDate + '</td>'
                        + '</tr>'
            })
            return html;
        }
    </script>
</body>
</html>

