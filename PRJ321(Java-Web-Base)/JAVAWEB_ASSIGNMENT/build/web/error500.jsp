<%-- 
    Document   : error500
    Created on : Oct 15, 2020, 11:30:07 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <div class="error-container">
            <div class="well">
                <h1 class="grey lighter smaller">
                    <span class="blue bigger-125">
                        <i class="ace-icon fa fa-random"></i>
                        500
                    </span>
                    Something Went Wrong
                </h1>

                <hr />
                <h3 class="lighter smaller">
                    But we are working
                    <i class="ace-icon fa fa-wrench icon-animated-wrench bigger-125"></i>
                    on it!
                </h3>

                <div class="space"></div>

                <div>
                    <h4 class="lighter smaller">Meanwhile, try one of the following:</h4>

                    <ul class="list-unstyled spaced inline bigger-110 margin-15">
                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                            Read the faq
                        </li>

                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                            Give us more info on how this specific error occurred!
                        </li>
                    </ul>
                </div>

                <hr />
                <div class="space"></div>

                <div class="center">
                    <button onclick="goBack()">Go Back</button>
                    <script>
                        function goBack() {
                            window.history.back();
                        }
                    </script>
                </div>
            </div>
        </div>
    </body>
</html>
