<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--HEADER-->
<div id="header">
    <div id="header-top" class="header">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-6" id="header-text">
                    <a>THUÊ XE</a><b>Thuê xe giá rẻ, tiện lợi, và an toàn  </b>
                </div>
                <div class="col-md-6">
                    <nav id="header-nav-top">
                        <ul class="list-inline pull-right" id="headermenu">
                            <c:if test="${sessionScope.customer == null}">
                                <li>
                                    <a href="MainController?btnAction=Login_Page" id="signin"><i class="fa fa-unlock"></i> Đăng nhập</a>
                                </li> 
                                <li>
                                    <a href="MainController?btnAction=Register_Page"><i class="fa fa-unlock"></i> Đăng ký</a>
                                </li> 
                            </c:if>
                            <c:if test="${sessionScope.customer != null}">
                                <li>
                                    <p href="MainController?btnAction=Search"><i class="fa fa-user"></i> ${sessionScope.customer.fullname} <i class="fa fa-caret-down"></i></p>
                                    <ul id="header-submenu">
                                        <li><a href="MainController?btnAction=GetHistory">History</a></li>
                                        <li><a href="MainController?btnAction=Logout">Đăng xuất</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="MainController?btnAction=Logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container">
            <div>
                <p class="logo"><strong class="logo color-red">THUÊ</strong> XE</p>
            </div>
        </div>
    </div>
</div>
<!--END HEADER-->
