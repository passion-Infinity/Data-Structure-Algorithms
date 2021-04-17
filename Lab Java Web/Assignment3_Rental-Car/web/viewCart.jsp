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
    </head>
    <body>

        <%@include file="common/header.jsp" %>
        <%@include file="/common/menu.jsp" %>

        <c:set var="listCart" value="${sessionScope.CART}" />
        <c:set var="count" value="${sessionScope.COUNT}" />
        <div class="container">
            <c:if test="${count != null}">
                <c:if test="${not empty listCart}">
                    <c:set var="cart" value="${listCart.cart}" />
                    <br/>
                    <table  class="table-bordered table-hover table-condensed table-striped table" style="text-align: center; margin: 0 auto">
                        <thead>
                            <tr style="background: #009ceb;">
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px"></th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Tên xe</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Hãng xe</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Số lượng xe</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Giá</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Ngày thuê</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Ngày trả</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Giảm giá</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px">Tổng</th>
                                <th style="text-align: center; color: white; font-weight: 800; font-size: 16px"></th>
                                <th style="text-align: center"></th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:set var="total" value="0"></c:set>
                            <c:forEach var="rows" items="${cart}">
                                <c:set var="sum" value="${(rows.value.product.price) * (rows.value.quantity)}"></c:set>
                                <c:set var="sum_discount" value="${sum - (sum*rows.value.product.discount/100)}"></c:set>
                                <c:set var="total" value="${total + sum_discount}"></c:set>
                                <form action="MainController" >
                                    <tr>
                                        <td>
                                            <img src="<c:url value="${rows.value.product.image}" />" width="120" />
                                        <input type="hidden" name="image" value="${rows.value.product.image}"/>
                                    </td>
                                    <td>
                                        <input type="hidden" name="txtCarId" value="${rows.value.product.id}"/>
                                        ${rows.value.product.name}
                                        <input type="hidden" name="txtCarName" value="${rows.value.product.name}"/>
                                    </td>
                                    <td>
                                        ${rows.value.product.typeName}
                                        <input type="hidden" name="txtTypeName" value="${rows.value.product.typeName}"/>
                                    </td>
                                    <td>
                                        <input style="text-align: center" type="number" min="1" max="${rows.value.product.quantity}" name="txtQuantity" value="${rows.value.quantity}" required=""/>
                                    </td>
                                    <td>
                                        ${rows.value.product.price}
                                        <input type="hidden" name="price" value="${rows.value.product.price}"/>
                                    </td>
                                    <td>
                                        ${rows.value.product.pickupDate}
                                        <input type="hidden" name="txtPickupDate" value="${rows.value.product.pickupDate}"/>
                                    </td>
                                    <td>
                                        ${rows.value.product.dropoutDate}
                                        <input type="hidden" name="txtDropoutDate" value="${rows.value.product.dropoutDate}"/>
                                    </td>
                                    <td>
                                        ${rows.value.product.discount}%
                                    </td>
                                    <td>
                                        ${sum - (sum*rows.value.product.discount/100)}
                                    </td>
                                    <td class="actions">
                                        <button class="btn btn-info btn-md" type="submit" name="btnAction" value="Update_Cart">
                                            <i class="fa fa-edit"></i>
                                        </button>
                                    </td>
                                    <td class="actions">
                                        <button class="btn btn-danger btn-md" type="submit" name="btnAction" value="Delete_Cart" onclick="return checkDelete()">
                                            <i class="fa fa-trash-alt"></i>
                                        </button>								
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                        <form action="MainController">
                            <tr>
                                <td class="hidden-xs">
                                    <a href="MainController?btnAction=Search&txtPickupDate=${sessionScope.pickupDate}&txtDropoutDate=${sessionScope.dropoutDate}" class="btn btn-warning"><i class="fa fa-angle-left">
                                        </i> Tiếp tục thuê
                                    </a>   
                                </td>
                                <td colspan="5"></td>
                                <td>
                                    <button type="submit" name="btnAction" value="Check_Out" class="btn btn-success btn-block">Thanh toán <i class="fa fa-angle-right"></i></button>
                                </td>
                                <td class="hidden-xs text-center" colspan="4">
                                    <h4>Thành tiền:<p style="display: inline-block; margin-left: 30px"><strong style="color: red">${total}</p></strong></h4>
                                    <input type="hidden" name="txtTotal" value="${total}" />
                                </td>
                            </tr>
                        </form>
                    </table>
                </c:if>
            </c:if>

            <br/>
            <br/>
            <br/>
            <c:if test="${count == null}">
                <h2 style="text-align: center; color: grey">Danh sách xe thuê trống!</h2>
                <h1 style="text-align: center; text-decoration: underline;"><a href="MainController?btnAction=Search">Click vào đây để xem danh sách thuê xe</a></h1>
            </c:if>
                
            <c:if test="${requestScope.listFailure != null}">
                <c:set var="listFailure" value="${requestScope.listFailure}" />
                <h2 style="color: red">Danh sách xe thuê bị trùng lặp</h2>
                <c:forEach items="${listFailure}" var="list">
                    <c:forEach var="rows" items="${cart}">
                        <c:if test="${rows.key == list}">
                            <h3>Tên xe: ${rows.value.product.name}  |  Ngày thuê: ${rows.value.product.pickupDate} | Ngày trả: ${rows.value.product.dropoutDate} </h3>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </c:if>
        </div>

        <c:if test="${requestScope.message_updateCart_failure != null}">
            <script>
                window.alert("Cập nhật thất bại!\nSố lượng cập nhật đã vượt quá số lượng trong kho.");
            </script>
        </c:if>

        <c:if test="${requestScope.checkout_failure != null}">
            <script>
                window.alert("${requestScope.checkout_failure}");
            </script>
        </c:if>

        <c:if test="${requestScope.success != null}">
            <script>
                window.alert("Xác nhận hóa đơn thành công. \nChúc quý khách một ngày vui vẻ.");
            </script>
        </c:if>

        <c:if test="${requestScope.success_half != null}">
            <script>
                window.alert("Xác nhận hóa đơn thành công. Một vài xe đã dc thuê trước vui lòng thử lại.");
            </script>
        </c:if>

        <c:if test="${requestScope.fail != null}">
            <script>
                window.alert("Xe đã cho thuê trong khoảng thời gian này.");
            </script>
        </c:if>


        <script>
            function checkDelete() {
                var r = confirm("Do you want to delete?")
                if (r === true) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </body>
</html>
