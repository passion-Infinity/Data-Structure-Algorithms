<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="danhnlc.dtos.Room"%>
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
        <script type="text/javascript">
            function validateForm() {
                var price = document.getElementById('price').value;
                if (price <= 0) {
                    window.alert("Price is not less than or equal 0");
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
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="clearfix">
                            <div class="pull-right tableTools-container"></div>
                        </div>
                        <div class="table-header">
                            Table - Room
                        </div>

                        <c:set var="listRoom" value="${sessionScope.LIST_ROOM}"></c:set>
                        <c:if test="${not empty listRoom}">
                            <div>
                                <table  class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th class="center">No</th>
                                            <th class="center">RoomID</th>
                                            <th class="center">RoomTyeID</th>
                                            <th class="center">RoomName</th>
                                            <th class="center"> RoomFloor</th>
                                            <th class="center"> Quantity</th>
                                            <th class="center">Price</th>
                                            <th class="center">NumberOfPersons</th>
                                            <th class="center">PathImage</th>
                                            <th class="center">Status</th>
                                            <th class="center">
                                                <form action="MainController">
                                                    <div class="hidden-sm hidden-xs action-buttons">
                                                        <a class="blue" href="MainController?btnAction=InsertRoomPage" role="button" class="green">
                                                            <i class="ace-icon fa fa-search-plus bigger-130"></i>
                                                        </a>

                                                        <a class="green" href="#modal-table" role="button" class="green" data-toggle="modal">
                                                            <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                        </a>

                                                        <button class="btn-danger" type="submit" name="btnAction" value="Delete_room">
                                                            <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                        </button>   
                                                    </div>
                                            </th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach var="room" items="${listRoom}" varStatus="counter">
                                            <tr>
                                                <td class="center">${counter.count}</td>
                                                <td class="center">${room.roomID}</td>
                                                <td class="center">${room.typeID}</td>
                                                <td class="center">${room.roomName}</td>
                                                <td class="center">${room.roomFloor}</td>
                                                <td class="center">${room.quantity}</td>
                                                <td class="center">${room.price}</td>
                                                <td class="center">${room.numberOfPersons}</td>
                                                <td class="center">${room.image}</td>
                                                <td class="center">${room.status}</td>
                                                <td class="center">
                                                    <label class="pos-rel">
                                                        <input type="checkbox" class="ace" name="remove" value="${room.roomID}"/>
                                                        <span class="lbl"></span>
                                                    </label>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </form>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <c:if test="${sessionScope.DELETE_SUCCESS != null}">
                        <script type="text/javascript">
                            window.alert("DELETE SUCCESSFULLY!");
                        </script>
                    </c:if>

                    <div class="space-28"></div>        

                    <c:set var="create" value="${sessionScope.CREATE_SUCCESS}"></c:set>
                    <c:set var="create_room" value="${sessionScope.ROOM}"></c:set>
                    <c:if test="${not empty create}">
                        <h2 class="green">${create}</h2>
                        <h3 class="blue">You just have added new room: </h3>
                        RoomID:  <strong>${create_room.roomID}</strong><br/>
                        RoomTypeID:  <strong>${create_room.typeID}</strong><br/>
                        RoomName:  <strong>${create_room.roomName}</strong><br/>
                        RoomFloor:  <strong>${create_room.roomFloor}</strong><br/>
                        Quantity:  <strong>${create_room.quantity}</strong><br/>
                        Price:  <strong>${create_room.price}</strong><br/>
                        Number Of people:  <strong>${create_room.numberOfPersons}</strong><br/> 
                        Image:  <strong>${create_room.image}</strong><br/>
                        Status:  <strong>${create_room.status}</strong><br/>
                    </c:if>

                    <div id="modal-table" class="modal fade" tabindex="-1">
                        <div style="margin-top: 100px">
                            <div class="modal-content modal-dialog" style="width: 95%; margin: 0 auto">
                                <div class="modal-header no-padding">
                                    <div class="table-header">
                                        <button type="button" class="close" aria-hidden="true" data-dismiss="modal">
                                            <span class="white">&times;</span>
                                        </button>
                                        Update Room
                                    </div>
                                </div>

                                <div class="modal-body no-padding">
                                    <table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
                                        <thead>
                                            <tr>
                                                <th class="center">No</th>
                                                <th class="center">RoomID</th>
                                                <th class="center">RoomTyeID</th>
                                                <th class="center">RoomName</th>
                                                <th class="center"> RoomFloor</th>
                                                <th class="center"> Quantity</th>
                                                <th class="center">Price</th>
                                                <th class="center">NumberOfPersons</th>
                                                <th class="center">PathImage</th>
                                                <th class="center">Status</th>
                                                <th class="center"></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach var="room" items="${listRoom}" varStatus="counter">
                                            <form action="MainController" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">
                                                <tr>
                                                    <td class="center">${counter.count}</td>
                                                    <td class="center">
                                                        ${room.roomID}
                                                        <input type="hidden" name="roomID" value="${room.roomID}"/>
                                                    </td>
                                                    <td class="center">
                                                        <input type="text"  value="${room.typeID}" readonly="   "/>
                                                        <c:set var="listType" value="${sessionScope.LIST_TYPE}"></c:set>
                                                            <select name="typeID">
                                                            <c:forEach var="type" items="${listType}">
                                                                <option>${type}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>

                                                    <td class="center">
                                                        <input type="text" name="roomName" value="${room.roomName}" required=""/>
                                                    </td>
                                                    <td class="center">
                                                        <input type="number" min="0" name="roomFloor" value="${room.roomFloor}" required=""/>
                                                    </td>
                                                    <td class="center">
                                                        <input type="number" min="1" name="quantity" value="${room.quantity}" required=""/>
                                                    </td>
                                                    <td class="center">
                                                        <input type="text" name="price" value="${room.price}" required="" id="price"/>
                                                    </td>
                                                    <td class="center">
                                                        <input type="number" min="1" name="numberOfPersons" value="${room.numberOfPersons}" required=""/>
                                                    </td>
                                                    <td class="center">
                                                        <input type="text" name="image" value="${room.image}" readonly="" size="35"/>
                                                        <input type="file" name="file"/>
                                                    </td>
                                                    <td class="center">
                                                        <input type="text" value="${room.status}" readonly=""/>
                                                        <select name="status">
                                                            <option>true</option>
                                                            <option>false</option>
                                                        </select>
                                                    </td>
                                                    <td class="center">
                                                        <button class="btn btn-sm btn-success pull_up" type="submit" name="btnAction" value="Update_room">
                                                            Update
                                                        </button>
                                                    </td>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <c:if test="${requestScope.ERROR != null}">
                                    <script type = "text/javascript">
                                        alert("Price is not valid!");
                                    </script>
                                </c:if>
                                <c:if test="${sessionScope.UPDATE_SUCCESS != null}">
                                    <script type = "text/javascript">
                                        alert("Update Successfully!");
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
