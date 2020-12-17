<%-- 
    Document   : signup
    Created on : Oct 13, 2020, 11:18:18 AM
    Author     : User
--%>

<%@page import="danhnlc.dtos.User"%>
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

        <script type = "text/javascript">
            function validateRegisterForm() {
                var username = document.getElementById("username").value;
                var fullname = document.getElementById("fullname").value;
                var password = document.getElementById("password").value;
                var confirm = document.getElementById("confirm").value;
                var email = document.getElementById("email").value;
                var phone = document.getElementById("phone").value;
                var address = document.getElementById("address").value;
                if (username === "") {
                    alert("Please enter your Username");
                    return false;
                }
                if (fullname === "") {
                    alert("Please enter your Fullname");
                    return false;
                }
                if (password === "") {
                    alert("Please enter your Password");
                    return false;
                }
                if (confirm !== password) {
                    alert("Password is not correct!");
                    return false;
                }
                if (email === "") {
                    alert("Please enter your Email");
                    return false;
                }
                if (phone === "") {
                    alert("Please enter your Phone number(not include characters)");
                    return false;
                }
                if (address === "") {
                    alert("Please enter your Address");
                    return false;
                }
                return true;
            }
        </script>

    </head>
    <body class="light-login" >

        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            User user = (User) session.getAttribute("LOGIN_USER");

            if (user == null) {
                response.sendRedirect("index.jsp");
            } else if (!user.getRoleID().equals("MA")) {
                response.sendRedirect("index.jsp");
            }
        %>

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
                <%
                    String message = (String) request.getAttribute("MESSAGE_REGISTER");
                    if (message == null) {
                        message = "";
                    }
                %>
                <br/>
                <h2 style="color: green; text-align: center"><%= message%></h2>

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
                                            <input type="email" class="form-control" placeholder="Email" name="email" id="email"/>
                                            <i class="ace-icon fa fa-envelope"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="text" class="form-control" placeholder="Username" name="username" id="username"/>
                                            <i class="ace-icon fa fa-user"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="text" class="form-control" placeholder="Fullname" name="fullname" id="fullname"/>
                                            <i class="ace-icon fa fa-user"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="password" class="form-control" placeholder="Password" name="password" id="password"/>
                                            <i class="ace-icon fa fa-lock"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="password" class="form-control" placeholder="Repeat password" name="confirm" id="confirm"/>
                                            <i class="ace-icon fa fa-retweet"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="number" class="form-control" placeholder="Phone number" name="phone" id="phone"/>
                                            <i class="ace-icon fa fa-phone"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            <input type="text" class="form-control" placeholder="Address" name="address" id="address" />
                                            <i class="ace-icon fa fa-book"></i>
                                        </span>
                                    </label>

                                    <label class="block clearfix">
                                        <span class="block input-icon input-icon-right">
                                            Role: 
                                            <select name="role">
                                                <option value="MA">Admin</option>
                                                <option value="CUS">Customer</option>
                                            </select>
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
    </body>
</html>
