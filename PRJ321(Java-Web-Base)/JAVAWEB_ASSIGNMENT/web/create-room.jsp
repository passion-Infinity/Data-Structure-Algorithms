<%-- 
    Document   : create-room
    Created on : Nov 4, 2020, 9:49:34 PM
    Author     : User
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%@include file="common/table-header.jsp" %>

        <div class="login-container">
            <div class="center">
                <h1>
                    <span class="red">Create new Room</span>
                </h1>
            </div>
            <div class="position-relative">

                <div id="signup-box" class="signup-box widget-box no-border">
                    <div class="widget-body">
                        <div class="widget-main">
                            <form action="MainController" method="POST" enctype="multipart/form-data">
                                <fieldset>
                                    <label class="block clearfix">
                                        <strong>Room ID</strong>
                                        <input type="text" class="form-control" placeholder="RoomID" name="roomID"  required=""/>
                                    </label>

                                    <h4 style="color: red">${requestScope.ERROR.roomIDError}</h4>

                                    <div class="space-10"></div>

                                    <label class="block clearfix">
                                        <c:set var="listType" value="${sessionScope.LIST_TYPE}"></c:set>
                                            <strong>RoomType</strong>
                                            <select name="cmbRoom" class="form-control">
                                            <c:forEach var="type" items="${listType}">
                                                <option>${type}</option>
                                            </c:forEach>
                                        </select>
                                    </label>

                                    <div class="space-10"></div>

                                    <label class="block clearfix">
                                        <strong>Room name</strong>
                                        <input type="text" class="form-control" placeholder="RoomName" name="roomName" required=""/>
                                    </label>

                                    <div class="space-10"></div>

                                    <label class="block clearfix">
                                        <strong>Room floor</strong>
                                        <input type="number" min="0" max="10" class="form-control" placeholder="RoomFloor" name="roomFloor"  required=""/>
                                    </label>

                                    <div class="space-10"></div>

                                    <label class="block clearfix">
                                        <strong>Quantity</strong>
                                        <input type="number" min="1" class="form-control" placeholder="Quantity" name="quantity" required=""/>
                                    </label>

                                    <div class="space-10"></div>

                                    <label class="block clearfix">
                                        <strong>Price</strong>
                                        <input type="text" class="form-control" placeholder="Price" name="price" required=""/>
                                    </label>

                                    <h4 style="color: red">${requestScope.ERROR.priceError}</h4>

                                    <div class="space-10"></div>

                                    <label class="block clearfix">
                                        <strong>Number of people</strong>
                                        <input type="number" min="1" class="form-control" placeholder="Number of people" name="numberOfPersons" required=""/>
                                    </label>

                                    <div class="space-10"></div>

                                    <label class="block clearfix">
                                        <strong>Image</strong>     
                                        <input type="file" class="form-control"  name="file"/>
                                    </label>

                                    <div class="space-10"></div>

                                    <label class="block clearfix">
                                        <strong>Status</strong>      
                                        <select name="cmbStatus" class="form-control">
                                            <option>true</option>
                                            <option>false</option>
                                        </select>
                                    </label>

                                    <div class="space-16"></div>

                                    <div class="clearfix">
                                        <button type="reset" class="width-30 pull-left btn btn-sm">
                                            <i class="ace-icon fa fa-refresh"></i>
                                            <span class="bigger-110">Reset</span>
                                        </button>

                                        <button type="submit" class="width-65 pull-right btn btn-sm btn-success" name="btnAction" value="Create_room">
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

        <%@include file="common/table-footer.jsp" %>
    </body>
</html>
