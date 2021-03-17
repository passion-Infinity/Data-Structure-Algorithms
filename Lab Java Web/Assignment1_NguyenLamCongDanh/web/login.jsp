<%@page import="danhnlc.dto.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <script src="js/jquery-1.11.0.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script src="js/jquery.easydropdown.js"></script>
        <script type="text/javascript" src="js/memenu.js"></script>
        <link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />			
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <c:if test="${sessionScope.LOGIN_USER.role == 'admin'}">
            <c:redirect url="admin_index.jsp" />
        </c:if>
        <c:if test="${sessionScope.LOGIN_USER.role == 'member'}">
            <c:redirect url="index.jsp" />
        </c:if>
        
        <c:if test="${param.btnAction == null}">
            <c:redirect url="MainController?btnAction=Login_Page" />
        </c:if>
        
        
        <c:set var="error" value="${sessionScope.ERROR}" />
        <!--top-header-->
        <jsp:include page="./common/top-header.jsp" />
        <!--top-header-->
        <!--start-logo-->
        <jsp:include page="./common/logo.jsp" />
        <!--start-logo-->
        <!--bottom-header-->
        <jsp:include page="./common/bottom-header.jsp" />
        <!--bottom-header-->
        <!--start-breadcrumbs-->
        <div class="breadcrumbs">
            <div class="container">
                <div class="breadcrumbs-main">
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a></li>
                        <li class="active">Account</li>
                    </ol>
                </div>
            </div>
        </div>
        <!--end-breadcrumbs-->
        <!--account-starts-->
        <div class="account">
            <div class="container">
                <div class="account-top heading">
                    <h2>ACCOUNT</h2>
                </div>
                <div class="account-main">
                    <div class="col-md-6 account-left">
                        <h3>Existing User</h3>
                        <div class="account-bottom">
                            <form action="MainController" method="POST">
                                <input style="margin-bottom: 0" placeholder="Username" type="text" name="username" value="${sessionScope.USERNAME}" tabindex="3" required>
                                <h5 style="color: red; margin-left: 10px; margin-top: 10px;">${error.userIDError}</h5>
                                <input style="margin-bottom: 0; margin-top: 10px;" placeholder="Password" type="password" name="password" tabindex="4" required>
                                <h5 style="color: red; margin-left: 10px">${error.passwordError}</h5>
                                <h5 style="color: red; margin-left: 10px">${sessionScope.INVALID}</h5>
                                <div class="address">
                                    <a class="forgot" href="#">Forgot Your Password?</a>
                                    <input type="submit" name="btnAction" value="Login">
                                </div>
                                <div class="btn btn-danger" style="margin-top: 20px;font-weight: 600">
                                    <a style="color: white; text-decoration: none" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:5050/Assignment1_NguyenLamCongDanh/LoginGoogleController&response_type=code&client_id=308556730491-jlt01frd1hnqdelvrucmec8srrj1o7c0.apps.googleusercontent.com&approval_prompt=force">
                                        Login With Google Account</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-6 account-right account-left">
                        <h3>New User? Create an Account</h3>
                        <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
                        <a href="#">Create an Account</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--account-end-->
        <!--information-starts-->
        <jsp:include page="./common/information.jsp" />
        <!--information-end-->
        <!--footer-starts-->
        <jsp:include page="./common/footer.jsp" />
        <!--footer-end-->	
    </body>
</html>
