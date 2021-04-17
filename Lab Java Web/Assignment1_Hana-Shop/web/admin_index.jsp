<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title>Index Page</title>

        <meta name="description" content="Dynamic tables and grids using jqGrid plugin" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/font-awesome/4.2.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="assets/fonts/fonts.googleapis.com.css" />
        <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
    </head>

    <body class="no-skin">
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            session.setAttribute("ADMIN_PRODUCT", null);
        %>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="MainController?btnAction=Search" />
        </c:if>
        <c:if test="${param.btnAction == null}">
            <c:redirect url="MainController?btnAction=Admin_Index_Page" />
        </c:if>
        
        
        <div id="navbar" class="navbar navbar-default">
            <div class="navbar-container" id="navbar-container">
                <div class="navbar-header pull-left">
                    <a href="MainController?btnAction=Admin_Index_Page" class="navbar-brand">
                        <small>
                            <i class="fa fa-leaf"></i>
                            Hana Shop Admin
                        </small>
                    </a>
                </div>

                <div class="navbar-buttons navbar-header pull-right" role="navigation">
                    <ul class="nav ace-nav">
                        <li class="light-blue">
                            <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                                <span class="user-profile">
                                    <small style="font-size: 14px">Welcome,</small>
                                    <strong style="color: #D00;font-size: 18px">${sessionScope.LOGIN_USER.fullName}</strong>
                                </span>

                                <i class="ace-icon fa fa-caret-down"></i>
                            </a>

                            <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                                <li>
                                    <a href="MainController?btnAction=Logout">
                                        <i class="ace-icon fa fa-power-off"></i>
                                        Logout
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div><!-- /.navbar-container -->
        </div>

        <div class="main-container" id="main-container">
            <div id="sidebar" class="sidebar                  responsive">
                <ul class="nav nav-list">
                    <li class="">
                        <a href="MainController?btnAction=Admin_Index_Page">
                            <i class="menu-icon fa fa-tachometer"></i>
                            <span class="menu-text"> Dashboard </span>
                        </a>
                    </li>

                    <li class="active open">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-list"></i>
                            <span class="menu-text"> Products </span>

                            <b class="arrow fa fa-angle-down"></b>
                        </a>

                        <b class="arrow"></b>

                        <ul class="submenu">
                            <li class="">
                                <a href="MainController?btnAction=Admin_Product_List_Page">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Products List
                                </a>

                                <b class="arrow"></b>
                            </li>

                            <li class="">
                                <a href="MainController?btnAction=Search">
                                    <i class="menu-icon fa fa-caret-right"></i>
                                    Products Management
                                </a>

                                <b class="arrow"></b>
                            </li>
                        </ul>
                    </li>
                </ul><!-- /.nav-list -->
            </div>

            <div class="main-content">
                <div class="main-content-inner">
                    <div class="breadcrumbs" id="breadcrumbs">
                        <ul class="breadcrumb">
                            <li>
                                <i class="ace-icon fa fa-home home-icon"></i>
                                <a href="MainController?btnAction=Admin_Index_Page">Home</a>
                            </li>
                        </ul><!-- /.breadcrumb -->
                    </div>
                </div>
            </div><!-- /.main-content -->



            <jsp:include page="common/admin_footer.jsp" />
        </div><!-- /.main-container -->

        <script src="assets/js/jquery.2.1.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/ace.min.js"></script>
    </body>
</html>

