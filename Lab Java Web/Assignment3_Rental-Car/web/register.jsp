<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Đăng ký tài khoản</div>
                        <div class="panel-body">
                            <form role="Form" method="post" action="MainController" accept-charset="UTF-8">
                                <div class="form-group">
                                    <label for="emailaddr">Email</label>
                                    <input type="email" id="emailaddr" class="form-control" name="txtEmail" value="${sessionScope.email}" placeholder="Example: john.doe@gmail.com" required="">
                                </div>
                                <h5 style="color: red">${sessionScope.error.emailError}</h5>
                                <div class="form-group">
                                    <label for="fname">Họ và tên</label>
                                    <input type="text" class="form-control" name="txtFullname" value="${sessionScope.fullname}" placeholder="Example: John" required="">
                                </div>
                                <h5 style="color: red">${sessionScope.error.fullnameError}</h5>
                                <div class="form-group">
                                    <label for="phone">Số điện thoại</label>
                                    <input type="text" class="form-control" name="txtPhone" value="${sessionScope.phone}" placeholder="Example: 0389886213" required="">
                                </div>
                                <h5 style="color: red">${sessionScope.error.phoneError}</h5>
                                <div class="form-group">
                                    <label for="address">Địa chỉ</label>
                                    <input type="text" class="form-control" name="txtAddress" value="${sessionScope.address}" placeholder="Example: Uyên Hưng - Tân Uyên - Bình Dương" required="">
                                </div>
                                <div class="form-group">
                                    <label for="password">Mật khẩu</label>
                                    <input type="password" class="form-control" name="txtPassword" required="">
                                </div>
                                <div class="form-group">
                                    <label for="verifypass">Xác nhận mật khẩu</label>
                                    <input type="password" class="form-control" name="txtConfirm" placeholder="" required="">
                                </div>
                                <h5 style="color: red">${sessionScope.error.confirm}</h5>
                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-primary btn-lg" name="btnAction" value="Register">
                                        Đăng ký
                                    </button>
                                </div>
                            </form>
                        </div>
                        <h5 style="color: green">${sessionScope.success}</h5>
                        <h5 style="color: red">${sessionScope.accountError}</h5>
                    </div>
                    <h4 class="text-center"><a href="MainController?btnAction=Login_Page" style="text-decoration: underline">Đăng nhập tài khoản </a></h4>
                </div>
            </div>
        </div>
    </body>
</html>
