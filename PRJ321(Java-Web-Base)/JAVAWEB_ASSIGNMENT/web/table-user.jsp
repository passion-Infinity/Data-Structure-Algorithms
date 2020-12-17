<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="danhnlc.dtos.UserError"%>
<%@page import="danhnlc.dtos.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tables - Admin</title>

        <meta name="description" content="Static &amp; Dynamic Tables" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/font-awesome/4.2.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="assets/fonts/fonts.googleapis.com.css" />
        <link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

        <script src="assets/js/ace-extra.min.js"></script>

    </head>
    <body class="no-skin">
        <%@include file="common/table-header.jsp" %>

        <div class="row">
            <div class="col-xs-12">

                <!-- PAGE CONTENT BEGINS -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="clearfix">
                            <div class="pull-right tableTools-container"></div>
                        </div>
                        <div class="table-header">
                            Table - User
                        </div>
                        
                        <c:set var="listUser" value="${sessionScope.LIST_USER}"></c:set>
                        <c:if test="${not empty listUser}">
                        <div>
                            <table  class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th class="center">No</th>
                                        <th class="center">Username</th>
                                        <th class="center">Fullname</th>
                                        <th class="center">Password</th>
                                        <th class="center">Email</th>
                                        <th class="center">Phone</th>
                                        <th class="center">Address</th>
                                        <th class="center">RoleID</th>
                                        <th class="center">
                                            <form action="MainController">
                                                <div class="hidden-sm hidden-xs action-buttons">
                                                    <a class="blue" href="MainController?btnAction=Admin_signup_page">
                                                        <i class="ace-icon fa fa-search-plus bigger-130"></i>
                                                    </a>

                                                    <a class="green" href="#modal-table" role="button" class="green" data-toggle="modal">
                                                        <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                    </a>

                                                    <button class="btn-danger" type="submit" name="btnAction" value="Delete_user">
                                                        <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                    </button>   
                                                </div>
                                        </th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="user" items="${listUser}" varStatus="counter">
                                    <tr>
                                        <td class="center">${counter.count}</td>
                                        <td class="center">${user.username}</td>
                                        <td class="center">${user.fullname}</td>
                                        <td class="center">${user.password}</td>
                                        <td class="center">${user.email}</td>
                                        <td class="center">${user.phone}</td>
                                        <td class="center">${user.address}</td>
                                        <td class="center">${user.roleID}</td>
                                        <td class="center">
                                            <label class="pos-rel">
                                                <input type="checkbox" class="ace" name="remove" value="${user.username}"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </form>
                                </tbody>
                            </table>
                        </div>
                        <c:if test="${sessionScope.DELETE_SUCCESS != null}">
                        <script type="text/javascript">
                            alert("DELETE SUCCESSFULLY!");
                        </script>
                        </c:if>
                    </div>
                </div>

                <h2 style="color: #cc0000">${sessionScope.ERROR_TITLE}</h2>
                ${sessionScope.ERROR.fullnameError}<br/>
                ${sessionScope.ERROR.emailError}<br/>
                ${sessionScope.ERROR.phoneError}<br/>
                ${sessionScope.ERROR.addressError}<br/>
                ${sessionScope.ERROR.roleIDError}<br/>
                

                <div id="modal-table" class="modal fade"  tabindex="-1">
                    <div style="margin-top: 200px" >
                        <div class="modal-content modal-dialog" style="width: 95%; margin: 0 auto">
                            <div class="modal-header no-padding">
                                <div class="table-header">
                                    <button type="button" class="close" aria-hidden="true" data-dismiss="modal">
                                        <span class="white">&times;</span>
                                    </button>
                                    Update User
                                </div>
                            </div>

                            <div class="modal-body no-padding">
                                <table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
                                    <thead>

                                        <tr>
                                            <th class="center">No</th>
                                            <th class="center">Username</th>
                                            <th class="center">Fullname</th>
                                            <th class="center">Password</th>
                                            <th class="center">Email</th>
                                            <th class="center">Phone</th>
                                            <th class="center">Address</th>
                                            <th class="center">RoleID</th>
                                            <th class="center"></th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <c:forEach var="user" items="${listUser}" varStatus="counter">
                                    <form action="MainController" method="POST">
                                        <tr>
                                            <td class="center">${counter.count}</td>
                                            <td class="center">
                                                ${user.username}
                                                <input type="hidden" name="username" value="${user.username}"/>
                                            </td>
                                            <td class="center">
                                                <input type="text" name="fullname" value="${user.fullname}" size="25" />
                                            </td>
                                            <td class="center">
                                                ${user.password}
                                            </td>
                                            <td class="center">
                                                <input type="email" name="email" value="${user.email}" size="30" />
                                            </td>
                                            <td class="center">
                                                <input type="number" name="phone" value="${user.phone}" />
                                            </td>
                                            <td class="center">
                                                <input type="text" name="address" value="${user.address}"/>
                                            </td>
                                            <td class="center">
                                                <input type="text" name="role" value="${user.roleID}" />
                                            </td>
                                            <td class="center">
                                                <button class="btn btn-sm btn-success pull_up" type="submit" name="btnAction" value="Update_user">
                                                    Update
                                                </button>
                                            </td>
                                        </tr>
                                    </form>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <c:if test="${sessionScope.UPDATE_SUCCESS != null}">
                            <script type = "text/javascript">
                                alert("UPDATE SUCCESSFULLY!!!");
                            </script>
                            </c:if>

                            <div class="modal-footer no-margin-top">
                                <button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
                                    <i class="ace-icon fa fa-times"></i>
                                    Close
                                </button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- PAGE CONTENT ENDS -->
                </c:if>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div>
</div><!-- /.main-content -->

<%@include file="common/table-footer.jsp" %>
</body>
</html>
