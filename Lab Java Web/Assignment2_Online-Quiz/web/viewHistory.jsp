<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View History Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="css/danh.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <nav class="navbar navbar-expand-sm bg-light">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <c:url var="homeLink" value="MainController" >
                        <c:param name="btnAction" value="Home" />
                    </c:url>
                    <a class="nav-item nav-link active text-light bg-info" href="${homeLink}">Home</a>
                </li>
                <li class="nav-item">
                    <c:url var="historyLink" value="MainController">
                        <c:param name="btnAction" value="GetSubmitHistory" />
                    </c:url>
                    <a class="nav-link" href="${historyLink}">History</a>
                </li>
                <li class="nav-item">
                    <c:url var="logoutLink" value="MainController">
                        <c:param name="btnAction" value="Logout" />
                    </c:url>
                    <a class="nav-item nav-link text-danger" href="${logoutLink}">Logout</a>
                </li>
            </ul>
        </nav>
        <br>

        <div class="container text-center">
            <div class="card">
                <div class="card-body text-center">
                    <h2 class="my-3">Hi student, <span class="text-info">${sessionScope.account.name}</span></h2>
                    <h3 class="text-info mb-4">Summary of your previous quizs</h3>
                    <form action="MainController">
                        <div class="d-flex flex-row w-50 h-50 justify-content-start mb-2">
                            <input class="form-control w-50" type="text" name="txtSearch" placeholder="Search question content..."/>
                            <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
                            <input type="hidden" name="btnAction" value="GetSubmitHistory" />
                            <input type="submit" value="Search" class="btn btn-outline-primary"/>
                        </div>
                    </form>
                    <table style="margin: 0 auto" class="table table-hover table-striped">
                        <thead class="bg-info text-light">
                            <tr>
                                <th>Subject</th>
                                <th>Start Time</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.SubmitedList}" var="rows">
                                <tr>
                                    <td>${rows.subject}</td>
                                    <td>${rows.startTime}</td>
                                    <td>
                                        <c:url var="linkHistory" value="MainController" >
                                            <c:param name="btnAction" value="Review" />
                                            <c:param name="subject" value="${rows.subject}" />
                                            <c:param name="txtId" value="${rows.id}" />
                                            <c:param name="numberOfTrue" value="${rows.numberOfTrue}" />
                                            <c:param name="numberOfQuestion" value="${rows.quantityOfQuestion}" />
                                            <c:param name="point" value="${rows.point}" />
                                            <c:param name="detail" value="HasAValue" />
                                        </c:url>
                                        <a class="btn-paging text-primary" href="${linkHistory}">Click me!</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="mb-4"></div>
                </div> 
            </div>
            <div class="text-right">
                <div class="mt-4" style="display: inline-block">
                    <ul class="pagination pagination-md">
                        <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                            <li class="page-item ${(requestScope.indexPage == i) ? "active":""}">
                                <a href="MainController?btnAction=GetSubmitHistory&index=${i}&txtSearch=${param.txtSearch}" class="page-link">${i}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>

