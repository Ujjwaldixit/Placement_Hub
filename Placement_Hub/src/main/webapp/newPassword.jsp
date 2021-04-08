<%@page import="com.amrph.entities.admin"%>


<%@page import="com.amrph.dao.AdminDao"%>
<%@page import="com.amrph.helper.connection_provider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>E-mail Verification</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
            }

            main {
                display: flex;
            }

            .section1 {
                flex: 1;
            }

            .cir1 {
                position: absolute;
                left: -500px;
                width: 100%;
                height: 100%;
                z-index: -1;
                animation: cove 1s ease-in 2s;
            }

            .cir2 {
                position: absolute;
                left: -400px;
                width: 100%;
                height: 100%;
                z-index: -2;
                animation: cove 1s ease-in 1s;
            }

            .cir3 {
                position: absolute;
                left: -300px;
                width: 100%;
                height: 100%;
                z-index: -3;
                animation: cove 1s ease-in;
            }

            .cover {
                width: 70%;
                height: auto;
                padding: 40px 0 0 40px;
                animation: cove 1s ease-in 3s;
            }

            .section2 {
                flex: 1;
            }

            .card {
                margin: 50px 30px auto 70px;
                display: flex;
                justify-content: center;
                flex-direction: column;
                align-items: flex-start;
                padding-right: 60px;
            }

            .heading {
                padding-bottom: 0;
                font-size: 36px;
                margin-bottom: 0;
            }

            .msg {
                font-size: 20px;
                padding-bottom: 80px;
            }

            .email {
                margin-top: 40px;
                margin-bottom: 30px;
                border: none;
                border-bottom: 1px solid black;
                width: 100%;
                font-size: 18px;
                outline: none;
            }

            input[type="email"]:focus{
                border-bottom: 2px solid rgb(98, 179, 211);
            }

            .btn {
                width: 80px;
                height: 30px;
                border-radius: 5px;
                border: none;
                background-color: #2996E5;
                color: white;
                cursor: pointer;
                margin-bottom: 20px;
            }

            .btn:hover {
                box-shadow: 0 4px 6px 0.1px rgba(122, 203, 235, 0.521);
                background-color: rgba(122, 203, 235, 0.521);
                color: rgb(88, 88, 184);
            }

            @keyframes cove {
                0% {
                    opacity: 0;
                    transform: translateY(-80px);
                }

                100% {
                    opacity: 1;
                    transform: translateY(0);
                }

            }

            @media screen and (max-width: 750px) {
                .section1 {
                    display: none;
                }

                .section2 {
                    margin-top: 40px;
                }

            }



            @media screen and (max-width: 851px) {
                .cover {
                    padding-top: 50px;
                }
            }
        </style>
    </head>

    <body>
        <main>
            <div class="section1">
                <img class="cir1" src="images/Ellipse 1.svg" alt="">
                <img class="cir2" src="images/Ellipse 2.svg" alt="">
                <img class="cir3" src="images/Ellipse 3.svg" alt="">
                <img class="cover" src="images/img-1.svg" alt="">

            </div>
            <div class="section2">
                <div class="card">
                    <h1 class="heading">Enter your E-mail and New Password</h1>
                    <form action="newPasswordServ" method="post">
                        <input class="email" type="text" name="email" placeholder="Re-Type yout Email">
                        <input  class="email" type="text" name="newPassword" placeholder="Enter New Password">
                        <input type="hidden" name="userName" value="">
                        <input type="hidden" name="entities" value="<%=session.getAttribute("entity")%>">
                        
                        <input class="btn" type="submit" value="Send">
                    </form>
                </div>
            </div>
        </main>
    </body>

</html>
