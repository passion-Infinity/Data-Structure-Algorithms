<%-- 
    Document   : signup
    Created on : Oct 13, 2020, 11:18:18 AM
    Author     : User
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="danhnlc.dtos.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup Page - Admin</title>
        <meta name="description" content="User login page" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/font-awesome/4.2.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="assets/fonts/fonts.googleapis.com.css" />
        <link rel="stylesheet" href="assets/css/ace.min.css" />
        <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />



    </head>
    <body class="light-login" >

        <div class="login-container">
            <div class="center">
                <h1>
                    <i class="ace-icon fa fa-leaf green"></i>
                    <span class="red">Ace</span>
                    <span id="id-text2">Application</span>
                </h1>
                <h4 class="blue" id="id-company-text">&copy; Company Name</h4>
            </div>
            <div class="space-6"></div>
            <div class="position-relative">
                <br/>
                <h2 style="color: green; text-align: center">${requestScope.SUCCESS}</h2>
                <h2 style="color: red; text-align: center">${sessionScope.ERROR_TITLE}</h2>

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
                                        <small style="color: red">${sessionScope.ERROR.emailError}</small>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="text" class="form-control" placeholder="Username" name="username" required/>
                                            <i class="ace-icon fa fa-user"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <small style="color: red">${requestScope.DUPLICATE}</small>
                                    </label>

                                    <label class="block clearfix">
                                        <small style="color: red">${sessionScope.ERROR.usernameError}</small>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="text" class="form-control" placeholder="Fullname" name="fullname" required/>
                                            <i class="ace-icon fa fa-user"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <small style="color: red">${sessionScope.ERROR.fullnameError}</small>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="password" class="form-control" placeholder="Password" name="password" required id="password"/>
                                            <i class="ace-icon fa fa-lock"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="password" class="form-control" placeholder="Repeat password" name="confirm" required id="confirm"/>
                                            <i class="ace-icon fa fa-retweet"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="tel" class="form-control" placeholder="Phone number" name="phone" 
                                                   pattern="[09|08|07|03|05]+[0-9]{8,10}" required/>
                                            <i class="ace-icon fa fa-phone"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="text" class="form-control" placeholder="Address" name="address" required />
                                            <i class="ace-icon fa fa-book"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="hidden" class="form-control" placeholder="Customer" value="CUS" name="role"/>
                                        </span>
                                    </label>

                                    <div class="space-24"></div>

                                    <div class="clearfix">
                                        <button type="reset" class="width-30 pull-left btn btn-sm">
                                            <i class="ace-icon fa fa-refresh"></i>
                                            <span class="bigger-110">Reset</span>
                                        </button>

                                        <button type="submit" class="width-65 pull-right btn btn-sm btn-success" name="btnAction" value="Register">
                                            <span class="bigger-110" >Register</span>
                                            <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                        </button>
                                    </div>

                                </fieldset>
                            </form>
                        </div>

                        <div class="toolbar center">
                            <a href="MainController?btnAction=Login_Page" data-target="#login-box" class="back-to-login-link">
                                <i class="ace-icon fa fa-arrow-left"></i>
                                Back to login
                            </a>
                        </div>
                    </div><!-- /.widget-body -->
                </div><!-- /.signup-box -->
            </div><!-- /.position-relative -->
        </div>

        <script type = "text/javascript">
            function validateRegisterForm() {
                var password = document.getElementById("password").value;
                var confirm = document.getElementById("confirm").value;
                if (confirm != password) {
                    alert("Password is not correct!");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
