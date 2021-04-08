


<%@page import="java.time.Month"%>
<%@page import="com.amrph.entities.webinar"%>
<%@page import="com.amrph.dao.getWebinarDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.amrph.entities.drives"%>
<%@page import="com.amrph.dao.drivesDao"%>
<%@page import="com.amrph.helper.connection_provider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <title>W3.CSS Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
    </style>
    <style>
        .event-container {
            font-family: "Roboto", sans-serif;
            max-width: 800px;
            margin: 0 auto;
        }

        .event-container h3.year {
            font-size: 40px;
            text-align: center;
            border-bottom: 1px solid #b1b1b1;
        }

        .event-container .event {
            box-shadow: 0 4px 16px -8px rgba(0, 0, 0, 0.4);
            display: flex;
            border-radius: 8px;
            margin: 32px 0;
        }

        .event .event-left {
            background: #222;
            min-width: 82px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #eee;
            padding: 8px 48px;
            font-weight: bold;
            text-align: center;
            border-radius: 8px 0 0 8px;
        }

        .event .event-left .date {
            font-size: 56px;
        }

        .event .event-left .month {
            font-size: 16px;
            font-weight: normal;
        }

        .event .event-right {
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 24px;
        }

        .event .event-right h3.event-title {
            font-size: 24px;
            margin: 24px 0 10px 0;
            color: #218bbb;
            text-transform: uppercase;
        }

        .event .event-right .event-timing {
            background: #fff8ba;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100px;
            padding: 8px;
            border-radius: 16px;
            margin: 24px 0;
            font-size: 14px;
        }

        .event .event-right .event-timing img {
            height: 20px;
            padding-right: 8px;
        }

        @media (max-width: 550px) {
            .event {
                flex-direction: column;
            }

            .event .event-left {
                padding: 0;
                border-radius: 8px 8px 0 0;
            }

            .event .event-left .event-date .date,
            .event .event-left .event-date .month {
                display: inline-block;
                font-size: 24px;
            }

            .event .event-left .event-date {
                padding: 10px 0;
            }
        }
    </style>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <body class="w3-theme-indigo">
        <!-- Navbar -->
        <div class="w3-top">
            <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
                <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
                <a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Logo</a>
                <div class="w3-dropdown-hover w3-hide-small">
                    <button class="w3-button w3-padding-large" title="Account Settings"><i class="fa fa-user"></i></button>     
                    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
                        <a href="updateStudentProfile.jsp" class="w3-bar-item w3-button">Update profile</a>
                        <a href="forgot_password.jsp" class="w3-bar-item w3-button">Change Password</a>
                    </div>
                </div>
                <a href="studentWebinar.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Webinar"><i class="	fas fa-chalkboard-teacher"></i></a>

                <div class="w3-dropdown-hover w3-hide-small">

                </div>
                <a href="LogoutStudent" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="Logout">
                    <i class="fa fa-power-off" style="font-size:24px"></i>
                </a>
            </div>
        </div>

        <!-- Navbar on small screens -->
        <div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
            <a href="#" class="w3-bar-item w3-button w3-padding-large" ><i class="fa fa-user"></i></a>
            <a href="#" class="w3-bar-item w3-button w3-padding-large" title="Messages"><i class="fa fa-envelope"></i></a>
            <a href="#" class="w3-bar-item w3-button w3-padding-large" title="Account Settings"><i class="fa fa-user"></i></a>
            <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
        </div>


        <!-- Page Container -->
        <div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
            <!-- The Grid -->
            <div class="w3-row">
                <!-- Left Column -->
                <%@include file="studentLeftbar.jsp" %>

                <!-- Middle Column -->
                <%                    getWebinarDao getWebinarDao = new getWebinarDao(connection_provider.getconnection());
                    ArrayList<webinar> web = getWebinarDao.getWebinar();

                %>

                <h1 style="text-align:center"><i class='fas fa-chalkboard-teacher' style='font-size:40px'></i>
                    Webinars</h1>
                <div class="w3-col m7">

                    <%  for (webinar webinar : web) {
                            String Date = webinar.getDate();
                            String date = Date.substring(8, 10);
                            int mon = Integer.parseInt(Date.substring(5, 7));
                            Month month = Month.of(mon);

                    %>

                    <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                        <a href="<%=webinar.getLink()%>" style="text-decoration:none">
                            <div class="event">
                                <div class="event-left">
                                    <div class="event-date">
                                        <div class="date"><%=date%></div>
                                        <div class="month"><%=month%></div>
                                    </div>
                                </div>

                                <div class="event-right">
                                    <h3 class="event-title"><%=webinar.getAgenda()%></h3>

                                    <div class="event-description">
                                        <%=webinar.getDescription()%>
                                    </div>

                                    <div class="event-timing">
                                        <img src="images/time.png" alt="" /><%=webinar.getTime()%>
                                    </div>
                                </div>

                            </div></a>

                    </div>
                    <%
                        }
                    %>

                    <!-- End Middle Column -->
                </div>


            </div>
            <!-- Right Column -->


            <!-- End Grid -->
        </div>

        <!-- End Page Container -->

        <br>

        <!-- Footer -->


        <script>
            // Accordion
            function myFunction(id) {
                var x = document.getElementById(id);
                if (x.className.indexOf("w3-show") == -1) {
                    x.className += " w3-show";
                    x.previousElementSibling.className += " w3-theme-d1";
                } else {
                    x.className = x.className.replace("w3-show", "");
                    x.previousElementSibling.className =
                            x.previousElementSibling.className.replace(" w3-theme-d1", "");
                }
            }

            // Used to toggle the menu on smaller screens when clicking on the menu button
            function openNav() {
                var x = document.getElementById("navDemo");
                if (x.className.indexOf("w3-show") == -1) {
                    x.className += " w3-show";
                } else {
                    x.className = x.className.replace(" w3-show", "");
                }
            }
        </script>

    </body>
</html> 

