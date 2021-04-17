<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit Page</title>
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

        <div class="container">
            <h1 class="my-3"><span class="text-danger">Hi</span> <span class="text-info">${sessionScope.account.name}</span>, This is your point of ${sessionScope.subjectTest}!</h1>
            <h2>TEST(Start Time: ${sessionScope.startTime}, End Time: ${sessionScope.endTime})</h2>
            <div class="card">
                <div class="card-body">
                    <h3 class="text-info mb-4">Summary of your previous attempts</h3>
                    <div class="d-flex flex-row w-100 justify-content-between align-items-center bg-info px-3 py-2 text-light">
                        <div><b>Mark/${sessionScope.numberOfQuestion}</b></div>
                        <div><b>Grade/10.00</b></div>
                        <div><b>Review</b></div>
                    </div>
                    <div class="d-flex flex-row w-100 justify-content-between align-items-center card-header mb-4">
                        <div><b>${sessionScope.numberOfTrue}/${sessionScope.numberOfQuestion}</b></div>
                        <div><b>${sessionScope.point}/10.00</b></div>
                        <div><a class="text-info" href="MainController?btnAction=Review">Review</a></div>
                    </div>
                        <h4 class="text-info text-center">Your final grade for this quiz is ${sessionScope.point} </h4>
                </div>
            </div>
        </div>
    </body>
</html>
