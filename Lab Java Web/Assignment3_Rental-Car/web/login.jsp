<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="template/css/login.css" rel="stylesheet" type="text/css"/>
        <script src='https://www.google.com/recaptcha/api.js?hl=en'></script>
        <link href="template/css/danh.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-4 col-md-offset-4">
                    <h1 class="text-center login-title"><b>Đăng nhập</b></h1>
                    <div class="account-wall">
                        <img class="profile-img" src="<c:url value="/template/images/user.png" />" >
                        <form class="form-signin" action="MainController" method="post">
                            <input type="email" class="form-control" placeholder="Email" name="txtEmail" value="${sessionScope.email}" required autofocus>
                            <h6 style="color: red">${sessionScope.error.emailError}</h6>
                            <input type="password" class="form-control" placeholder="Mật khẩu" name="txtPassword" required>
                            <h6 style="color: red">${sessionScope.error}</h6>
                            <h6 style="color: red">${sessionScope.accountError}</h6>
                            <c:if test="${sessionScope.status == 'New' || sessionScope.status == 'wrong' || requestScope.send_email_success == 'success'}">
                                <input type="text" class="form-control" placeholder="Nhập mã kích hoạt" name="txtCode" required>
                            </c:if>
                            <div class="g-recaptcha block clearfix"
                                 data-sitekey="6Le-NN8ZAAAAAH_1TokJevB8PEkpkgdeEAfiEh6Y" data-callback="recaptchaCallback"></div>
                            <h6 style="color: red">${sessionScope.recaptcha}</h6>
                            <button class="btn btn-lg btn-primary btn-block" type="submit" name="btnAction" value="Login">
                                Đăng nhập</button>
                            <button type="button" class="btn btn-lg btn-danger btn-block" data-toggle="modal" data-target="#myModal">Kích hoạt tài khoản</button>
                        </form>
                    </div>
                    <a href="MainController?btnAction=Register_Page" class="text-center new-account">Đăng ký tài khoản </a>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Kích hoạt tài khoản</h4>
                    </div>
                    <div class="modal-body">
                        <form action="MainController">
                            <input class="form-control" type="email" name="txtEmail" value="" placeholder="Nhập email" required=""/> 
                            <br/>
                            <button class="btn btn-md btn-primary btn-block" type="submit" name="btnAction" value="getActiveCode">Gửi</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>


        <script>
            if (${sessionScope.status == 'New'}) {
                window.alert("Tài khoản của bạn chưa được kích hoạt.\n Vui lòng click vào Kích hoạt tài khoản để lấy mã kích hoạt.");
            }
        </script>
        
        <script>
            if (${requestScope.status == 'Active'}) {
                window.alert("Tài khoản của bạn đã được kích hoạt vui lòng đăng nhập.");
            }
        </script>
        
        <script>
            if (${requestScope.status == 'no-exist'}) {
                window.alert("Tài khoản của bạn không hợp lệ. Vui lòng thử lại.");
            }
        </script>
        
        <script>
            if (${sessionScope.status == 'wrong'}) {
                window.alert("Mã kích hoạt không chính xác.");
            }
        </script>
    </body>
</html>
