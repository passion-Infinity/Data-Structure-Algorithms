<%-- 
    Document   : table-room
    Created on : Oct 14, 2020, 10:32:41 AM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page import="danhnlc.dtos.RoomType"%>
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
        <script type = "text/javascript">
            function validateCreate_RoomTypeForm() {
                var id = document.getElementById("roomTypeID").value;
                var name = document.getElementById("roomTypeName").value;
                if (id === "") {
                    alert("RoomTypeID can not empty!");
                    return false;
                }
                if (name === "") {
                    alert("RoomTypeName can not empty!");
                    return false;
                }
                return true;
            }
        </script>
    </head>

    <body class="no-skin">
        <%@include file="common/table-header.jsp" %>

        <div class="row">
            <div class="col-xs-12">

                <div class="row">
                    <div class="col-xs-12">

                        <div class="row">
                            <div class="col-xs-12">
                                <!-- PAGE CONTENT BEGINS -->
                                <div class="clearfix">
                                    <div class="pull-right tableTools-container"></div>
                                </div>
                                <div class="table-header">
                                    Table - RoomType
                                </div>
                                <%                    List<RoomType> listRoomTypes = (List<RoomType>) session.getAttribute("LIST_ROOMTYPE");
                                    if (listRoomTypes != null) {
                                        int count = 0;
                                %>
                                <div>
                                    <table  class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="center">No</th>
                                                <th class="center">RoomTypeID</th>
                                                <th class="center">RoomTypeName</th>
                                                <!--<th class="center">Price</th>-->
                                                <th class="center">Description</th>
                                                <th class="center">
                                                    <form action="MainController">
                                                        <div class="hidden-sm hidden-xs action-buttons">
                                                            <a class="blue" href="#modal-create" role="button" class="green" data-toggle="modal">
                                                                <i class="ace-icon fa fa-search-plus bigger-130"></i>
                                                            </a>

                                                            <a class="green" href="#modal-table" role="button" class="green" data-toggle="modal">
                                                                <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                            </a>

                                                            <button class="btn-danger" type="submit" name="btnAction" value="Delete_roomType">
                                                                <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                            </button>   
                                                        </div>
                                                </th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%
                                                for (RoomType roomType : listRoomTypes) {
                                            %>
                                            <tr>
                                                <td class="center"><%= ++count%></td>
                                                <td class="center"><%= roomType.getTypeID()%></td>
                                                <td class="center"><%= roomType.getTypeName()%></td>
                                                <td class="center"><%= roomType.getDescription()%></td>
                                                <td class="center">
                                                    <label class="pos-rel">
                                                        <input type="checkbox" class="ace" name="remove" value="<%= roomType.getTypeID()%>"/>
                                                        <span class="lbl"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                            <% }%>
                                            </form>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div id="modal-table" class="modal fade" tabindex="-1">
                            <div style="margin-top: 200px">
                                <div class="modal-content">
                                    <div class="modal-header no-padding">
                                        <div class="table-header">
                                            <button type="button" class="close" aria-hidden="true" data-dismiss="modal">
                                                <span class="white">&times;</span>
                                            </button>
                                            Update RoomType
                                        </div>
                                    </div>

                                    <div class="modal-body no-padding">
                                        <table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
                                            <thead>
                                            <form action="MainController" method="POST">
                                                <tr>
                                                    <th class="center">No</th>
                                                    <th class="center">RoomTypeID</th>
                                                    <th class="center">RoomTypeName</th>
                                                    <th class="center">Description</th>
                                                    <th class="center">
                                                        <button class="btn btn-sm btn-success pull-up" type="submit" name="btnAction" value="Update_roomType">
                                                            Update
                                                        </button>
                                                    </th>
                                                </tr>
                                                </thead>

                                                <tbody>

                                                    <%
                                                        int c = 0;
                                                        for (RoomType roomType : listRoomTypes) {
                                                    %>
                                                    <tr>
                                                        <td class="center"><%= ++c%></td>
                                                        <td class="center">
                                                            <%= roomType.getTypeID()%>
                                                            <input type="hidden" name="roomTypeID" value="<%= roomType.getTypeID()%>"/>
                                                        </td>
                                                        <td class="center">
                                                            <input type="text" name="roomTypeName" value="<%= roomType.getTypeName()%>"/>
                                                        </td>
                                                        <td class="center">
                                                            <input type="text" name="description" value="<%= roomType.getDescription()%>" />
                                                        </td>
                                                        <td class="center">
                                                            <input type="checkbox" name="update" value="<%= roomType.getTypeID()%>" />
                                                        </td>
                                                    </tr>
                                                    <% }%>
                                            </form>
                                            </tbody>
                                        </table>
                                    </div>

                                    <%
                                        String updateMsg = (String) session.getAttribute("UPDATE_SUCCESS");
                                        if (updateMsg != null) {
                                    %>
                                    <script type = "text/javascript">
                                        alert("Update Successfully!");
                                    </script>
                                    <% }%>  

                                    <div class="modal-footer no-margin-top">
                                        <button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
                                            <i class="ace-icon fa fa-times"></i>
                                            Close
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- PAGE CONTENT ENDS -->
                        <% }%>

                        <div id="modal-create" class="modal fade" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header no-padding">
                                        <div class="table-header">
                                            <button type="button" class="close" aria-hidden="true" data-dismiss="modal">
                                                <span class="white">&times;</span>
                                            </button>
                                            Insert RoomType
                                        </div>
                                    </div>

                                    <div class="login-container">
                                        <div class="center">
                                            <h1>
                                                <span class="red">Create new RoomType</span>
                                            </h1>
                                        </div>
                                        <div class="position-relative">

                                            <div id="signup-box" class="signup-box widget-box no-border">
                                                <div class="widget-body">
                                                    <div class="widget-main">
                                                        <form action="MainController" method="POST"  onsubmit="return validateCreate_RoomTypeForm()">
                                                            <fieldset>
                                                                <label class="block clearfix">
                                                                    <input type="text" class="form-control" placeholder="RoomTypeID" name="roomTypeID" id="roomTypeID"/>
                                                                </label>

                                                                <label class="block clearfix">
                                                                    <input type="text" class="form-control" placeholder="RoomTypeName" name="roomTypeName" id="roomTypeName"/>
                                                                </label>

                                                                <label class="block clearfix">
                                                                    <input type="text" class="form-control" placeholder="Description" name="description"/>
                                                                </label>

                                                                <div class="space-16"></div>

                                                                <div class="clearfix">
                                                                    <button type="reset" class="width-30 pull-left btn btn-sm">
                                                                        <i class="ace-icon fa fa-refresh"></i>
                                                                        <span class="bigger-110">Reset</span>
                                                                    </button>

                                                                    <button type="submit" class="width-65 pull-right btn btn-sm btn-success" name="btnAction" value="Create_roomType">
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

                                    <%
                                        String update_success = (String) request.getAttribute("MESSAGE_CREATE_ROOMTYPE");
                                        if (update_success != null) {
                                    %>
                                    <script type = "text/javascript">
                                        alert("Create Successfully!");
                                    </script>
                                    <% }%>  

                                    <div class="modal-footer no-margin-top">
                                        <button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
                                            <i class="ace-icon fa fa-times"></i>
                                            Close
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div><!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <%@include file="common/table-footer.jsp" %>
</body>
</html>
