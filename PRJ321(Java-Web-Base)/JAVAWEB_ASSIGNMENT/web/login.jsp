<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Page</title>
        <meta name="description" content="User login page" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/font-awesome/4.2.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="assets/fonts/fonts.googleapis.com.css" />
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

        <script src='https://www.google.com/recaptcha/api.js?hl=en'></script>
    </head>
    <body class="login-layout light-login">

        <div class="main-container">
            <div class="main-content">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1">
                        <div class="login-container">
                            <div class="center">
                                <h1>
                                    <i class="ace-icon fa fa-leaf green"></i>
                                    <span class="red">Ace</span>
                                    <span class="white" id="id-text2">Application</span>
                                </h1>
                                <h4 class="blue" id="id-company-text">&copy; Company Name</h4>
                            </div>

                            <div class="space-6"></div>

                            <div class="position-relative">
                                <div id="login-box" class="login-box visible widget-box no-border">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header blue lighter bigger">
                                                <i class="ace-icon fa fa-coffee green"></i>
                                                Please Enter Your Information
                                            </h4>

                                            <div class="space-6"></div>

                                            <form action="MainController" method="POST" >
                                                <fieldset>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="text" class="form-control" placeholder="Username" name="username" 
                                                                   id="username" value="${sessionScope.USERNAME}" required/>
                                                            <i class="ace-icon fa fa-user"></i>
                                                        </span>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="password" class="form-control" placeholder="Password" name="password" 
                                                                   id="password" required/>
                                                            <i class="ace-icon fa fa-lock"></i>
                                                        </span>
                                                    </label>

                                                    <!--Xử lí hiện thị lỗi khi đăng nhập sai username or password-->
                                                    <c:if test="${sessionScope.LOGIN_USER == 'incorrect'}">
                                                        <h5 style="color: red">username or password is not correct!!!</h5>
                                                    </c:if>

                                                    <div class="clearfix">

                                                        <div class="g-recaptcha block clearfix"
                                                             data-sitekey="6Le-NN8ZAAAAAH_1TokJevB8PEkpkgdeEAfiEh6Y" data-callback="recaptchaCallback"></div>

                                                        <!--Xử lí hiện thị lỗi khi không check reCAPTCHA-->
                                                        <c:if test="${sessionScope.LOGIN_USER == 'recaptchaFail'}">
                                                            <h5 style="color: red">Please, check reCAPTCHA before login! </h5>
                                                        </c:if>

                                                        <div class="space-10"></div>

                                                        <label class="inline">
                                                            <input type="checkbox" class="ace" name="cbox"/>
                                                            <span class="lbl"> Remember Me</span>
                                                        </label>

                                                        <button type="submit" class="width-35 pull-right btn btn-sm btn-primary" name="btnAction" value="Login">
                                                            <i class="ace-icon fa fa-key"></i>
                                                            <span class="bigger-110">Login</span>
                                                        </button>
                                                    </div>

                                                    <div class="space-4"></div>
                                                </fieldset>
                                            </form>

                                            <div class="social-or-login center">
                                                <span class="bigger-110">Or Login Using</span>
                                            </div>

                                            <div class="space-6"></div>

                                            <div class="social-login center">
                                                <div class="btn btn-danger" style="border-radius: 5px;margin: 0;padding: 0">
                                                    <a style="font-size: 14px; color: white; text-decoration: none; font-weight: 600;"
                                                       href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:5050/JAVAWEB_ASSIGNMENT/GoogleLoginController&response_type=code&client_id=867765009171-cb0r5e1q6nbpse0a4eb2js6bimqblilu.apps.googleusercontent.com&approval_prompt=force">
                                                        <i class="ace-icon fa fa-google-plus"></i>
                                                        Continute with Google account
                                                    </a>
                                                </div>
                                            </div>
                                        </div><!-- /.widget-main -->

                                        <div class="toolbar clearfix">
                                            <div>
                                                <a href="#" data-target="#forgot-box" class="forgot-password-link">
                                                    <i class="ace-icon fa fa-arrow-left"></i>
                                                    I forgot my password
                                                </a>
                                            </div>

                                            <div>
                                                <a href="#" data-target="#signup-box" class="user-signup-link">
                                                    I want to register
                                                    <i class="ace-icon fa fa-arrow-right"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div><!-- /.widget-body -->
                                </div><!-- /.login-box -->

                                <div id="forgot-box" class="forgot-box widget-box no-border">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header red lighter bigger">
                                                <i class="ace-icon fa fa-key"></i>
                                                Retrieve Password
                                            </h4>

                                            <div class="space-6"></div>
                                            <p>
                                                Enter your email and to receive instructions
                                            </p>

                                            <form action="MainController">
                                                <fieldset>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="email" class="form-control" placeholder="Email" name="email"/>
                                                            <i class="ace-icon fa fa-envelope"></i>
                                                        </span>
                                                    </label>
                                                    <p style="color: red">${requestScope.MESSAGE}</p>
                                                    <div class="clearfix">
                                                        <button type="submit" class="width-35 pull-right btn btn-sm btn-danger"
                                                                name="btnAction" value="ForgotPassword">
                                                            <i class="ace-icon fa fa-lightbulb-o"></i>
                                                            <span class="bigger-110">Send Me!</span>
                                                        </button>
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div><!-- /.widget-main -->

                                        <div class="toolbar center">
                                            <a href="#" data-target="#login-box" class="back-to-login-link">
                                                Back to login
                                                <i class="ace-icon fa fa-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div><!-- /.widget-body -->
                                </div><!-- /.forgot-box -->

                                <br/>
                                <h1 style="color: green; text-align: center">${requestScope.SUCCESS}</h1>

                                <div id="signup-box" class="signup-box widget-box no-border">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header green lighter bigger">
                                                <i class="ace-icon fa fa-users blue"></i>
                                                New User Registration
                                            </h4>

                                            <div class="space-6"></div>
                                            <p> Enter your details to begin: </p>

                                            <form action="MainController" method="POST" onsubmit="return validateRegisterForm()">
                                                <fieldset>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="email" class="form-control" placeholder="Email" name="email" required/>
                                                            <i class="ace-icon fa fa-envelope"></i>
                                                        </span>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="text" class="form-control" placeholder="Username" name="username" required/>
                                                            <i class="ace-icon fa fa-user"></i>
                                                        </span>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="text" class="form-control" placeholder="Fullname" name="fullname" required/>
                                                            <i class="ace-icon fa fa-user"></i>
                                                        </span>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="password" class="form-control" placeholder="Password" name="password" id="password_r" required/>
                                                            <i class="ace-icon fa fa-lock"></i>
                                                        </span>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="password" class="form-control" placeholder="Repeat password" name="confirm" id="confirm_r" required/>
                                                            <i class="ace-icon fa fa-retweet"></i>
                                                        </span>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input id="phone" type="tel" class="form-control" placeholder="Phone number" name="phone" 
                                                                   pattern="[09|08|07|03|05]+[0-9]{8,10}" required/>
                                                            <i class="ace-icon fa fa-phone"></i>
                                                        </span>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="text" class="form-control" placeholder="Address" name="address" required/>
                                                            <i class="ace-icon fa fa-book"></i>
                                                        </span>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="hidden" class="form-control" placeholder="Customer" value="CUS" name="role" />
                                                        </span>
                                                    </label>

                                                    <div class="space-24"></div>

                                                    <div class="clearfix">
                                                        <button type="reset" class="width-30 pull-left btn btn-sm">
                                                            <i class="ace-icon fa fa-refresh"></i>
                                                            <span class="bigger-110">Reset</span>
                                                        </button>

                                                        <button type="submit" class="width-65 pull-right btn btn-sm btn-success" name="btnAction" value="Register" >
                                                            <span class="bigger-110" >Register</span>
                                                            <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                                        </button>
                                                    </div>

                                                </fieldset>
                                            </form>
                                        </div>

                                        <div class="toolbar center">
                                            <a href="#" data-target="#login-box" class="back-to-login-link">
                                                <i class="ace-icon fa fa-arrow-left"></i>
                                                Back to login
                                            </a>
                                        </div>
                                    </div><!-- /.widget-body -->
                                </div><!-- /.signup-box -->
                            </div><!-- /.position-relative -->

                            <!--                            <div class="navbar-fixed-top align-right">
                                                            <br />
                                                            &nbsp;
                                                            <a id="btn-login-dark" href="#">Dark</a>
                                                            &nbsp;
                                                            <span class="blue">/</span>
                                                            &nbsp;
                                                            <a id="btn-login-blur" href="#">Blur</a>
                                                            &nbsp;
                                                            <span class="blue">/</span>
                                                            &nbsp;
                                                            <a id="btn-login-light" href="#">Light</a>
                                                            &nbsp; &nbsp; &nbsp;
                                                        </div>-->
                        </div>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.main-content -->
        </div><!-- /.main-container -->

        <!-- basic scripts -->

        <script type = "text/javascript">
            function validateRegisterForm() {
                var password = document.getElementById("password_r").value;
                var confirm = document.getElementById("confirm_r").value;

                if (confirm != password) {
                    alert("Password is not correct!");
                    return false;
                }
                return true;
            }
        </script>

        <script type = "text/javascript">
            $(document).ready(function () {
                $('body').on('click', '.checkmobile', function () {
                    var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
                    var mobile = $('#phone').val();
                    if (mobile !== '') {
                        if (vnf_regex.test(mobile) == false)
                        {
                            alert('Số điện thoại của bạn không đúng định dạng!');
                        } else {
                            alert('Số điện thoại của bạn hợp lệ!');
                        }
                    } else {
                        alert('Bạn chưa điền số điện thoại!');
                    }
                });
            });
        </script>

        <!--[if !IE]> -->
        <script src="assets/js/jquery.2.1.1.min.js"></script>

        <!-- <![endif]-->

        <!--[if IE]>
<script src="assets/js/jquery.1.11.1.min.js"></script>
<![endif]-->

        <!--[if !IE]> -->
        <script type="text/javascript">
            window.jQuery || document.write("<script src='assets/js/jquery.min.js'>" + "<" + "/script>");
        </script>

        <!-- <![endif]-->

        <!--[if IE]>
<script type="text/javascript">
window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
        <script type="text/javascript">
            if ('ontouchstart' in document.documentElement)
                document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
        </script>

        <!-- inline scripts related to this page -->
        <script type="text/javascript">
            jQuery(function ($) {
                $(document).on('click', '.toolbar a[data-target]', function (e) {
                    e.preventDefault();
                    var target = $(this).data('target');
                    $('.widget-box.visible').removeClass('visible');//hide others
                    $(target).addClass('visible');//show target
                });
            });


//
//            //you don't need this, just used for changing background
//            jQuery(function ($) {
//                $('#btn-login-dark').on('click', function (e) {
//                    $('body').attr('class', 'login-layout');
//                    $('#id-text2').attr('class', 'white');
//                    $('#id-company-text').attr('class', 'blue');
//
//                    e.preventDefault();
//                });
//                $('#btn-login-light').on('click', function (e) {
//                    $('body').attr('class', 'login-layout light-login');
//                    $('#id-text2').attr('class', 'grey');
//                    $('#id-company-text').attr('class', 'blue');
//
//                    e.preventDefault();
//                });
//                $('#btn-login-blur').on('click', function (e) {
//                    $('body').attr('class', 'login-layout blur-login');
//                    $('#id-text2').attr('class', 'white');
//                    $('#id-company-text').attr('class', 'light-blue');
//
//                    e.preventDefault();
//                });
//
//            });
        </script>

    </body>
</html>
