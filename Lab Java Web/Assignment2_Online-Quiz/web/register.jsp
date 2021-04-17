<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container" style="margin-top: 100px ">
            <div class="text-center mb-3">
                <img src="https://upload.wikimedia.org/wikipedia/vi/8/80/FPT_New_Logo.png" width="150" height="80"/>
                <h2 class="mt-2">Quiz Online Program</h2>
            </div>
            <div class="row">
                <div class="col-md-5 mx-auto">
                    <div>
                        <div class="myform form ">
                            <div class="logo mb-3">
                                <div class="col-md-12 text-center">
                                    <h1 >Signup</h1>
                                </div>
                            </div>
                            <form action="MainController" method="POST">
                                <h5 style="color: red;margin-left: 10px">${sessionScope.updateError}</h5>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input type="text"  name="txtName" value="${sessionScope.name}" class="form-control" id="firstname"placeholder="Enter name" required="">
                                    <h6 style="color: red;margin-left: 10px">${sessionScope.accountErr.name}</h6>
                                </div>
                                <div class="form-group">
                                    <label>Email address</label>
                                    <input type="email" name="txtEmail" value="${sessionScope.email}"  class="form-control" id="email" placeholder="Enter email" required="">
                                    <h6 style="color: red;margin-left: 10px">${sessionScope.accountErr.email}</h6>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" name="txtPassword" class="form-control" placeholder="Enter password" required="">
                                </div>
                                <div class="form-group">
                                    <label>Confirm</label>
                                    <input type="password" name="txtConfirm" class="form-control" placeholder="Enter password" required="">
                                    <h6 style="color: red;margin-left: 10px">${sessionScope.accountErr.confirm}</h6>
                                </div>
                                <div class="form-group text-center">
                                    <div style="display: inline-block">
                                        <label>Student</label>
                                        <input type="radio" name="rdRole" value="student" checked="true"/>
                                    </div>
                                    <div style="display: inline-block; margin-left: 100px ">
                                        <label>Teacher</label>
                                        <input type="radio" name="rdRole" value="teacher"/>
                                    </div>
                                </div>
                                <div class="col-md-12 text-center mb-3">
                                    <button type="submit" name="btnAction" value="Register" style="cursor: pointer" class=" btn btn-block mybtn btn-primary tx-tfm">Sign up</button>
                                </div>
                                <div class="col-md-12 ">
                                    <div class="form-group">
                                        <p class="text-center"><a href="login.jsp" id="signin">Already have an account?</a></p>
                                    </div>
                                </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>   
    <footer class="page-footer font-small blue">

        <!-- Copyright -->
        <div class="footer-copyright text-center py-3">© 2020 Copyright:
            <a href="https://www.facebook.com/congdanh.nguyenlam" target="_blank">NLCDanh</a>
        </div>
        <!-- Copyright -->

    </footer>
</body>

</html>

