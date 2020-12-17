<%-- 
    Document   : index
    Created on : Oct 12, 2020, 1:31:03 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="common/head-page.jsp" %>
        <title>Resort - Page</title>
    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <!-- Header Section Begin -->
        <header class="header-section">
            <div class="container-fluid">
                <div class="inner-header">
                    <div class="logo">
                        <a href="#"><img src="img/logo.png" alt=""></a>
                    </div>
                    <div style="margin-left: 4px" class="nav-right">
                        <a href="MainController?btnAction=Signup_Page" class="primary-btn">Sign up</a>
                    </div>
                    <div class="nav-right">
                        <a href="MainController?btnAction=Login_Page" class="primary-btn">Sign in</a>
                    </div>
                    <nav class="main-menu mobile-menu">
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Rooms</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="drop-menu">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Rooms</a></li>
                                    <li><a href="#">Services</a></li>
                                </ul>
                            </li>
                            <li><a href="#">News</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </nav>
                    <div id="mobile-menu-wrap"></div>
                </div>
            </div>
        </header>
        <!-- Header End -->

        <!-- Hero Area Section Begin -->
        <section class="hero-area set-bg" data-setbg="img/hero-bg.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="hero-text">
                            <h1>A Luxury Stay</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Area Section End -->

        <%@include file="common/footer-page.jsp" %>
    </body>
</html>
