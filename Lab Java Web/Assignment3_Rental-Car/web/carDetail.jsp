<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết sản phẩm</title>
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
    <c:set var="listFeedBack" value="${requestScope.listFeedBack}" />
    <c:set var="carDTO" value="${requestScope.carDTO}" />

    <div class="container">
        <div class="ct-left">
            <br/>
            <br/>
            <br/>
            <img src="<c:url value="${carDTO.image}" />"  width="400px">
        </div>
        <div class="ct-right">
            <h1 style="font-weight: 800">${carDTO.name}</h1>
            <h3 style="font-weight: 800">Màu: ${carDTO.color}</h3>
            <h3 style="font-weight: 800">Số ghế: ${carDTO.seat}</h3>
            <h3 style="font-weight: 800">Giá: ${carDTO.price}</h3>
        </div>
        <br/>
        <br/>
        <br/>
        <div class="danh-comment">
            <c:if test="${not empty listFeedBack}">
                <h2>Danh sách bình luận</h2>
                <form action="MainController" onsubmit="return checkLogin(${sessionScope.customer})">
                    <c:forEach items="${listFeedBack}" var="rows">
                        <p style="display: inline-block; margin-right: 20px; margin-bottom: 0"><strong>${rows.email}: </strong></p><span style="color: gray">${rows.createdDate}</span>
                        <p style="margin-bottom: 25px; margin-top: 0">${rows.cont}</p>
                    </c:forEach>
                    <input type="hidden" name="txtCarId" value="${carDTO.id}" />
                    <input type="text" name="txtComment" class="danh-form" placeholder="Nhập bình luận" <c:if test="${sessionScope.customer == null}">readonly=""</c:if> />
                        <input type="hidden" name="btnAction" value="GetCarDetail" />
                        <input class="btn btn-primary" type="submit"  value="Gửi" />
                    </form>
            </c:if>
        </div>
    </div>

    <script>
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
</body>
</html>

