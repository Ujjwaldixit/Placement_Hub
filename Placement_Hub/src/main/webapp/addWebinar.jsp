<%-- 
    Document   : addWebinar
    Created on : 02-Apr-2021, 8:19:06 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>W3.CSS Template</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            //changing the form 
            jQuery.noConflict();
            jQuery(document).ready(function (e) {
                jQuery(".btn").click(function (e) {
                    e.preventDefault();
                    jQuery(".before").addClass("hide");
                    jQuery(".later").removeClass("hide");
                });
            });

        </script>

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
                flex: 40%;
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

            .sub {
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

            .sub:hover {
                background: #0a74d8;
            }

            .right-section {
                display: flex;
                flex: 60%;
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

            .hide {
                display: none;
            }

            #redirect {
                display: flex;
                flex-direction: row-reverse;
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
                    padding-top: 60px;
                }

                .card-shadow {
                    padding: 20px 80px;
                }
            }
        </style>

    </head>
    <body class="w3-light-grey">

        <!-- Top container -->
        <div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
            <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey"
                    onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
            <span class="w3-bar-item w3-right">Logo</span>
        </div>

        <!-- Sidebar/menu -->
        <%@include file="AdminSidebar.jsp" %>


        <!-- Overlay effect when opening sidebar on small screens -->


        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <section class="container card-shadow">
                <div class="left-section">
                    <div class="heading-text">
                        <h1 class="heading"> Webinar</h1>

                        <form>
                            <div id="webinarDetails">
                                <div class="before">
                                    <input type="text" placeholder="Enter Agenda" name="agenda" required>
                                    <input type="text" placeholder="Description" name="description" required>
                                    <input type="time" placeholder="Enter time" name="time" required>
                                    <input type="date" placeholder="Enter Date" name="date" required>
                                    <button class="btn sub" onclick=" window.open('https://apps.google.com/meet/','_blank')">Next</button>
                                </div>
                                <div class="later hide">
                                    <input type="text" placeholder="enter link" id="link" name="link" required="">
                                    <button class="sub" type="submit" formaction="addWebinarServ">next</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="right-section">
                    <img class="" src="images/2107.jpg" alt="student">
                </div>
            </section>





    </body>
</html>



