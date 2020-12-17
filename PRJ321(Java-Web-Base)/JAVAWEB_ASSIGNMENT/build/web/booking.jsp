<%@page import="danhnlc.dtos.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking - Page</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>

        <script type="text/javascript">
            function validateDateForm() {
                var date1 = document.getElementById('date1').value;
                var date2 = document.getElementById('date2').value;
                var checkDate1 = new Date(date1);
                var checkDate2 = new Date(date2);

                if (checkDate1 > checkDate2) {
                    window.alert("'Date From' has to less or equal 'Date To'");
                    return false;
                }
                return true;
            }
        </script>

        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            User user = (User) session.getAttribute("LOGIN_USER");

            if (user == null) {
                response.sendRedirect("index.jsp");
            } else if (!user.getRoleID().equals("CUS")) {
                response.sendRedirect("index.jsp");
            }
        %>

        <a style="font-weight: bold; margin-left: 95%; margin-top: 5px" class="btn btn-default" href="MainController?btnAction=Logout">Log out</a>

        <div class="container" style="margin-top: 5px; text-align: center  ">
            <h1 style="font-weight: 800; color: red">Booking Resort</h1><br/>
            <form action="MainController" onsubmit="return validateDateForm()">
                <label style="font-size: 18px">Date From: </label>
                <input type="date" name="dateFrom" value="${param.dateFrom}" id="date1"/>
                <label style="font-size: 18px">Date To: </label>
                <input type="date" name="dateTo" value="${param.dateTo}" id="date2"/>   
                <input style="font-size: 18px" type="submit" name="btnAction" value="Search" />
            </form>

            <br/><br/>
            <h3 style="color: green">${requestScope.MESSAGE_SUCCES}</h3>
            <h3 style="color: red">${requestScope.MESSAGE_FAILED}</h3>
            <c:if test="${requestScope.MESSAGE != null}">
                <h2 style="color: blue"><strong>${requestScope.MESSAGE}</strong></h2>
                    </c:if>

                <c:set var="list" value="${requestScope.LIST_ROOM}"></c:set>
                <c:if test="${requestScope.MESSAGE == null}">
                    <c:if test="${empty list}">
                        <h3 style="color: red"><strong>Not found avaliable rooms.</strong></h3>
                    </c:if>
                </c:if>

                <c:if test="${list != null}">
                    <c:if test="${not empty list}">
                        <table id="cart" class="table table-hover table-condensed">
                            <thead>
                                <tr>
                                    <th class="center">No</th>
                                    <th class="center">Image</th>
                                    <th class="center">RoomID</th>
                                    <th class="center">RoomTyeID</th>
                                    <th class="center">RoomName</th>
                                    <th class="center">RoomFloor</th>
                                    <th class="center">Quantity</th>
                                    <th class="center">Price</th>
                                    <th class="center">NumberOfPersons</th>
                                    <th class="center">Status</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="room" items="${list}" varStatus="counter">
                                <form action="MainController" >
                                    <tr>
                                        <td class="center">
                                            ${counter.count}
                                        </td>
                                        <td class="center">
                                            <img src="${room.image}" width="80px" height="80px">
                                            <input type="hidden" name="image" value="${room.image}" />
                                        </td>
                                        <td class="center">
                                            ${room.roomID}
                                            <input type="hidden" name="roomID" value="${room.roomID}"/>
                                        </td>
                                        <td class="center">
                                            ${room.typeID}
                                            <input type="hidden" name="typeID" value="${room.typeID}"/>
                                        </td>
                                        <td class="center">
                                            ${room.roomName}
                                            <input type="hidden" name="roomName" value="${room.roomName}"/>
                                        </td>
                                        <td class="center">
                                            ${room.roomFloor}
                                            <input type="hidden" name="roomFloor" value="${room.roomFloor}"/>
                                        </td>
                                        <td class="center">
                                            ${room.quantity}
                                            <input type="hidden" name="quantity" value="${room.quantity}"/>
                                        </td>
                                        <td class="center">
                                            ${room.price}
                                            <input type="hidden" name="price" value="${room.price}"/>
                                        </td>
                                        <td class="center">
                                            ${room.numberOfPersons}
                                            <input type="hidden" name="num" value="${room.numberOfPersons}"/>
                                        </td>
                                        <td class="center">
                                            ${room.status}
                                        </td>
                                        <td>
                                            <button type="submit" class="btn btn-sm btn-success pull_up" name="btnAction" value="Add_to_cart">
                                                Booking
                                            </button>
                                            <input type="hidden" name="dateFrom" value="${param.dateFrom}" />
                                            <input type="hidden" name="dateTo" value="${param.dateTo}" />
                                        </td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td>
                                        <c:url var="view_cart" value="MainController">
                                            <c:param name="btnAction" value="View_cart"></c:param>
                                        </c:url>
                                        <a href="${view_cart}" class="btn btn-warning">View Reservation</a>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </c:if>
                </c:if>
        </div>
    </body>
</html>
