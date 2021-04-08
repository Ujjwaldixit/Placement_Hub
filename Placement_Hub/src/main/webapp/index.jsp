<%-- 
    Document   : index
    Created on : 07-Mar-2021, 11:45:36 am
    Author     : ASUS
--%>

<%@page import="com.amrph.entities.student"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.amrph.dao.AdminDao"%>
<%@page import="com.amrph.dao.StudentDao"%>
<%@page import="com.amrph.helper.connection_provider"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>Landing Page</title>

        <!--
        
        Breezed Template
        
        https://templatemo.com/tm-543-breezed
        
        -->
        <!-- Additional CSS Files -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

        <link rel="stylesheet" href="assets/css/templatemo-breezed.css">

        <link rel="stylesheet" href="assets/css/owl-carousel.css">

        <link rel="stylesheet" href="assets/css/lightbox.css">

    </head>

    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="preloader">
            <div class="jumper">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>  
        <!-- ***** Preloader End ***** -->


        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a href="index.jsp" class="logo">
                                .Placement Hub
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li class="scroll-to-section"><a href="#top" class="active">Home</a></li>
                                <li class="scroll-to-section"><a href="#about">About</a></li>
                                <li class="scroll-to-section"><a href="#projects">our Stars</a></li>
                                <li class="submenu">
                                    <a href="javascript:;">Log In</a>
                                    <ul>
                                        <li><a href="studentLogin.jsp">Student Login</a></li>
                                        <li><a href="adminLogin.jsp">Admin Login</a></li>

                                    </ul>
                                </li>
                                <div class="search-icon">
                                    <a href="#search"><i class="fa fa-search"></i></a>
                                </div>
                            </ul>        
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- ***** Header Area End ***** -->

        <!-- ***** Search Area ***** -->
        <div id="search">
            <button type="button" class="close">×</button>
            <form id="contact" action="#" method="get">
                <fieldset>
                    <input type="search" name="q" placeholder="SEARCH KEYWORD(s)" aria-label="Search through site content">
                </fieldset>
                <fieldset>
                    <button type="submit" class="main-button">Search</button>
                </fieldset>
            </form>
        </div>

        <!-- ***** Main Banner Area Start ***** -->
        <div class="main-banner header-text" id="top">
            <div class="Modern-Slider">
                <!-- Item -->
                <div class="item">
                    <div class="img-fill">
                        <img src="assets/images/slide-01.jpg" alt="">
                        <div class="text-content">
                            <h3>Welcome To Placement Hub</h3>
                            <h5>Get your Placement Today</h5>
                            <a href="#" class="main-stroked-button">Learn More</a>
                            <a href="#" class="main-filled-button">Get It Now</a>
                        </div>
                    </div>
                </div>
              
            </div>
        </div>
        <div class="scroll-down scroll-to-section"><a href="#about"><i class="fa fa-arrow-down"></i></a></div>
        <!-- ***** Main Banner Area End ***** -->

        <!-- ***** About Area Starts ***** -->
        <section class="section" id="about">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-xs-12">
                        <div class="left-text-content">
                            <div class="section-heading">
                                <h6>About Us</h6>
                                <h2>We work with top brands and startups</h2>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="service-item">
                                        <img src="assets/images/service-item-01.png" alt="">
                                        <h4>Top Notch</h4>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="service-item">
                                        <img src="assets/images/service-item-01.png" alt="">
                                        <h4>Robust</h4>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="service-item">
                                        <img src="assets/images/contact-info-03.png" alt="">
                                        <h4>Reliable</h4>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="service-item">
                                        <img src="assets/images/contact-info-03.png" alt="">
                                        <h4>Up-to-date</h4>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <a href="#" class="main-button-icon">
                                        Learn More <i class="fa fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-xs-12">
                        <div class="right-text-content">
                            <p><a rel="nofollow noopener" href="https://templatemo.com/tm-543-breezed" target="_parent">Breezed HTML Template</a> is provided by TemplateMo for absolutely free of charge. You can download, edit and use this for your non-commercial and commercial websites. 
                                <br><br>Redistributing this template as a downloadable ZIP file on any template collection website is strictly prohibited. You will need to talk to us if you want to redistribute this template. Thank you.
                                <br><br>This is a Bootstrap v4.3.1 CSS layout. Do you like it? You can feel free to <a rel="nofollow noopener" href="https://templatemo.com/contact" target="_parent">talk to us</a> if you have anything.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** About Area Ends ***** -->

        <!-- ***** Features Big Item Start ***** -->

        <!-- ***** Features Big Item End ***** -->

        <!-- ***** Features Big Item Start ***** -->
        <section class="section" id="subscribe">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="section-heading">

                            <h2>Don?t miss this chance!</h2>
                        </div>
                        <div class="subscribe-content">
                            <p>Vivamus suscipit blandit nibh, in cursus mi. Proin vel blandit metus, et auctor elit. Vivamus tincidunt tristique convallis. Ut nec odio vel arcu euismod semper nec ac sem.</p>
                            <div class="subscribe-form">
                                <form id="subscribe-now" action="" method="get">
                                    <div class="row">
                                        <div class="col-md-8 col-sm-12">

                                        </div>
                                        <div class="col-md-4 col-sm-12">
                                            <fieldset>
                                                <button id="form-submit" class="main-button"><a href="studentLogin.jsp" style="text-decoration: none;">Register Now</a></button>
                                            </fieldset>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** Features Big Item End ***** -->


        <!-- ***** Projects Area Starts ***** -->
        <section class="section" id="projects">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="section-heading">
                            <h6>Our Stars</h6>
                            <h2>Some of our Recently placed Students</h2>
                        </div>
                        <div class="filters">

                        </div>
                    </div>
                    <%
                        AdminDao admindao = new AdminDao(connection_provider.getconnection());
                        ResultSet rs = admindao.getPlacedStudent();
                        StudentDao StudentDao = new StudentDao(connection_provider.getconnection());
                        int count = 0;
                    %>

                    <div class="col-lg-9">
                        <div class="filters-content">
                            <div class="row grid">
                                <%
                                    while (rs.next()) {
                                        if (count > 8) {
                                            break;
                                        }
                                        student student = StudentDao.getAllUniqueData((int) rs.getInt("sno"));

                                %>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 all des">
                                    <div class="item">
                                        <a href="images/<%=student.getProfile_pic()%>" data-lightbox="image-1" data-title="Our Projects"><img src="images/<%=student.getProfile_pic()%>" alt=""></a>
                                    </div>
                                </div>
                                <%
                                        count++;
                                    }
                                %>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** Projects Area Ends ***** -->

        <!-- ***** Testimonials Starts ***** -->
        <section class="section" id="testimonials">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <h6>Digital Team</h6>
                            <h2>young and talented members</h2>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 mobile-bottom-fix-big" data-scroll-reveal="enter left move 30px over 0.6s after 0.4s">
                        <div class="owl-carousel owl-theme">
                            <div class="item author-item">
                                <div class="member-thumb">
                                    <img src="images/ujjwal.jpg" alt="" style="width:300px;height:300px">
                                    <div class="hover-effect">
                                        <div class="hover-content">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                                <li><a href="#"><i class="fa fa-rss"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <h4>.01 Ujjwal Dixit</h4>
                                <span>Full Stack Development</span>
                            </div>
                            <div class="item author-item">
                                <div class="member-thumb">
                                    <img src="images/ashish.jpeg" alt="" style="width:300px;height:300px">
                                    <div class="hover-effect">
                                        <div class="hover-content">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                                <li><a href="#"><i class="fa fa-rss"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <h4>.02 Ashish Kandpal</h4>
                                <span>Front end Developer</span>
                            </div>
                            <div class="item author-item">
                                <div class="member-thumb">
                                    <img src="images/rahul.jpeg" alt="" style="width:300px;height:300px">
                                    <div class="hover-effect">
                                        <div class="hover-content">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                                <li><a href="#"><i class="fa fa-rss"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <h4>.Rahul Singh</h4>
                                <span>Front End Developer</span>
                            </div>
                            <div class="item author-item">
                                <div class="member-thumb">
                                    <img src="assets/images/member-item-05.jpg" alt="">
                                    <div class="hover-effect">
                                        <div class="hover-content">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                                <li><a href="#"><i class="fa fa-rss"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <h4>.04 Catherine Phyu</h4>
                                <span>Co Founder</span>
                            </div>
                            <div class="item author-item">
                                <div class="member-thumb">
                                    <img src="assets/images/member-item-03.jpg" alt="">
                                    <div class="hover-effect">
                                        <div class="hover-content">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                                <li><a href="#"><i class="fa fa-rss"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <h4>.05 Shao Lynn</h4>
                                <span>Chief Marketing</span>
                            </div>

                            <div class="item author-item">
                                <div class="member-thumb">
                                    <img src="assets/images/member-item-04.jpg" alt="">
                                    <div class="hover-effect">
                                        <div class="hover-content">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                                <li><a href="#"><i class="fa fa-rss"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <h4>.06 Emma Honey</h4>
                                <span>Digital Influencer</span>
                            </div>

                            <div class="item author-item">
                                <div class="member-thumb">
                                    <img src="assets/images/member-item-06.jpg" alt="">
                                    <div class="hover-effect">
                                        <div class="hover-content">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                                <li><a href="#"><i class="fa fa-rss"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <h4>.07 Oliva Sofie</h4>
                                <span>Website Analyst</span>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-xs-12">
                        <div class="left-text-content">
                            <p>Copyright &copy; 2020 Breezed Co., Ltd. 

                                - Design: <a rel="nofollow noopener" href="https://templatemo.com">TemplateMo</a></p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xs-12">
                        <div class="right-text-content">
                            <ul class="social-icons">
                                <li><p>Follow Us</p></li>
                                <li><a rel="nofollow" href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a rel="nofollow" href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a rel="nofollow" href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a rel="nofollow" href="#"><i class="fa fa-dribbble"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>


        <!-- jQuery -->
        <script src="assets/js/jquery-2.1.0.min.js"></script>

        <!-- Bootstrap -->
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- Plugins -->
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/scrollreveal.min.js"></script>
        <script src="assets/js/waypoints.min.js"></script>
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/js/imgfix.min.js"></script> 
        <script src="assets/js/slick.js"></script> 
        <script src="assets/js/lightbox.js"></script> 
        <script src="assets/js/isotope.js"></script> 

        <!-- Global Init -->
        <script src="assets/js/custom.js"></script>

        <script>

            $(function () {
                var selectedClass = "";
                $("p").click(function () {
                    selectedClass = $(this).attr("data-rel");
                    $("#portfolio").fadeTo(50, 0.1);
                    $("#portfolio div").not("." + selectedClass).fadeOut();
                    setTimeout(function () {
                        $("." + selectedClass).fadeIn();
                        $("#portfolio").fadeTo(50, 1);
                    }, 500);

                });
            });

        </script>

    </body>
</html>
