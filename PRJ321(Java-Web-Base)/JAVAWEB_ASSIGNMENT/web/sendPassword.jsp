<%-- 
    Document   : sendPassword
    Created on : Nov 4, 2020, 10:34:12 AM
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
                            <a href="MainController?btnAction=Login_Page" data-target="#login-box" class="back-to-login-link">
                                <i class="ace-icon fa fa-arrow-left"></i>
                                Back to login
                            </a>
                        </div>
                    </div><!-- /.widget-body -->
                </div><!-- /.forgot-box -->
            </div><!-- /.position-relative -->
        </div>
    </body>
</html>
