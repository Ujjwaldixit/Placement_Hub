<%-- 
    Document   : updateStudentProfile
    Created on : 05-Apr-2021, 3:35:42 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
        </style>
        <title>JSP Page</title>
        <style>
            html,
            body,
            h1,
            h2,
            h3,
            h4,
            h5 {
                font-family: "Raleway", sans-serif
            }


            * {
                font-family: 'Poppins', sans-serif;
                margin: 0 0 0 0;
                padding: 0px;
                box-sizing: border-box;
            }

            body {
                /*padding: 60px 140px;*/
                background: #f8f8f8;
            }

            .heading {
                font-size: 2rem;
                font-weight: 700;
            }

            .container {
                display: flex;
                margin: 50px;
                flex-direction: row;
                background: #FFFFFF;
            }

            .left-section {
                display: flex;
                flex: 1;
                justify-content: center;

            }

            .heading-text {
                margin-top: 40px;
                width: 100%;
            }

            .form {
                display: flex;
                flex-direction: column;
                justify-content: center;
                width: 100%;
                margin-top: 50px;
            }


            input[type=text] {
                margin-bottom: 30px;
                width: 100%;
                padding: 10px 2px 4px 2px;
                font-size: 1rem;
                outline: none;
                border: none;
                border-bottom: 2px solid rgb(180, 180, 180);
            }

            input[type=file],
            label {
                color: rgb(126, 125, 125);
            }

            input[type=text]:focus {
                border-bottom: 2px solid #2f87da;
            }

            .alternative-option {
                margin: 30px 0 60px 0;
                font-size: 0.8rem;
            }

            .alternative-option a {
                color: rgb(1, 80, 170);
                font-weight: 600;
                text-decoration: none;
            }

            .btn {
                margin-top: 30px;
                margin-bottom: 30px;
                padding: 10px;
                background: #2f87da;
                color: #FFFFFF;
                border: 1px transparent;
                border-radius: 5px;
                cursor: pointer;
                font-size: 1rem;
                width: 100px;
            }

            .btn:hover {
                background: #0a74d8;
            }

            .right-section {
                display: flex;
                flex: 1.3;
                padding: 50px 0px 50px 50px;
                align-items: center;
                flex-direction: column;
                width: 100%;
            }

            .right-section img {
                animation: drop 1.5s ease;
            }

            .right-section img {
                width: 70%;
                height: auto;
            }

            .card-shadow {
                border: 1px solid white;
                box-shadow: 0px 15px 16.83px 0.17px rgb(0 0 0 / 5%);
                border-radius: 20px;
                padding-left: 30px;
                padding-right: 30px;

            }

            @keyframes drop {
                0% {
                    opacity: 0;
                    transform: translateY(-80px);
                }

                100% {
                    opacity: 1;
                    transform: translateY(0px);
                }
            }


            @media screen and (max-width: 850px) {
                .container {
                    flex-direction: column !important;
                }

                .left-section {
                    width: 100%;
                }

                .right-section {
                    align-items: center;
                    flex-direction: column;
                    width: 100%;
                }

                .btn {
                    width: 100%;
                }

                body {
                    padding: 30px 30px;
                }
            }

            @media screen and (min-width: 851px) {
                .right-section {
                    padding-top: 180px;
                }

                .card-shadow {
                    padding: 20px 80px;
                }
            }
        </style>

    </head>
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
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"><i class="fa fa-envelope"></i></a>
            <a href="studentWebinar.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Webinar"><i class="	fas fa-chalkboard-teacher"></i></a>

            <div class="w3-dropdown-hover w3-hide-small">
                <button class="w3-button w3-padding-large" title="Notifications"><i class="fa fa-bell"></i><span class="w3-badge w3-right w3-small w3-green">3</span></button>     
                <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
                    <a href="#" class="w3-bar-item w3-button">One new friend request</a>
                    <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
                    <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
                </div>
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

            <div class="w3-col m8">
                <div class="w3-row-padding">
                    <div class="w3-col m12">
                        <section class="container card-shadow">
                            <div class="left-section">
                                <div class="heading-text">
                                    <h1 class="heading">Update Details</h1>
                                    
                                    <form action="updateStudentProfileServ" method="post" enctype="multipart/form-data">
                                        <div class="form">
                                            <input type="text" placeholder="Name" name="name" required value="<%=student.getName()%>"/>
                                            <input type="text" placeholder="Highschool Percentage" name="high_per" required value="<%=student.getHigh_school_per()%>" />
                                            <input type="text" placeholder="Intermediate Percentage" name="inter_per" required value="<%=student.getIntermidiate_per()%>"/>
                                            <input type="text" placeholder="Roll no" name="roll_no" required value="<%=student.getRoll_no()%>"/>
                                            <input type="text" placeholder="Email" name="email" required value="<%=student.getEmail()%>"/>
                                            <input type="text" placeholder="Course" name="course" required value="<%=student.getCourse()%>"/>
                                            <input type="text" placeholder="Department" name="depart" required value="<%=student.getDept()%>"/>
                                            <input type="text" placeholder="Contact Number" name="mobile" required value="<%=student.getMobile_no()%>"/>
                                            <input type="text" placeholder="Passout Year" name="passout_year" required value="<%=student.getPassout_year()%>"/>
                                            <input type="text" placeholder="UG Percentage" name="pg_per" required value="<%=student.getUg_per()%>"/>
                                            <input type="text" placeholder="PG Percentage" name="ug_per" required value="<%=student.getPg_per()%>" />
                                            <label for="img">Add a picture:</label>
                                            <input type="file" id="img" name="profile_pic" accept="image/*">
                                            <button class="btn" type="submit">Update</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="right-section">
                                <img class="" src="images/2107.jpg" alt="student">
                            </div>
                        </section>
                    </div>

                    <!-- End Grid -->
                </div>
            </div>

            <!-- End Page Container -->

            <br>
        </div>
    </div>



</body>
</html>