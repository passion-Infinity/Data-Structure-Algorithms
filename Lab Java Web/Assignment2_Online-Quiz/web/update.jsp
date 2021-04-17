<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Question Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <c:url var="homeLink" value="MainController" >
                        <c:param name="btnAction" value="Home" />
                    </c:url>
                    <a class="nav-item nav-link active text-light bg-info" href="${homeLink}">Home <span class="sr-only">(current)</span></a>
                    <c:url var="createQuestionLink" value="MainController">
                        <c:param name="btnAction" value="New"></c:param>
                    </c:url>
                    <a class="nav-item nav-link active text-primary" href="${createQuestionLink}">Create Question</a>
                    <c:url var="logoutLink" value="MainController" >
                        <c:param name="btnAction" value="Logout" />
                    </c:url>
                    <a class="nav-item nav-link text-danger" href="${logoutLink}">Logout</a>
                </div>
            </div>
        </nav>
        <div class="container mt-3">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center">Update Question</h3>
                    <form action="MainController" method="POST">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <span>Question ID: </span>
                                </div>
                            </div>
                            <input class="form-control"  type="text" name="questionId" value="${requestScope.question.id}" readonly=""/>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <span>Content: </span>
                                </div>
                            </div>
                            <input type="text" name="txtContent" value="${requestScope.question.cont}" class="form-control" required=""/>
                        </div>
                        <h5 class="text-success">Please click radio button to set the correct answer, rest is the wrong answer</h5>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <p class="m-0 mr-4">Answer 1:</p>
                                    <input type="radio" name="txtCorrectAnswer" value="answer1" <c:if test="${requestScope.txtAnswer1.correctly == true}">checked=""</c:if>>
                                    </div>
                                </div>
                                <input type="text" name="txtAnswer1" value="${requestScope.txtAnswer1.cont}" class="form-control" required=""/>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <p class="m-0 mr-4">Answer 2:</p>
                                    <input type="radio" name="txtCorrectAnswer" value="answer2"<c:if test="${requestScope.txtAnswer2.correctly == true}">checked=""</c:if>>
                                    </div>
                                </div>
                                <input type="text" name="txtAnswer2" value="${requestScope.txtAnswer2.cont}" class="form-control" required=""/>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <p class="m-0 mr-4">Answer 3:</p>
                                    <input type="radio" name="txtCorrectAnswer" value="answer3"<c:if test="${requestScope.txtAnswer3.correctly == true}">checked=""</c:if>>
                                    </div>
                                </div>
                                <input type="text" name="txtAnswer3" value="${requestScope.txtAnswer3.cont}" class="form-control" required=""/>

                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    <p class="m-0 mr-4">Answer 4:</p>
                                    <input type="radio" name="txtCorrectAnswer" value="answer4"<c:if test="${requestScope.txtAnswer4.correctly == true}">checked=""</c:if>>
                                    </div>
                                </div>
                                <input type="text" name="txtAnswer4" value="${requestScope.txtAnswer4.cont}" class="form-control" required=""/>
                        </div>
                        <select name="txtSubject" class="form-control mb-3">
                            <c:forEach items="${sessionScope.subjectList}" var="dto">
                                <option value="${dto.id}" <c:if test="${requestScope.subject == dto.id}">selected=""</c:if>>${dto.id} - ${dto.name}</option>
                            </c:forEach>
                        </select>
                        <select name="txtStatus" class="form-control mb-3">
                            <c:forEach items="${sessionScope.statusList}" var="dto">
                                <option value="${dto.name}"<c:if test="${requestScope.status == dto.name}">selected=""</c:if>>${dto.name}</option>
                            </c:forEach>
                        </select>
                        <div class="w-100 d-flex flex-column align-items-center">
                            <input type="hidden" value="${requestScope.index}" name="index" />
                            <input type="submit" value="Update" name="btnAction" class="btn btn-info w-25"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

