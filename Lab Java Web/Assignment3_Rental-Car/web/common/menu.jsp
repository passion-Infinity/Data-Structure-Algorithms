<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--MENUNAV-->
<div id="menunav">
    <div class="container">
        <nav>
            <div class="home pull-left">
                <a href="MainController?btnAction=Search">Trang chủ</a>
            </div>
            <!--menu main-->
            <ul id="menu-main">
                <li>
                    <a href="">Danh Mục</a>
                </li>
            </ul>
            <!-- end menu main-->

            <!--Shopping-->
            <ul class="pull-right" id="main-shopping">
                <li>
                    <a href="MainController?btnAction=View_Cart_Page"><i class="fas fa-shopping-cart"></i> Danh sách thuê xe </a>
                </li>
            </ul>
            <!--end Shopping-->
        </nav>
    </div>
</div>
<!--ENDMENUNAV-->