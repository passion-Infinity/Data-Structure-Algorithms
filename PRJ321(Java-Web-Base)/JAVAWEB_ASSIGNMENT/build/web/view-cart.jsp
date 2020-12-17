<%@page import="java.util.HashMap"%>
<%@page import="danhnlc.dtos.User"%>
<%@page import="danhnlc.dtos.RoomCart"%>
<%@page import="danhnlc.dtos.Cart"%>
<%@page import="java.util.Map"%>
<%@page import="danhnlc.dtos.Room"%>
<%@page import="danhnlc.dtos.Room"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart - Page</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

    </head>
    <body>
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
        <div class="container" style="margin-top: 20px"> 
            <div class="header ace-settings-box" style="font-size: 30px; background-color: #31b0d5; border: #31b0d5; color: white">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                Your Reservation
                <div class="clearfix"></div>
            </div>

            <%
                String message = (String) request.getAttribute("MESSAGE");
                if (message != null) {
            %>
            <h2><%= message%></h2>
            <a href="MainController?btnAction=Search" class="btn btn-warning">
                <i class="fa fa-angle-left"></i> Continue Booking
            </a>
            <%}%>

            <%
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) {
                    float total = 0;
                    float sum = 0;
            %>
            <table id="cart" class="table table-hover table-condensed">
                <thead>
                    <tr>
                        <th style="width: 15%; text-align: center">Room name</th>
                        <th style="width: 15%; text-align: center">Room Type</th>
                        <th style="width: 14%; text-align: center">Room Floor</th>
                        <th style="width: 12%;  text-align: center">Quantity</th>
                        <th style="width: 12%; text-align: center">Price</th>
                        <th style="width: 8%; text-align: center">Guest</th>
                        <th class="text-center" style="width: 14%">Subtotal</th>
                        <th style="width: 10%; text-align: center"></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (RoomCart roomCart : cart.getCart().values()) {
                            sum = roomCart.getQuantity() * roomCart.getRoom().getPrice();
                            total += sum;
                    %>
                <form action="MainController">
                    <tr>
                        <td>
                            <input type="hidden" name="roomID" value="<%= roomCart.getRoom().getRoomID()%>" />
                            <div class="row">
                                <div class="col-sm-10">
                                    <img src="<%= roomCart.getRoom().getImage()%>" width="150px" height="100px"/>
                                    <h5 class="nomargin" style="text-align: center"><%= roomCart.getRoom().getRoomName()%></h5>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="row">
                                <div class="col-sm-10">
                                    <h5 class="nomargin" style="text-align: center"><%= roomCart.getRoom().getTypeID()%></h5>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="row">
                                <div class="col-sm-10">
                                    <h5 class="nomargin" style="text-align: center"><%= roomCart.getRoom().getRoomFloor()%></h5>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="row">
                                <div class="col-sm-10">
                                    <input class="form-control text-center" min="1" type="number" name="quantity_cart" value="<%= roomCart.getQuantity()%>" />
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="row">
                                <div class="col-sm-10">
                                    <h5 class="nomargin" style="text-align: center"><%= roomCart.getRoom().getPrice()%></h5>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="row">
                                <div class="col-sm-10">
                                    <input type="number" min="1" max="<%= roomCart.getRoom().getNumberOfPersons()%>" class="form-control text-center" value="<%= roomCart.getRoom().getNumberOfPersons()%>" readonly="">
                                </div>
                            </div>
                        </td>
                        <td class="text-center">
                            <div class="row" style="margin-left: 2px">
                                <div class="col-sm-10">
                                    <h5 class="nomargin" style="text-align: center"><%= sum%></h5>
                                </div>
                            </div>
                        </td>
                        <td class="actions">
                            <button class="btn btn-info btn-sm" type="submit" name="btnAction" value="Update_cart">
                                <i class="fa fa-edit"></i>
                            </button>
                            <button class="btn btn-danger btn-sm" type="submit" name="btnAction" value="Delete_cart">
                                <i class="fa fa-trash-o"></i>
                            </button>								
                        </td>
                    </tr>
                </form>
                <% }%>
                </tbody>
                <tfoot>
                <form action="MainController">
                    <tr>
                        <td>
                            <button type="submit" name="btnAction" value="Search" class="btn btn-warning"><i class="fa fa-angle-left">
                                </i> Continue Booking
                            </button>
                            <input type="hidden" name="dateFrom" value="${sessionScope.DATE1}" />
                            <input type="hidden" name="dateTo" value="${sessionScope.DATE2}" />
                        </td>
                        <td colspan="5" class="hidden-xs"></td>
                        <td class="hidden-xs text-center">
                            <h4><strong>Total  <%= total%></strong></h4>
                            <input type="hidden" name="total" value="<%= total%>" />
                        </td>
                        <td>
                            <button type="submit" name="btnAction" value="Check_out" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></button>
                        </td>
                    </tr>
                </form>
                </tfoot>
            </table><br/><br/>

            <%
                HashMap<String, Integer> invalidList = (HashMap<String, Integer>) session.getAttribute("UNVALID_LIST");
                if (invalidList != null) {
            %>
            <h3 style="color: red">Check-out fail!!!</h3>
            <h4 style="color: red">The number of rooms you have booked has exceeded the number of rooms of the resort, Please check again!</h4>
            <%
                for (Map.Entry<String, Integer> en : invalidList.entrySet()) {
                    String key = en.getKey();
                    int val = en.getValue();
            %>
            <h5 style="color: red"><strong>Room Name:<%= key%> ---- Max-quantity: <%= val%></strong></h5>
            <%}%>
            <%}%>
            <%}%>
        </div>
    </body>
</html>