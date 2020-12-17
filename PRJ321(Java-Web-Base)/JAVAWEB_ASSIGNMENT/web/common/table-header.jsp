<%@page import="danhnlc.dtos.User"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    User user = (User) session.getAttribute("LOGIN_USER");

    if (user == null) {
        response.sendRedirect("index.jsp");
    } else if (!user.getRoleID().equals("MA")) {
        response.sendRedirect("index.jsp");
    }
%>

<div id="navbar" class="navbar navbar-default">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="navbar-container" id="navbar-container">
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
            <span class="sr-only">Toggle sidebar</span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>
        </button>

        <div class="navbar-header pull-left">
            <a href="admin.jsp" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    Ace Admin
                </small>
            </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="grey">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="ace-icon fa fa-tasks"></i>
                        <span class="badge badge-grey">4</span>
                    </a>

                    <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="ace-icon fa fa-check"></i>
                            4 Tasks to complete
                        </li>

                        <li class="dropdown-content">
                            <ul class="dropdown-menu dropdown-navbar">
                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">Software Update</span>
                                            <span class="pull-right">65%</span>
                                        </div>

                                        <div class="progress progress-mini">
                                            <div style="width:65%" class="progress-bar"></div>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">Hardware Upgrade</span>
                                            <span class="pull-right">35%</span>
                                        </div>

                                        <div class="progress progress-mini">
                                            <div style="width:35%" class="progress-bar progress-bar-danger"></div>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">Unit Testing</span>
                                            <span class="pull-right">15%</span>
                                        </div>

                                        <div class="progress progress-mini">
                                            <div style="width:15%" class="progress-bar progress-bar-warning"></div>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">Bug Fixes</span>
                                            <span class="pull-right">90%</span>
                                        </div>

                                        <div class="progress progress-mini progress-striped active">
                                            <div style="width:90%" class="progress-bar progress-bar-success"></div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown-footer">
                            <a href="#">
                                See tasks with details
                                <i class="ace-icon fa fa-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="purple">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="ace-icon fa fa-bell icon-animated-bell"></i>
                        <span class="badge badge-important">8</span>
                    </a>

                    <ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="ace-icon fa fa-exclamation-triangle"></i>
                            8 Notifications
                        </li>

                        <li class="dropdown-content">
                            <ul class="dropdown-menu dropdown-navbar navbar-pink">
                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">
                                                <i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
                                                New Comments
                                            </span>
                                            <span class="pull-right badge badge-info">+12</span>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <i class="btn btn-xs btn-primary fa fa-user"></i>
                                        Bob just signed up as an editor ...
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">
                                                <i class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
                                                New Orders
                                            </span>
                                            <span class="pull-right badge badge-success">+8</span>
                                        </div>
                                    </a>
                                </li>

                                <li>
                                    <a href="#">
                                        <div class="clearfix">
                                            <span class="pull-left">
                                                <i class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
                                                Followers
                                            </span>
                                            <span class="pull-right badge badge-info">+11</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown-footer">
                            <a href="#">
                                See all notifications
                                <i class="ace-icon fa fa-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="green">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
                        <span class="badge badge-success">5</span>
                    </a>

                    <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="ace-icon fa fa-envelope-o"></i>
                            5 Messages
                        </li>

                        <li class="dropdown-content">
                            <ul class="dropdown-menu dropdown-navbar">
                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" />
                                        <span class="msg-body">
                                            <span class="msg-title">
                                                <span class="blue">Alex:</span>
                                                Ciao sociis natoque penatibus et auctor ...
                                            </span>

                                            <span class="msg-time">
                                                <i class="ace-icon fa fa-clock-o"></i>
                                                <span>a moment ago</span>
                                            </span>
                                        </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="assets/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar" />
                                        <span class="msg-body">
                                            <span class="msg-title">
                                                <span class="blue">Susan:</span>
                                                Vestibulum id ligula porta felis euismod ...
                                            </span>

                                            <span class="msg-time">
                                                <i class="ace-icon fa fa-clock-o"></i>
                                                <span>20 minutes ago</span>
                                            </span>
                                        </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="assets/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar" />
                                        <span class="msg-body">
                                            <span class="msg-title">
                                                <span class="blue">Bob:</span>
                                                Nullam quis risus eget urna mollis ornare ...
                                            </span>

                                            <span class="msg-time">
                                                <i class="ace-icon fa fa-clock-o"></i>
                                                <span>3:15 pm</span>
                                            </span>
                                        </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="assets/avatars/avatar2.png" class="msg-photo" alt="Kate's Avatar" />
                                        <span class="msg-body">
                                            <span class="msg-title">
                                                <span class="blue">Kate:</span>
                                                Ciao sociis natoque eget urna mollis ornare ...
                                            </span>

                                            <span class="msg-time">
                                                <i class="ace-icon fa fa-clock-o"></i>
                                                <span>1:33 pm</span>
                                            </span>
                                        </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="clearfix">
                                        <img src="assets/avatars/avatar5.png" class="msg-photo" alt="Fred's Avatar" />
                                        <span class="msg-body">
                                            <span class="msg-title">
                                                <span class="blue">Fred:</span>
                                                Vestibulum id penatibus et auctor  ...
                                            </span>

                                            <span class="msg-time">
                                                <i class="ace-icon fa fa-clock-o"></i>
                                                <span>10:09 am</span>
                                            </span>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown-footer">
                            <a href="inbox.jsp">
                                See all messages
                                <i class="ace-icon fa fa-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="assets/avatars/avatar2.png" alt="" />
                        <span class="user-info">
                            <small>Welcome,</small>
                            <%= user.getFullname() %>
                        </span>

                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="#">
                                <i class="ace-icon fa fa-cog"></i>
                                Settings
                            </a>
                        </li>

                        <li>
                            <a href="profile.jsp">
                                <i class="ace-icon fa fa-user"></i>
                                Profile
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="MainController?btnAction=Logout">
                                <i class="ace-icon fa fa-power-off"></i>
                                Logout
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!-- /.navbar-container -->
</div>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div id="sidebar" class="sidebar                  responsive">
        <script type="text/javascript">
            try {
                ace.settings.check('sidebar', 'fixed')
            } catch (e) {
            }
        </script>

        <div class="sidebar-shortcuts" id="sidebar-shortcuts">
            <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                <button class="btn btn-success">
                    <i class="ace-icon fa fa-signal"></i>
                </button>

                <button class="btn btn-info">
                    <i class="ace-icon fa fa-pencil"></i>
                </button>

                <button class="btn btn-warning">
                    <i class="ace-icon fa fa-users"></i>
                </button>

                <button class="btn btn-danger">
                    <i class="ace-icon fa fa-cogs"></i>
                </button>
            </div>

            <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                <span class="btn btn-success"></span>

                <span class="btn btn-info"></span>

                <span class="btn btn-warning"></span>

                <span class="btn btn-danger"></span>
            </div>
        </div><!-- /.sidebar-shortcuts -->

        <ul class="nav nav-list">
            <li class="">
                <a href="admin.jsp">
                    <i class="menu-icon fa fa-tachometer"></i>
                    <span class="menu-text"> Dashboard </span>
                </a>

                <b class="arrow"></b>
            </li>

            <li class="active open">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-list"></i>
                    <span class="menu-text"> Tables </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="MainController?btnAction=Load_table_user">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Users
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="MainController?btnAction=Load_table_room">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Room
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="MainController?btnAction=Load_table_roomType">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Room-Type
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="MainController?btnAction=Load_table_role">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Role
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-pencil-square-o"></i>
                    <span class="menu-text"> Forms </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="form-elements.jsp">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Form Elements
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="form-elements-2.jsp">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Form Elements 2
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="form-wizard.jsp">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Wizard &amp; Validation
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="wysiwyg.jsp">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Wysiwyg &amp; Markdown
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="dropzone.jsp">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Dropzone File Upload
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

            <li class="">
                <a href="widgets.jsp">
                    <i class="menu-icon fa fa-list-alt"></i>
                    <span class="menu-text"> Widgets </span>
                </a>

                <b class="arrow"></b>
            </li>

            <li class="">
                <a href="calendar.jsp">
                    <i class="menu-icon fa fa-calendar"></i>

                    <span class="menu-text">
                        Calendar

                        <span class="badge badge-transparent tooltip-error" title="2 Important Events">
                            <i class="ace-icon fa fa-exclamation-triangle red bigger-130"></i>
                        </span>
                    </span>
                </a>

                <b class="arrow"></b>
            </li>

            <li class="">
                <a href="gallery.jsp">
                    <i class="menu-icon fa fa-picture-o"></i>
                    <span class="menu-text"> Gallery </span>
                </a>

                <b class="arrow"></b>
            </li>

            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-tag"></i>
                    <span class="menu-text"> More Pages </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="login.jsp">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Login &amp; Register
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-file-o"></i>

                    <span class="menu-text">
                        Other Pages

                        <span class="badge badge-primary">5</span>
                    </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="faq.jsp">
                            <i class="menu-icon fa fa-caret-right"></i>
                            FAQ
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="error-404.jsp">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Error 404
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="error-500.jsp">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Error 500
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
        </ul><!-- /.nav-list -->

        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>

        <script type="text/javascript">
            try {
                ace.settings.check('sidebar', 'collapsed')
            } catch (e) {
            }
        </script>
    </div>

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="admin.jsp">Home</a>
                    </li>

                    <li>
                        <a href="#">Tables</a>
                    </li>
                    <li class="active">Users</li>
                </ul><!-- /.breadcrumb -->

                <div class="nav-search" id="nav-search">
                    <form class="form-search">
                        <span class="input-icon">
                            <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                            <i class="ace-icon fa fa-search nav-search-icon"></i>
                        </span>
                    </form>
                </div><!-- /.nav-search -->
            </div>

            <div class="page-content">
                <div class="ace-settings-container" id="ace-settings-container">
                    <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                        <i class="ace-icon fa fa-cog bigger-130"></i>
                    </div>

                    <div class="ace-settings-box clearfix" id="ace-settings-box">
                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <div class="pull-left">
                                    <select id="skin-colorpicker" class="hide">
                                        <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                        <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                        <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                        <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                    </select>
                                </div>
                                <span>&nbsp; Choose Skin</span>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
                                <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                                <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
                                <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                                <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                                <label class="lbl" for="ace-settings-add-container">
                                    Inside
                                    <b>.container</b>
                                </label>
                            </div>
                        </div><!-- /.pull-left -->

                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" />
                                <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" />
                                <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" />
                                <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                            </div>
                        </div><!-- /.pull-left -->
                    </div><!-- /.ace-settings-box -->
                </div><!-- /.ace-settings-container -->

                <div class="page-header">
                    <h1>
                        Tables
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                        </small>
                    </h1>
                </div><!-- /.page-header -->
