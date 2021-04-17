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
        <c:set var="countTime" value="${sessionScope.endTime}"/>
        <c:set var="timeToTest" value="${sessionScope.timeToTest}" />

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
                <div class="card-header">
                    <h2 class="my-1">Welcome student, <span class="text-info">${sessionScope.account.name}</span></h2>
                    <h3 class="text-danger">Quiz Online</h3>
                </div>
                <br/>
                <b>Time left: <span id="timer"></span></b>
                <p id="warning"></p>
                <h3 class="text-info">${sessionScope.subjectName}</h3>
                <div class="card-body">
                    <div class="d-flex flex-row w-100">
                        <div class="container border text-left">
                            <form action="MainController" method="POST" id="myForm">
                                <c:set var="count" value="${requestScope.size}" />
                                <c:set var="questionList" value="${sessionScope.questionListTest}" />
                                <c:forEach items="${questionList}" var="questionTest" varStatus="counter">
                                    <p class="mb-0"><b>${sessionScope.indexPage * count - count + counter.count}.${questionTest.cont}</b></p>
                                    <c:forEach items="${questionTest.answerList}" var="dto" varStatus="counter">
                                        <div class="d-flex flex-row justify-content-left align-items-center">
                                            <input type="radio" name="${questionTest.id}" value="${dto.id}"
                                                   <c:set var="submitList" value="${sessionScope.submitList}" />
                                                   <c:forEach var="pair" items="${submitList}">
                                                       <c:if test="${pair.value == dto.id}">checked</c:if>
                                                   </c:forEach> /> <span class="pl-3 pb-2">${dto.cont}</span>
                                        </div>
                                    </c:forEach>
                                    <div class="mb-3"></div>
                                </c:forEach>

                                <div class="w-100 d-flex flex-column align-items-center p-2">
                                    <div class="d-flex flex-row w-25 justify-content-center mt-4">
                                        <c:if test="${sessionScope.indexPage != 1}">
                                            <c:url var="prevLink" value="MainController" >
                                                <c:param name="btnAction" value="ChangeQuestion" />
                                                <c:param name="temp" value="HasValue" />
                                                <c:param name="txtSubject" value="${sessionScope.subjectTest}" />
                                                <c:param name="index" value="${sessionScope.indexPage - 1}" />
                                                <%--<c:param name="processingQuiz" value="null" />--%>
                                            </c:url>
                                            <a class="btn-paging" href="${prevLink}">Prev</a>
                                        </c:if>
                                        <div class="text-center">
                                            <ul class="pagination pagination-md">
                                                <input type="hidden" name="index" />
                                                <c:forEach begin="1" end="${requestScope.endPage}" var="i">
                                                    <li class="page-item ${(sessionScope.indexPage == i) ? "active":""}">
                                                        <input type="hidden" name="btnAction" value="ChangeQuestion" />
                                                        <input type="hidden" name="txtSubject" value="${sessionScope.subjectTest}" />
                                                        <input type="hidden" name="temp" value="HasAValue" />
                                                        <input type="submit" value="${i}" class="page-link"/>
                                                        <!--<input type="hidden" name="processingQuiz" value="<% request.getSession().setAttribute("processingQuiz", null); %>" />-->
                                                    </li>
                                                </c:forEach>

                                            </ul>
                                        </div>
                                        <c:if test="${sessionScope.indexPage < requestScope.endPage}">
                                            <c:url var="nextLink" value="MainController" >
                                                <c:param name="btnAction" value="ChangeQuestion" />
                                                <c:param name="temp" value="HasValue" />
                                                <c:param name="txtSubject" value="${sessionScope.subjectTest}" />
                                                <c:param name="index" value="${sessionScope.indexPage + 1}" />
                                                <%--<c:param name="processingQuiz" value="${null}" />--%>
                                            </c:url>
                                            <a class="btn-paging" href="${nextLink}">Next</a>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="w-100 d-flex justify-content-center mt-4 mb-4">
                                    <input type="submit" value="Submit" name="submitLastQuestion" onclick="return confirmMessage()" class="btn btn-success"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.page-link').on('click', function (e) {
                    e.preventDefault();
                    let page = $(this).val();
                    $('input[name="index"]').val(page);
                    $('#myForm').submit();
                })
            })

            function confirmMessage() {
                var r = confirm("Do you want to continute?");
                if (r === true) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
        <script type="text/javascript">
            var countDownDate = new Date("${countTime}").getTime();
            var timeToTest = ${timeToTest};

            var x = setInterval(function () {

                // Get today's date and time
                var now = new Date().getTime();

                // Find the distance between now and the count down date
                var distance = countDownDate - now;

                // Time calculations for days, hours, minutes and seconds
                var minutes = Math.floor(((distance % (1000 * 60 * 60)) / (1000 * 60)));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                //Case time is greater than 60 minutes
                if(timeToTest > 60) {
                    minutes += 60;
                }

                // If the count down below 1 mins, warning
                if (minutes === 1) {
                    document.getElementById("warning").innerHTML = "Hurry up...";
                    document.getElementById("warning").style.color = "orange";
                } else if (minutes === 0) {
                    document.getElementById("warning").innerHTML = "Please finish your test...";
                    document.getElementById("warning").style.color = "red";
                }
                // Display the result in the element with id="demo"
                if (minutes < 10) {
                    minutes = "0" + minutes;
                }
                if (seconds < 10) {
                    seconds = "0" + seconds;
                }
                document.getElementById("timer").innerHTML = minutes + ":" + seconds;

                // If the count down is finished, submit test
                if (distance <= 0) {
                    clearInterval(x);
                    submitTest();
                }
            }, 1000);

            function submitTest() {
                `document.getElementById("myForm").submit();`
            }
        </script>
    </body>
</html>
