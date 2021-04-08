

<%@page import="com.amrph.entities.drives"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.amrph.dao.drivesDao"%>
<%@page import="com.amrph.helper.connection_provider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    <body class="w3-theme-indigo">
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
        <div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
            <!-- The Grid -->
            <div class="w3-row">
                <!-- Left Column -->
                <%@include file="studentLeftbar.jsp" %>
                <%                    int jobno = Integer.parseInt(request.getParameter("jobNo"));

                    drivesDao drivesDao = new drivesDao(connection_provider.getconnection());
                    ArrayList<drives> drive = drivesDao.getDrive(jobno);
                    for (drives d : drive) {
                %>

                <div class="w3-col m9">
                    <div class="w3-row-padding">
                        <div class="w3-col m12">
                            <div class="w3-card-4 w3-margin w3-white">

                                <img src="companyImages/<%=d.getPic()%>" alt="Nature" style="width:100%;height:400px">
                                <img src="logo/<%=d.getLogo()%>" alt="Nature" style="width:200px;height:150px;position: relative;top:-120px;left:50px;border:2px solid black">
                                <div class="w3-container">
                                    <h3><b>JOB DESCRIPTION</b></h3>
                                    <h5>Expires On <span class="w3-opacity"><%=d.getDateOfExp()%></span></h5>
                                </div>

                                <div class="w3-container">
                                    <pre style="white-space: pre-wrap;      
                                         white-space: -moz-pre-wrap;  
                                         white-space: -pre-wrap;      
                                         white-space: -o-pre-wrap;   
                                         word-wrap: break-word;"><%=d.getJobDesc()%></pre>

                                </div>
                            </div>
                            <hr>

                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <script>
            var openInbox = document.getElementById("myBtn");
            openInbox.click();

            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("myOverlay").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("myOverlay").style.display = "none";
            }

            function myFunc(id) {
                var x = document.getElementById(id);
                if (x.className.indexOf("w3-show") == -1) {
                    x.className += " w3-show";
                    x.previousElementSibling.className += " w3-red";
                } else {
                    x.className = x.className.replace(" w3-show", "");
                    x.previousElementSibling.className =
                            x.previousElementSibling.className.replace(" w3-red", "");
                }
            }

            openMail("Borge")
            function openMail(personName) {
                var i;
                var x = document.getElementsByClassName("person");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                x = document.getElementsByClassName("test");
                for (i = 0; i < x.length; i++) {
                    x[i].className = x[i].className.replace(" w3-light-grey", "");
                }
                document.getElementById(personName).style.display = "block";
                event.currentTarget.className += " w3-light-grey";
            }
        </script>

        <script>
            var openTab = document.getElementById("firstTab");
            openTab.click();
        </script>

    </body>
</html>
