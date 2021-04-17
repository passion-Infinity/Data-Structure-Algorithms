<%-- 
    Document   : error
    Created on : Jan 16, 2021, 7:22:54 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="color: red">Login With Account Goole is fail. Your email is not correct. Please try it again !</h1>
        <div class="center">
            <button style="padding: 8px; font-weight: bold; cursor: pointer" onclick="goBack()">Click here to go back</button>
            <script>
                function goBack() {
                    window.history.back();
                }
            </script>
        </div>
    </body>
</html>
