<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <title>Tables - Ace Admin</title>

        <meta name="description" content="Static &amp; Dynamic Tables" />
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
        %>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.role != 'admin'}">
            <c:redirect url="MainController?btnAction=Search" />
        </c:if>

        <c:if test="${param.btnAction == null}">
            <c:redirect url="MainController?btnAction=Product_Manager_Page" />
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
                    </div>

                    <div class="page-content">
                        <div class="page-header">
                            <h1>
                                Tables
                                <small>
                                    <i class="ace-icon fa fa-angle-double-right"></i>
                                    Product List
                                </small>
                            </h1>
                            <h4 style="color: green; margin-left: 10px; text-align: center"><strong>${requestScope.SUCCESS}</strong></h4>
                        </div><!-- /.page-header -->

                        <div class="col-md-3 header-right">
                            <div class="search-bar">
                                <form action="MainController">
                                    <input class="input-sm"
                                           type="text"
                                           name="txtSearch"
                                           value="${sessionScope.SEARCH}"
                                           placeholder="Search" />
                                    <input class="btn-info" style="font-size: 15px; margin-top: 3px; padding:0 7px 3px 7px" type="submit" name="btnAction" value="Search"/>
                                </form>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                        <br/>

                        <div class="row">
                            <div class="col-xs-12">
                                <!-- PAGE CONTENT BEGINS -->
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="table-header">
                                            Product List
                                        </div>

                                        <div>
                                            <c:set var="listProduct" value="${sessionScope.LIST}" />
                                            <c:if test="${not empty listProduct}">
                                                <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th class="center">
                                                                <label class="pos-rel">
                                                                    <input type="checkbox" class="ace"  onclick="return toggle(this)" />
                                                                    <span class="lbl"></span>
                                                                </label>
                                                            </th>
                                                            <th class="center">STT</th>
                                                            <th>ProductCode</th>
                                                            <th>ProductName</th>
                                                            <th>Description</th>
                                                            <th>Image</th>
                                                            <th>Quantity</th>
                                                            <th>Price</th>
                                                            <th>CreatedDate</th>
                                                            <th>CreatedBy</th>
                                                            <th>ModifiedDate</th>
                                                            <th>ModifiedBy</th>
                                                            <th>Status</th>
                                                    <form action="MainController" >
                                                        <th class="center">
                                                            <div style="display: inline-block; ">
                                                                <a class="blue" href="MainController?btnAction=Create_Page">
                                                                    <i class="ace-icon fa fa-search-plus bigger-190"></i>
                                                                </a>
                                                            </div>

                                                            <div style="display: inline-block" class="hidden-sm hidden-xs action-buttons center">
                                                                <button class="btn-danger" type="submit" name="btnAction" value="Delete_Product" onclick="return comfirmToDelete()">
                                                                    <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                                </button> 
                                                            </div>
                                                        </th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="product" items="${listProduct}" varStatus="counter">
                                                                <tr>
                                                                    <td class="center">
                                                                        <label class="pos-rel">
                                                                            <input type="checkbox" class="ace" name="checkFood" value="${product.productCode}" />
                                                                            <span class="lbl"></span>
                                                                        </label>
                                                                    </td>
                                                                    <td class="center">
                                                                        ${counter.count}
                                                                        
                                                                    </td>

                                                                    <td>
                                                                        ${product.productCode}
                                                                        <input type="hidden" name="productCode" value="${product.productCode}"/>
                                                                    </td>
                                                                    <td>
                                                                        ${product.productName}
                                                                        <input type="hidden" name="productName" value="${product.productName}"/>
                                                                    </td>
                                                                    <td>
                                                                        ${product.description}
                                                                        <input type="hidden" name="description" value="${product.description}"/>
                                                                    </td>
                                                                    <td>
                                                                        <img src="${product.image}" width="125" />
                                                                        <input type="hidden" name="image" value="${product.image}"/>
                                                                    </td>
                                                                    <td>
                                                                        ${product.quantity}
                                                                        <input type="hidden" name="quantity" value="${product.quantity}"/>
                                                                    </td>
                                                                    <td>
                                                                        ${product.price}
                                                                        <input type="hidden" name="price" value="${product.price}"/>
                                                                    </td>
                                                                    <td>
                                                                        ${product.createdDate}
                                                                        <input type="hidden" name="date" value="${product.createdDate}"/>
                                                                    </td>
                                                                    <td>
                                                                        ${product.createdBy}
                                                                        <input type="hidden" name="who" value="${product.createdBy}"/>
                                                                    </td>
                                                                    <td>
                                                                        ${product.modifiedDate}
                                                                        <input type="hidden" name="dateChange" value="${product.modifiedDate}"/>
                                                                    </td>
                                                                    <td>
                                                                        ${product.modifiedBy}
                                                                        <input type="hidden" name="whoChange" value="${product.modifiedBy}"/>
                                                                    </td>
                                                                    <td>
                                                                        <select name="comboxStatus">
                                                                            <c:if test="${product.status}">
                                                                                <option value="true" selected="true">Actived</option>
                                                                                <option value="false">Disabled</option>
                                                                            </c:if>
                                                                            <c:if test="${!product.status}">
                                                                                <option value="true">Actived</option>
                                                                                <option value="false" selected="true">Disabled</option>
                                                                            </c:if>    
                                                                        </select>
                                                                    </td>
                                                                    <td>
                                                                        <input type="hidden" name="txtSearch" value="" />
                                                                        
                                                                        <div class="hidden-sm hidden-xs action-buttons center">
                                                                            <a href="MainController?btnAction=Edit&productCode=${product.productCode}&indexpage=${requestScope.INDEX_PAGE}&txtSearch=${sessionScope.SEARCH}" class="tooltip-success" data-rel="tooltip" title="Edit">
                                                                                <span class="green">
                                                                                    <i class="ace-icon fa fa-pencil-square-o bigger-250"></i>
                                                                                </span>
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                    </form>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                        </div>
                                        <div class="space-24"></div>
                                    </div>
                                </div>
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                        <!--Start-product-Paging-->
                        <div class="container" style="text-align: center">
                            <ul class="pagination pagination-lg">
                                <c:forEach begin="1" end="${sessionScope.END_PAGE}" var="i">
                                    <li class="page-item ${(requestScope.INDEX_PAGE == i) ? "active":""}"><a href="MainController?btnAction=Search&index=${i}&txtSearch=${sessionScope.SEARCH}" class="page-link">${i}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                        <!--End-product-Paging-->
                    </div><!-- /.page-content -->
                </div>
            </div><!-- /.main-content -->

            <jsp:include page="common/admin_footer.jsp" />
        </div><!-- /.main-container -->

        <script>
            function toggle(source) {
                checkboxes = document.getElementsByName('checkFood');
                for (var i = 0, n = checkboxes.length; i < n; i++) {
                    checkboxes[i].checked = source.checked;
                }
            }
            
            function comfirmToDelete() {
                var r = confirm("Do you want to delete?")
                if(r === true) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
        <script src="assets/js/jquery.2.1.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
        <script src="assets/js/ace.min.js"></script>
    </body>
</html>

