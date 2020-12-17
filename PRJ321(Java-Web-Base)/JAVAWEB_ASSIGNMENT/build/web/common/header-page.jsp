<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    if (session.getAttribute("LOGIN_USER") == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<header class="header-section">
    <div class="container-fluid">
        <div class="inner-header">
            <div class="logo">
                <a href="./home.jsp"><img src="img/logo.png" alt=""></a>
            </div>
            <div class="nav-right">
                <a href="#" class="primary-btn">Make a Reservation</a>
                <a href="MainController?btnAction=Logout" class="primary-btn">Log out</a>
            </div>
            <nav class="main-menu mobile-menu">
                <ul>
                    <li><a href="./home.jsp">Home</a></li>
                    <li><a href="./about-us.jsp">About</a></li>
                    <li><a href="rooms.jsp">Rooms</a></li>
                    <li><a href="rooms.jsp">Pages</a>
                        <ul class="drop-menu">
                            <li><a href="about-us.jsp">About Us</a></li>
                            <li><a href="rooms.jsp">Rooms</a></li>
                            <li><a href="services.jsp">Services</a></li>
                        </ul>
                    </li>
                    <li><a href="./blog.jsp">News</a></li>
                    <li><a href="./contact.jsp">Contact</a></li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
        </div>
    </div>
</header>
<!-- Header End -->

<!-- Hero Area Section Begin -->
<div class="hero-area set-bg other-page" data-setbg="img/about_bg.jpg">
</div>
<!-- Hero Area Section End -->

<!-- Search Filter Section Begin -->
<section class="search-filter other-page-filter">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <form action="#" class="check-form">
                    <h4>Check Availability</h4>
                    <div class="datepicker">
                        <p>From</p>
                        <input type="text" class="datepicker-1" value="dd / mm / yyyy">
                        <img src="img/calendar.png" alt="">
                    </div>
                    <div class="datepicker">
                        <p>To</p>
                        <input type="text" class="datepicker-2" value="dd / mm / yyyy">
                        <img src="img/calendar.png" alt="">
                    </div>
                    <div class="room-quantity">
                        <div class="single-quantity">
                            <p>Adults</p>
                            <div class="pro-qty"><input type="text" value="0"></div>
                        </div>
                        <div class="single-quantity">
                            <p>Children</p>
                            <div class="pro-qty"><input type="text" value="0"></div>
                        </div>
                        <div class="single-quantity last">
                            <p>Rooms</p>
                            <div class="pro-qty"><input type="text" value="0"></div>
                        </div>
                    </div>
                    <div class="room-selector">
                        <p>Room</p>
                        <select class="suit-select">
                            <option>Eg. Master suite</option>
                            <option value="">Double Room</option>
                            <option value="">Single Room</option>
                            <option value="">Special Room</option>
                        </select>
                    </div>
                    <button type="submit">Go</button>
                </form>
            </div>
        </div>
    </div>
</section>
<!-- Search Filter Section End -->