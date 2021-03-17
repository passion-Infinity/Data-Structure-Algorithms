<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create - Page</title>

        <meta name="description" content="Static &amp; Dynamic Tables" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/font-awesome/4.2.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="assets/fonts/fonts.googleapis.com.css" />
        <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
        <script src="assets/js/ace-extra.min.js"></script>
    </head>
    <body class="no-skin">
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="index.jsp" />
        </c:if>

        <c:if test="${param.btnAction == null}">
            <c:redirect url="MainController?btnAction=Create_Page" />
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
                                <a href="#">
                                    <i class="ace-icon fa fa-cog"></i>
                                    Settings
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <i class="ace-icon fa fa-user"></i>
                                    Profile
                                </a>
                            </li>

                            <li class="divider"></li>

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

                        <li class="active">
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
                    <script type="text/javascript">
                        try {
                            ace.settings.check('breadcrumbs', 'fixed')
                        } catch (e) {
                        }
                    </script>

                    <ul class="breadcrumb">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="MainController?btnAction=Admin_Index_Page">Home</a>
                        </li>

                        <li>
                            <a href="#">Tables</a>
                        </li>
                        <li class="active">Product Management</li>
                    </ul><!-- /.breadcrumb -->

                    <div class="nav-search" id="nav-search">
                        <form class="form-search">
                            <span class="input-icon">
                                <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                                <i class="ace-icon fa fa-search nav-search-icon"></i>
                            </span>
                        </form>
                    </div><!-- /.nav-search -->
                </div>

                <div class="login-container">
                    <div class="center">
                        <h1>
                            <span class="red">Create New Product</span>
                        </h1>
                    </div>
                    <div class="position-relative">

                        <div id="signup-box" class="signup-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <form action="MainController" method="POST" enctype="multipart/form-data">
                                        <fieldset>
                                            <label class="block clearfix">
                                                <strong>ProductCode</strong>
                                                <input type="text" class="form-control" placeholder="A001, B125,..." name="productCode"  required="" value="${requestScope.productCode}"/>
                                            </label>

                                            <h5 style="color: red; margin-left: 10px">${requestScope.ERROR.productCodeError}</h5>
                                            <h5 style="color: red; margin-left: 10px">${requestScope.DUPLICATE}</h5>

                                            <div class="space-10"></div>

                                            <label class="block clearfix">
                                                <strong>ProductName</strong>
                                                <input type="text" class="form-control" placeholder="Rau xao, mi xao,..." name="productName" required="" value="${requestScope.productName}"/>
                                            </label>
                                            
                                            <h5 style="color: red; margin-left: 10px">${requestScope.ERROR.productNameError}</h5>

                                            <div class="space-10"></div>

                                            <label class="block clearfix">
                                                <strong>Description</strong>
                                                <input type="text" class="form-control" placeholder="Enter..." name="description" required="" value="${requestScope.description}"/>
                                            </label>
                                            
                                            <h5 style="color: red; margin-left: 10px">${requestScope.ERROR.descriptionError}</h5>

                                            <div class="space-10 block clearfix"></div>

                                            <p><input type="file"  accept="image/*" name="file" id="file"  onchange="loadFile(event); $('#upload-file-info').html(this.files[0].name)" style="display: none;"></p>
                                            <p><label for="file" style="cursor: pointer;" class="btn btn-info">Upload Image</label></p>
                                            <p><img id="output" width="125"/></p>
                                            <p class="label label-info" id="upload-file-info"></p>
                                            <script>
                                                var loadFile = function (event) {
                                                    var image = document.getElementById('output');
                                                    image.src = URL.createObjectURL(event.target.files[0]);
                                                };
                                            </script>


                                            <label class="block clearfix">
                                                <strong>Quantity</strong>
                                                <input type="number" min="1" class="form-control" placeholder="1,2,3..." name="quantity" required="" value="${requestScope.quantity}"/>
                                            </label>

                                            <div class="space-10"></div>

                                            <label class="block clearfix">
                                                <strong>Price</strong>
                                                <input type="text" class="form-control" placeholder="99.9" name="price" required="" value="${requestScope.price}"/>
                                            </label>

                                            <h5 style="color: red; margin-left: 10px">${requestScope.ERROR.priceError}</h5>

                                            <div class="space-16"></div>
                                            
                                            <h4 style="color: green; margin-left: 10px; text-align: center"><strong>${requestScope.SUCCESS}</strong></h4>
                                            
                                            <div class="space-16"></div>

                                            <div class="clearfix">
                                                <button type="reset" class="width-30 pull-left btn btn-sm">
                                                    <i class="ace-icon fa fa-refresh"></i>
                                                    <span class="bigger-110">Reset</span>
                                                </button>

                                                <button type="submit" class="width-65 pull-right btn btn-sm btn-success" name="btnAction" value="Create_Product">
                                                    <span class="bigger-110" >Create</span>
                                                    <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                                </button>
                                            </div>


                                        </fieldset>
                                    </form>
                                </div>
                            </div><!-- /.widget-body -->
                        </div><!-- /.signup-box -->
                    </div><!-- /.position-relative -->
                </div>
            </div>
        </div><jsp:include page="common/admin_footer.jsp" />
        <jsp:include page="common/admin_footer.jsp" />
    </div>
    <script src="assets/js/jquery.2.1.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/ace.min.js"></script>
</body>
</html>
