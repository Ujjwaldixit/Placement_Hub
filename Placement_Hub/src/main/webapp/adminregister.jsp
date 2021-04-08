<%-- 
    Document   : adminregister
    Created on : 07-Mar-2021, 11:59:52 am
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                font-family: 'Raleway', sans-serif;
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
    <body>
        <%@include file="AdminSidebar.jsp"%>

        <div class="w3-main" style="margin-left:300px;margin-top:43px;">





            <section class="container card-shadow">
                <div class="left-section">
                    <div class="heading-text">
                        <h1 class="heading"> Add Admin</h1>

                        <form action="adminregister" method="post">
                            <div class="form">

                                <form action="adminregister" method="post"></form>
                                <input type="text" placeholder="Name" name="name" required />
                                <input type="text" placeholder="Password" name="password" required />
                                <input type="text" placeholder="Email" name="email" required />
                                <button class="btn" type="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="right-section">
                    <img class="" src="images/2107.jpg" alt="student">
                </div>
            </section>

        </div>
    </body>
</html>
