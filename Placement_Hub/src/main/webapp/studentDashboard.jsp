


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
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <body class="w3-theme-indigo">
        <%
            session.setAttribute("entity", "s");
        %>
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
                <div class="w3-col m8">
                    

                    <%                        drivesDao drivesDao = new drivesDao(connection_provider.getconnection());
                        ArrayList<drives> drivesList = drivesDao.getDrives();
                        for (drives d : drivesList) {
                            String jobDesc = d.getJobDesc();
                            if (jobDesc.length() > 210) {
                                jobDesc = jobDesc.substring(0, 185);
                            }
                    %>

                    
                                     
                    
                    <!--// start from here--> 
                    <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                        <img src="logo/<%=d.getLogo()%>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px;height:60px;border:2px solid #aaa ">
                        <h4><%=d.getCompanyName()%></h4>
                        <hr class="w3-clear">
                        <h5>Job Description</h5>
                        <h6><%=jobDesc%>....</h6>
                        <div class="w3-row-padding" style="margin:0 -16px">
                            <div class="w3-full" style="padding-left:150px">
                                <img src="companyImages/<%=d.getPic()%>" style="width:300px;border:10px solid silver" alt="Northern Lights" class="w3-margin-bottom">
                            </div>
                        </div>
                            <form action="fullJobDesc.jsp">
                                <input type="hidden" name="jobNo" value="<%=d.getJob_no()%>">
                            <button  type="submit" class="w3-button w3-theme-d1 w3-margin-bottom" ><i class="fas fa-book-open"></i> Full job Description</button> 
                        </form>
                    </div>

                    <%
                        }
                    %>
                    <!-- End Middle Column -->
                </div>

                <!-- Right Column -->
               

                <!-- End Grid -->
            </div>

            <!-- End Page Container -->
        </div>
        <br>

        <!-- Footer -->
       

        <footer class="w3-container w3-theme-d5">
            <p>copyright 2021 placement hub <a href="https://www.w3schools.com/w3css/default.asp" target="_blank"></a></p>
        </footer>

        <script>
            
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

