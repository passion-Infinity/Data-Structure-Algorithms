
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
            <h1 class="my-3"><span class="text-danger">Hi,</span> <span class="text-info">${sessionScope.account.name}</span></h1>
            <div class="card">
                <div class="card-body">
                    <h3 class="text-info mb-4">Quiz History Review</h3>
                    <h4 class="text-danger mb-1">Subject: ${sessionScope.subjectTest}</h4>
                    <h5 class="text-info mb-0">Correct Answer: ${sessionScope.numberOfTrue}/${sessionScope.numberOfQuestion}</h5>
                    <h5 class="text-info mb-4">Point: ${sessionScope.point}</h5>
                    <form action="MainController">
                        <div class="d-flex flex-row w-75 h-50 justify-content-start mb-4">
                            <input class="form-control w-50" type="text" name="txtSearch" placeholder="Search question content..."/>
                            <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
                            <input type="hidden" name="btnAction" value="Review" />
                            <input type="hidden" name="submitId" value="${sessionScope.submitId}" />
                            <input type="submit" value="Search" class="btn btn-outline-primary"/>
                        </div>
                    </form>
                    <div class="d-flex flex-column">
                        <c:set var="count" value="${requestScope.size}"/>
                        <c:set var="questionList" value="${sessionScope.questionReviewList}" />
                        <c:forEach items="${questionList}" var="questionTest" varStatus="counter">
                            <div>
                                <p><b>${requestScope.indexPage * count - count + counter.count}.${questionTest.cont}</b></p>
                                <c:set var="correctAnswer" value="" />
                                <c:forEach items="${questionTest.answerList}" var="dto" varStatus="counter">
                                    <div class="d-flex flex-row justify-content-left align-items-center">
                                        <input type="radio" name="${questionTest.id}" value="${dto.id}" disabled="" 
                                               <c:set var="submitList" value="${sessionScope.submitList}" />
                                               <c:forEach var="answerHistory" items="${sessionScope.answerHistoryList}">
                                                   <c:if test="${answerHistory == dto.id}">
                                                       checked
                                                       <c:set var="check" value="${dto.correctly}" />
                                                   </c:if>
                                               </c:forEach> /> <span class="pl-3 pb-2">${dto.cont}</span> 
                                    </div>
                                    <c:if test="${dto.correctly == true}">
                                        <c:set var="correctAnswer" value="${dto.cont}" /> 
                                    </c:if>
                                </c:forEach>
                            </div>
                            <c:if test="${check == false}"><b><p class="text-danger m-0">Your answer is incorrect</p></b></c:if>
                            <b><p class="text-success">Correct Answer: ${correctAnswer}</p></b>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <div class="mt-4" style="display: inline-block">
                    <ul class="pagination pagination-md">
                        <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                            <li class="page-item ${(requestScope.indexPage == i) ? "active":""}">
                                <a href="MainController?btnAction=Review&index=${i}&txtSearch=${param.txtSearch}&submitId=${sessionScope.submitId}" class="page-link">${i}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>     
    </body>
</html>
