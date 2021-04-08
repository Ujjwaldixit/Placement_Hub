<%@page import="com.amrph.helper.mailSender"%>
<%
    String email = request.getParameter("email");
    mailSender mailSender = new mailSender();
    double otp = Math.random() * 10000;
    mailSender.sendOtp((int) otp, email);

%>

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
            margin: 50px 40px auto 40px;
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: flex-start;
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


        input[type=number] {
            margin-right: 15px;
            height: 45px;
            width: 45px;
            font-size: 25px;
            text-align: center;
            border: 1px solid #000000;
        }

        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }


        .btn_verify {
            width: 80px;
            height: 30px;
            border-radius: 5px;
            border: none;
            background-color: #2996E5;
            color: white;
            cursor: pointer;
            margin-top: 30px;
            margin-bottom: 20px;
        }

        .btn_verify:hover {
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
                <form action="forgotPasswordServ" method="post">
                    <input type="hidden" name="otp" value="<%=(int) otp%>">
                    <h1 class="heading">Verify your OTP</h1>
                    <p class="msg">Please enter the OTP received in your mail</p>

                    <input id="codeBox1" name="cb1" type="number" maxlength="1" onkeyup="onKeyUpEvent(1, event)"
                        onfocus="onFocusEvent(1)" />
                    <input id="codeBox2" name="cb2" type="number" maxlength="1" onkeyup="onKeyUpEvent(2, event)"
                        onfocus="onFocusEvent(2)" />
                    <input id="codeBox3" name="cb3" type="number" maxlength="1" onkeyup="onKeyUpEvent(3, event)"
                        onfocus="onFocusEvent(3)" />
                    <input id="codeBox4" name="cb4" type="number" maxlength="1" onkeyup="onKeyUpEvent(4, event)"
                        onfocus="onFocusEvent(4)" />
                     <input  class="btn_verify" type="submit" value="Verify">
                </form>
                
            </div>
        </div>
    </main>
</body>
<script>
    function getCodeBoxElement(index) {
        return document.getElementById('codeBox' + index);
    }
    function onKeyUpEvent(index, event) {
        const eventCode = event.which || event.keyCode;
        if (getCodeBoxElement(index).value.length === 1) {
            if (index !== 4) {
                getCodeBoxElement(index + 1).focus();
            } else {
                getCodeBoxElement(index).blur();
                // Submit code
                console.log('submit code ');
            }
        }
        if (eventCode === 8 && index !== 1) {
            getCodeBoxElement(index - 1).focus();
        }
    }
    function onFocusEvent(index) {
        for (item = 1; item < index; item++) {
            const currentElement = getCodeBoxElement(item);
            if (!currentElement.value) {
                currentElement.focus();
                break;
            }
        }
    }


</script>

</html>