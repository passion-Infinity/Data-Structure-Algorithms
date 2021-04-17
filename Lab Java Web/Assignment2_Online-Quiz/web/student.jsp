<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Page</title>
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

        <div class="container-fluid text-center">
            <div class="card">
                <div class="card-body">
                    <h2 class="my-1">Welcome student, <span class="text-info">${sessionScope.account.name}</span></h2>
                    <h3 class="text-danger">Start your quiz online test</h3>
                    <br/>
                    <form action="MainController" method="POST" class="form-inline form-startQuiz">
                        <select name="txtSubject" class="form-control col-md-2" >
                            <option value>Select Subject</option>
                            <c:forEach items="${sessionScope.subjectList}" var="subject">
                                <option value="${subject.id}" <c:if test="${requestScope.ChooseSubject == subject.id}">selected=""</c:if>>${subject.id} - ${subject.name}</option>
                            </c:forEach>
                        </select>
                        <input type="hidden" value="StartQuiz" name="btnAction"/>
                        <input type="submit" value="Start" class="btn btn-primary"/>
                    </form>
                    <br/>
                    <div style="margin-bottom: 8px"></div>
                    <b><font class="text-center" style="color: red;">${requestScope.error}</font></b><br/>
                </div>
                    
            </div>
        </div>

    </body>
</html>
