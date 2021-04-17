<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher Page</title>
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
                    <c:url var="createQuestionLink" value="MainController">
                        <c:param name="btnAction" value="Create_Page"></c:param>
                    </c:url>
                    <a class="nav-item nav-link active" href="${createQuestionLink}">Create Question</a>
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

        <div class="container-fluid">
            <h1 class="my-3">Welcome Teacher, <span class="text-info">${sessionScope.account.name}</span></h1>
            <div class="card">
                <div class="card-body p-0 p-3">
                    <nav class="navbar navbar-light bg-light">
                        <form action="MainController" method="POST" class="d-flex flex-row w-100 justify-content-end">
                            <div class=" d-flex flex-row align-items-center justify-content-center w-50">
                                <select name="txtSubject" class="form-control w-50 mr-2 my-3">
                                    <option value>Select subject (Default All)</option>
                                    <c:forEach items="${sessionScope.subjectList}" var="dto">
                                        <option value="${dto.id}"<c:if test="${requestScope.subjectSelection == dto.id}">selected=""</c:if>>${dto.id} - ${dto.name}</option>
                                    </c:forEach>
                                </select>
                                <div class="mt-2"></div>
                                <select name="txtStatus" class="form-control w-50">
                                    <option value>Select status (Default All)</option>
                                    <c:forEach items="${sessionScope.statusList}" var="dto">
                                        <option value="${dto.name}"<c:if test="${requestScope.statusSelection == dto.name}">selected=""</c:if>>${dto.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <br/>
                            <br/>
                            <div class="d-flex flex-row w-50 h-50 justify-content-center" style="margin: auto">
                                <input class="form-control w-50" type="text" name="txtSearch" placeholder="Search question content..."/>
                                <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
                                <input type="submit" name="btnAction" value="Search" class="btn btn-outline-primary"/>
                            </div>
                        </form>
                    </nav>

                    <c:if test="${requestScope.questionList != null}">
                        <c:if test="${not empty requestScope.questionList}" var="questionList">
                            <c:if test="${requestScope.searchForQuestion != null}">
                                <div>
                                    <div class="border bg-info text-white question-title">
                                        <div class="question-content">
                                            <p class="m-0 text-center text-wrap"><b>Question Content</b></p>
                                        </div>
                                        <div class="unsee">
                                            <p class="m-0 text-center text-wrap"><b>Subject</b></p>
                                        </div>
                                        <div class="date">
                                            <p class="m-0 text-center text-wrap"><b>Created Date</b></p>
                                        </div>
                                        <div class="who">
                                            <p class="m-0 text-center text-wrap"><b>Created By</b></p>
                                        </div>
                                        <div class="date">
                                            <p class="m-0 text-center text-wrap"><b>Modified Date</b></p>
                                        </div>
                                        <div class="who">
                                            <p class="m-0 text-center text-wrap"><b>Modidfied By</b></p>
                                        </div>
                                        <div class="unsee">
                                            <p class="m-0 text-center text-wrap"><b>Status</b></p>
                                        </div>
                                        <div class="unsee">
                                            <p class="m-0 text-center text-wrap"></p>
                                        </div>
                                        <div class="unsee">
                                            <p class="m-0 text-center text-wrap"></p>
                                        </div>
                                    </div>

                                    
                                    <c:forEach items="${requestScope.questionList}" var="dto" varStatus="counter">
                                        <c:set var="count" value="${requestScope.sizeForQuestion}" />
                                        <div class="w-100 mt-2 p-2 border">
                                            <div class="dropdown question-content">
                                                <div class="p-0 btn dropdown-toggle" type="button" id="dropdownMenuBtn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <p class="m-0 text-left text-wrap question "><b>${requestScope.indexPage * count - count + counter.count}. ${dto.cont}</b></p>
                                                </div>
                                                <div class="dropdown-menu w-100 pl-2" aria-labelledby="dropdownMenuBtn">
                                                    <c:forEach items="${dto.answerList}" var="answer" varStatus="counterAns">
                                                        <c:if test="${answer.correctly == true}">
                                                            <font color="green">
                                                            <p class="m-0 m-2">
                                                                <span>&#${counterAns.index + 65};) </span>${answer.cont}</p>
                                                            </font>
                                                        </c:if>
                                                        <c:if test="${answer.correctly == false}">
                                                            <font color="red">
                                                            <p class="m-0 m-2">
                                                                <span>&#${counterAns.index + 65};) </span>${answer.cont}</p>
                                                            </font>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="unsee">
                                                <p class="m-0 text-center text-wrap"><b>${dto.subject}</b></p>
                                            </div>
                                            <div class="date">
                                                <p class="m-0 text-center text-wrap"><b>${dto.createdDate}</b></p>
                                            </div>
                                            <div class="who">
                                                <p class="m-0 text-center text-wrap"><b>${dto.createdBy}</b></p>
                                            </div>
                                            <div class="date">
                                                <p class="m-0 text-center text-wrap"><b>${dto.modifiedDate}</b></p>
                                            </div>
                                            <div class="who">
                                                <p class="m-0 text-center text-wrap"><b>${dto.modifiedBy}</b></p>
                                            </div>
                                            <div class="unsee">
                                                <p class="m-0 text-center text-wrap"><b>${dto.status}</b></p>
                                            </div>
                                            <form action="MainController" method="POST" class="unsee">
                                                <input type="hidden" name="questionId" value="${dto.id}" />
                                                <input type="hidden" name="index" value="${requestScope.indexPage}" />
                                                <input type="submit" name="btnAction" value="Edit" class="btn btn-primary"  />
                                            </form>
                                            <form action="MainController" method="POST" class="unsee" onclick="return confirmMessage()">
                                                <input type="hidden" name="txtSearch" value="${param.txtSearch}" />
                                                <input type="hidden" name="txtSubject" value="${param.txtSubject}" />
                                                <input type="hidden" name="txtStatus" value="${param.txtStatus}" />
                                                <input type="hidden" name="questionId" value="${dto.id}" />
                                                <input type="hidden" name="index" value="${requestScope.indexPage}" />
                                                <c:if test="${dto.status == 'InActived'}">
                                                    <input type="submit" name="btnAction" value="Delete" class="btn btn-danger" disabled=""/>
                                                </c:if>
                                                <c:if test="${dto.status == 'Actived'}">
                                                    <input type="submit" name="btnAction" value="Delete" class="btn btn-danger"/>
                                                </c:if>
                                            </form>
                                        </div>
                                    </c:forEach>
                                    <div class="w-100 d-flex flex-column align-items-center p-2">
                                        <div class="d-flex flex-row w-25 justify-content-center mt-4">
                                            <c:if test="${requestScope.indexPage != 1}">
                                                <c:url var="prevLink" value="MainController" >
                                                    <c:param name="btnAction" value="Search" />
                                                    <c:param name="txtSearch" value="${param.txtSearch}" />
                                                    <c:param name="txtSubject" value="${param.txtSubject}" />
                                                    <c:param name="txtStatus" value="${param.txtStatus}" />
                                                    <c:param name="index" value="${requestScope.indexPage - 1}" />
                                                </c:url>
                                                <a class="btn-paging" href="${prevLink}">Prev</a>
                                            </c:if>
                                            <div class="text-center">
                                                <ul class="pagination pagination-md">
                                                    <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                                                        <li class="page-item ${(requestScope.indexPage == i) ? "active":""}">
                                                            <a href="MainController?btnAction=Search&index=${i}&txtSearch=${param.txtSearch}&txtSubject=${param.txtSubject}&txtStatus=${param.txtStatus}" class="page-link">${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                            <c:if test="${requestScope.indexPage < requestScope.endPage}">
                                                <c:url var="nextLink" value="MainController" >
                                                    <c:param name="btnAction" value="Search" />
                                                    <c:param name="txtSearch" value="${param.txtSearch}" />
                                                    <c:param name="txtSubject" value="${param.txtSubject}" />
                                                    <c:param name="txtStatus" value="${param.txtStatus}" />
                                                    <c:param name="index" value="${requestScope.indexPage + 1}" />
                                                </c:url>
                                                <a class="btn-paging" href="${nextLink}">Next</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${requestScope.searchForSubject != null}">
                                <div class="container">
                                    <div class="border bg-info text-white question-title">
                                        <div style="display: inline-block; width: 48%">
                                            <p class="m-0 text-center text-wrap"><b>Subject ID</b></p>
                                        </div>
                                        <div style="display: inline-block; width: 48%">
                                            <p class="m-0 text-center text-wrap"><b>Subject Name</b></p>
                                        </div>
                                    </div>

                                    <c:forEach items="${requestScope.questionList}" var="dto" varStatus="counter">
                                        <form>
                                            <input type="hidden" name="btnAction" value="Search"/>
                                            <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                                            <input type="hidden" name="txtSubject" value="${dto.id}"/>
                                            <input type="hidden" name="txtStatus" value="${param.txtStatus}"/>
                                            <input type="hidden" name="index" value="${requestScope.indexPage}"/>
                                            <button type="submit"  class="w-100 mt-2 p-2 border btn-light">
                                                <div style="display: inline-block; width: 48%">
                                                    <p class="m-0 text-center text-wrap">
                                                        <b>${dto.id}</b>
                                                    </p>
                                                </div>
                                                <div style="display: inline-block; width: 48%">
                                                    <p class="m-0 text-center text-wrap">
                                                        <b>${dto.name}</b>
                                                    </p>
                                                </div>
                                            </button>
                                        </form>
                                    </c:forEach>
                                    <div class="w-100 d-flex flex-column align-items-center p-2">
                                        <div class="d-flex flex-row w-25 justify-content-center mt-4">
                                            <c:if test="${requestScope.indexPage != 1}">
                                                <c:url var="prevLink" value="MainController" >
                                                    <c:param name="btnAction" value="Search" />
                                                    <c:param name="txtSearch" value="${param.txtSearch}" />
                                                    <c:param name="txtSubject" value="${param.txtSubject}" />
                                                    <c:param name="txtStatus" value="${param.txtStatus}" />
                                                    <c:param name="index" value="${requestScope.indexPage - 1}" />
                                                </c:url>
                                                <a class="btn-paging" href="${prevLink}">Prev</a>
                                            </c:if>
                                            <div class="text-center">
                                                <ul class="pagination pagination-md">
                                                    <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                                                        <li class="page-item ${(requestScope.indexPage == i) ? "active":""}">
                                                            <a href="MainController?btnAction=Search&index=${i}&txtSearch=${param.txtSearch}&txtSubject=${param.txtSubject}&txtStatus=${param.txtStatus}" class="page-link">${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                            <c:if test="${requestScope.indexPage < requestScope.endPage}">
                                                <c:url var="nextLink" value="MainController" >
                                                    <c:param name="btnAction" value="Search" />
                                                    <c:param name="txtSearch" value="${param.txtSearch}" />
                                                    <c:param name="txtSubject" value="${param.txtSubject}" />
                                                    <c:param name="txtStatus" value="${param.txtStatus}" />
                                                    <c:param name="index" value="${requestScope.indexPage + 1}" />
                                                </c:url>
                                                <a class="btn-paging" href="${nextLink}">Next</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:if>
                        <c:if test="${!questionList}">
                            <p class="m-0 my-2">No results found</p>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function confirmMessage() {
                var r = confirm("Do you want to continute?");
                if (r === true) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
        <c:if test="${requestScope.success != null}">
            <script>
                alert("Successful!");
            </script>
        </c:if>
    </body>
</html>
