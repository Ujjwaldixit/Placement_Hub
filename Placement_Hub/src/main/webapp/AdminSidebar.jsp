<%@page import="com.amrph.entities.admin"%>
<%

    admin admin = (admin) session.getAttribute("currentuser");
    session.setAttribute("currentuser", admin);
    if (admin == null) {
        response.sendRedirect("adminLogin.jsp");
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <title>W3.CSS Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
    </style>

    <body class="w3-light-grey">

        <!-- Top container -->
        <div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
            <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
            <span class="w3-bar-item w3-right">Logo</span>
        </div>

        <!-- Sidebar/menu -->
        <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
            <div class="w3-container w3-row">
                <div class="w3-col s4">
                    <img src="AdminImages/<%=admin.getProfile_pic()%>" class="w3-circle w3-margin-right" style="width:70px;height: 70px;border:1px solid black" title="profile picture">
                </div>
                <div class="w3-col s8 w3-bar">
                    <span>Welcome, <%=admin.getName()%></span><br>
                    <div class="w3-dropdown-hover w3-hide-small">
                        <button class="w3-button w3-padding-medium" title="Profile"><i class="fa fa-user"></i></button>     
                        <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
                            <a href="updateProfile.jsp" class="w3-bar-item w3-button w3-animate-left">Update Profile</a>

                        </div>
                    </div>

                    <div class="w3-dropdown-hover w3-hide-small">
                        <button class="w3-button w3-padding-medium" title="Settings"><i class="fa fa-cog"></i></button>     
                        <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
                            <a href="forgot_password.jsp" class="w3-bar-item w3-button w3-animate-left">Change Password</a>

                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="w3-container">
                <h5>Dashboard</h5>
            </div>
            <div class="w3-bar-block">
                <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
                <a href="AdminDashboard.jsp" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-users fa-fw"></i>  Overview</a>
                <a href="placementDrives.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i> Placement Drives</a>
                <a href="webinar.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i> Webinar</a>
                <a href="updateShortlistedStudents.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i> Update Shortlisted Students</a>
                <a href="adminregister.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-diamond fa-fw"></i> Add Users</a>
                <a href="placedStudents.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bank fa-fw"></i>Placed Students</a>
                <a href="Logout" class="w3-bar-item w3-button w3-padding"><i class="fa fa-cog fa-fw"></i>  Sign out</a><br><br>
            </div>
        </nav>


        <!-- Overlay effect when opening sidebar on small screens -->
        <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

        <!-- !PAGE CONTENT! -->


        <script>
            // Get the Sidebar
            var mySidebar = document.getElementById("mySidebar");

            // Get the DIV with overlay effect
            var overlayBg = document.getElementById("myOverlay");

            // Toggle between showing and hiding the sidebar, and add overlay effect
            function w3_open() {
                if (mySidebar.style.display === 'block') {
                    mySidebar.style.display = 'none';
                    overlayBg.style.display = "none";
                } else {
                    mySidebar.style.display = 'block';
                    overlayBg.style.display = "block";
                }
            }

            // Close the sidebar with the close button
            function w3_close() {
                mySidebar.style.display = "none";
                overlayBg.style.display = "none";
            }
        </script>

    </body>
</html>
