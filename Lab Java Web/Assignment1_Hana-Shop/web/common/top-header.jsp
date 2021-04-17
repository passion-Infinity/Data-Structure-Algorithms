<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="top-header">
    <div class="container">
        <div class="top-header-main">
            <div class="col-md-6 top-header-left">
                <c:if test="${sessionScope.LOGIN_USER == null}">
                    <div class="drop">
                        <a href="MainController?btnAction=Login_Page" style="font-size: 18px;font-weight: 700;font-family: 'Times New Roman', Times, serif;" class="label">SIGN IN</a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.LOGIN_USER != null}">
                    <div class="drop">
                        <div class="box">
                            <select tabindex="4" class="dropdown drop" onchange="location = this.value">
                                <option  value="" class="label">${sessionScope.LOGIN_USER.fullName}</option>
                                <c:if test="${sessionScope.LOGIN_USER.role == 'admin'}">
                                    <option value="MainController?btnAction=Admin_Index_Page">Admin</option>
                                    <option value="MainController?btnAction=Logout">Log out</option>
                                </c:if>
                                <c:if test="${sessionScope.LOGIN_USER.role == 'member'}">
                                    <option value="MainController?btnAction=Load_History">History</option>
                                    <option value="MainController?btnAction=Logout">Log out</option>
                                </c:if>
                            </select>
                        </div>
                    </div>
                </c:if>
            </div>

            <c:if test="${sessionScope.LOGIN_USER.role == 'member'}">
                <div class="col-md-6 top-header-left">
                    <div class="cart box_1">
                        <a href="MainController?btnAction=Count_Product_Cart">
                            <div class="total">
                                <span class="simpleCart_total"></span></div>
                            <img src="./img/cart-1.png" alt="" width="30" />
                        </a>
                    </div>
                </div>
            </c:if>

            <div class="clearfix"></div>
        </div>
    </div>
</div>