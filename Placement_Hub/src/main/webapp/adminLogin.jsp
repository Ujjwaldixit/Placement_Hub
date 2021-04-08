<%-- 
    Document   : adminLogin
    Created on : 07-Mar-2021, 4:24:49 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            * {
                font-family: 'Poppins', sans-serif;
                margin: 0 0 0 0;
                padding: 0px;
                box-sizing: border-box;
            }

            body {
                padding: 60px 140px;
                background: #f8f8f8;
            }

            .heading {
                font-size: 2rem;
                font-weight: 700;
            }

            .container {
                display: flex;
                flex-direction: row;
                background: #FFFFFF;
            }

            .right-section {
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


            input {
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

            .btn {
                margin-top: 30px;
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

            .left-section {
                display: flex;
                flex: 1.3;
                padding: 50px 0px 50px 50px;
                align-items: center;
                flex-direction: column;
                width: 100%;
            }

            .left-section img {
                animation: drop 1.5s ease;
            }


            .card-shadow {
                border: 1px solid white;
                box-shadow: 0px 15px 16.83px 0.17px rgb(10 117 217 / 50%);
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
                    flex-direction: column-reverse !important;
                }

                .right-section {
                    width: 100%;
                }

                .left-section {
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
                .left-section {
                    padding-top: 100px;
                }

                .card-shadow {
                    padding: 20px 80px;
                }
            }
        </style>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet">
        <title>Admin Login</title>
    </head>

    <body>
        <main>
            <section class="container card-shadow">
                <div class="left-section">
                    <img class="" src="images/image_login.jpg" alt="Loading soon...">
                </div>
                <div class="right-section">
                    <div class="heading-text">
                        <h1 class="heading">Log in</h1>
                        <form action="AdminLogin" method="post">
                            <div class="form">
                                <input type="text" placeholder="Username" name="name" required />
                                <input type="text" placeholder="Password" name="password" required />
                                <button class="btn" type="submit">Log in</button>
                            </div>
                            <a href="forgot_password.jsp">forgot Password?</a>
                        </form>
                    </div>
                </div>
            </section>
        </main>
    </body>

</html>
