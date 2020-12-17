<%-- 
    Document   : error404.jsp
    Created on : Oct 15, 2020, 11:21:25 AM
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
                        <i class="ace-icon fa fa-sitemap"></i>
                        404
                    </span>
                    Page Not Found
                </h1>

                <hr />
                <h3 class="lighter smaller">We looked everywhere but we couldn't find it!</h3>

                <div>
                    <form class="form-search">
                        <span class="input-icon align-middle">
                            <i class="ace-icon fa fa-search"></i>

                            <input type="text" class="search-query" placeholder="Give it a search..." />
                        </span>
                        <button class="btn btn-sm" type="button">Go!</button>
                    </form>

                    <div class="space"></div>
                    <h4 class="smaller">Try one of the following:</h4>

                    <ul class="list-unstyled spaced inline bigger-110 margin-15">
                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                            Re-check the url for typos
                        </li>

                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                            Read the faq
                        </li>

                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                            Tell us about it
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
