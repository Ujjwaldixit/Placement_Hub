<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
        html,
        body,
        h1,
        h2,
        h3,
        h4,
        h5 {
            font-family: "Raleway", sans-serif
        }

        @import url("https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Montserrat", sans-serif;
        }

        body {
            background: rgb(174, 201, 209);
        }

        .wrapper {
            width: 750px;
            margin-left: 70px;
            margin-top: 10px;
            border: 1px solid white;
            box-shadow: 0px 15px 16.83px 0.17px rgb(0 0 0 / 5%);
            border-radius: 20px;
            padding-left: 30px;
            padding-right: 30px;
            background: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .wrapper .title {
            font-size: 24px;
            color: rgb(19, 18, 18);
            font-weight: 700;
            text-align: center;
            margin-bottom: 50px;
            margin-top: 50px;
        }

        .criteria_title {
            font-size: 18px;
            font-weight: 600;
            padding-left: 10px;
            padding-top: 30px;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
        }

        .container .option_item {
            display: block;
            position: relative;
            width: 125px;
            height: 125px;
            margin: 10px;
        }

        .container .option_item .checkbox {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
            opacity: 0;
        }

        .option_item .option_inner {
            width: 100%;
            height: 100%;
            background: #fff;
            box-shadow: 0px 15px 16.83px 0.17px rgb(0 0 0 / 5%);
            border-radius: 5px;
            text-align: center;
            padding: 58px 40px;
            cursor: pointer;
            color: #585c68;
            display: block;
            border: 5px solid transparent;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .option_item .option_inner .name {
            user-select: none;
        }

        .option_item .checkbox:checked~.option_inner.cse {
            border-color: #3b5999;
            color: #3b5999;
        }

        .option_item .checkbox:checked~.option_inner.me {
            border-color: #55acee;
            color: #55acee;
        }

        .option_item .checkbox:checked~.option_inner.ece {
            border-color: #e4405f;
            color: #e4405f;
        }

        .option_item .checkbox:checked~.option_inner.eee {
            border-color: #0077b5;
            color: #0077b5;
        }

        .option_item .option_inner .tickmark {
            position: absolute;
            top: -1px;
            left: -1px;
            border: 20px solid;
            border-color: #000 transparent transparent #000;
            display: none;
        }

        .option_item .option_inner .tickmark:before {
            content: "";
            position: absolute;
            top: -18px;
            left: -18px;
            width: 15px;
            height: 5px;
            border: 3px solid;
            border-color: transparent transparent #fff #fff;
            transform: rotate(-45deg);
        }

        .option_item .checkbox:checked~.option_inner .tickmark {
            display: block;
        }

        .option_item .option_inner.cse .tickmark {
            border-color: #3b5999 transparent transparent #3b5999;
        }

        .option_item .option_inner.me .tickmark {
            border-color: #55acee transparent transparent #55acee;
        }

        .option_item .option_inner.ece .tickmark {
            border-color: #e4405f transparent transparent #e4405f;
        }

        .option_item .option_inner.eee .tickmark {
            border-color: #0077b5 transparent transparent #0077b5;
        }

        .company_details {
            display: flex;
            height: 120px;
        }

        .company_box,
        .date_box {
            flex: 1;
        }

        .date_box {
            margin-left: 30px;
        }

        .co_name {
            width: 100%;
            outline: none;
            border: none;
            border-bottom: 2px solid grey;
        }

        .co_name:focus {
            border-bottom: 2px solid seagreen;
        }

        textarea {
            width: 100%;
            outline: none;
            border: none;
            border-bottom: 2px solid grey;
        }

        textarea:focus {
            border: 2px solid seagreen;
        }

        .btn {
            margin-top: 90px;
            margin-bottom: 50px;
            display: flex;
            justify-content: flex-start;
        }

        .sub_btn {
            padding: 10px;
            height: 40px;
            width: 100px;
            color: white;
            background: rgb(38, 38, 160);
            border-radius: 5px;
            border: white;
            cursor: pointer;
        }

        .sub_btn:hover {
            background: #55acee;
            box-shadow: 0px 4px 17px 0.17px #94c3e6fc;
        }

        @media screen and (max-width: 850px) {
            .wrapper {
                width: auto;
                margin: 0px 20px 0 20px;
            }

            .company_details {
                display: flex;
                flex-direction: column;
            }

            .date_box {
                margin-left: 0px;
                margin-bottom: 30px;
            }
            .job{
                margin-top:50px
            }

        }
    </style>

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
            <div class="wrapper">
                <form action="addDrivesServ" method="post" enctype="multipart/form-data">
                    <div class="title">
                        Eligibility Criteria Form
                    </div>

                    <div class="criteria_title">B.Tech</div>

                    <div class="container">
                        <label class="option_item">
                            <input type="checkbox" class="checkbox" name="id" value="CSE">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">C.S.E</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="checkbox" class="checkbox" name="id" value="ME">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">M.E</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="checkbox" class="checkbox" name="id" value="ECE">
                            <div class="option_inner ece">
                                <div class="tickmark"></div>
                                <div class="name">E.C.E</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="checkbox" class="checkbox" name="id" value="EEE">
                            <div class="option_inner eee">
                                <div class="tickmark"></div>
                                <div class="name">E.E.E</div>
                            </div>
                        </label>
                    </div>
                    <div class="criteria_title">BCA and MCA</div>
                    <div class="container">
                        <label class="option_item">
                            <input type="checkbox" class="checkbox" name="id" value="BCA">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">BCA</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="checkbox" class="checkbox" name="id" value="MCA">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">MCA</div>
                            </div>
                        </label>
                    </div>
                    <div class="criteria_title">Hotel Management</div>
                    <div class="container">
                        <label class="option_item">
                            <input type="checkbox" class="checkbox" name="id" value="CSE">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">C.S.E</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="checkbox" class="checkbox" name="id" value="CSE">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">M.E</div>
                            </div>
                        </label>
                    </div>
                    <div class="criteria_title">UG Marks Required</div>
                    <div class="container">

                        <input type="radio" class="checkbox" name="ugid" value="0" checked style="visibility: hidden">


                        <label class="option_item">
                            <input type="radio" class="checkbox" name="ugid" value="60">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">60</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="ugid" value="65">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">65</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="ugid" value="70">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">70</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="ugid" value="75">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">75</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="ugid" value="80">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">80</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="ugid" value="85">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">85</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="ugid" value="90">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">90</div>
                            </div>
                        </label>
                    </div>
                    <div class="criteria_title">PG Marks Required</div>
                    <div class="container">

                        <input type="radio" class="checkbox" name="pgid" value="0" checked style="visibility: hidden">


                        <label class="option_item">
                            <input type="radio" class="checkbox" name="pgid" value="60">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">60</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="pgid" value="65">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">65</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="pgid" value="70">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">70</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="pgid" value="75">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">75</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="pgid" value="80">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">80</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="pgid" value="85">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">85</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="pgid" value="90">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">90</div>
                            </div>
                        </label>
                    </div>
                    <div class="criteria_title">10<sup>th</sup> Marks Required</div>


                    <div class="container">

                        <input type="radio" class="checkbox" name="hid" value="0" checked style="visibility: hidden">                           


                        <label class="option_item">
                            <input type="radio" class="checkbox" name="hid" value="60">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">60</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="hid" value="65">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">65</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="hid" value="70">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">70</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="hid" value="75">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">75</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="hid" value="80">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">80</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="hid" value="85">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">85</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="hid" value="90">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">90</div>
                            </div>
                        </label>
                    </div>
                    <div class="criteria_title">12<sup>th</sup> Required</div>
                    <div class="container">

                        <input type="radio" class="checkbox" name="iid" value="0" checked style="visibility: hidden">                       


                        <label class="option_item">
                            <input type="radio" class="checkbox" name="iid" value="60">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">60</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="iid" value="65">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">65</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="iid" value="70">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">70</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="iid" value="75">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">75</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="iid" value="80">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">80</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="iid" value="85">
                            <div class="option_inner me">
                                <div class="tickmark"></div>
                                <div class="name">85</div>
                            </div>
                        </label>
                        <label class="option_item">
                            <input type="radio" class="checkbox" name="iid" value="90">
                            <div class="option_inner cse">
                                <div class="tickmark"></div>
                                <div class="name">90</div>
                            </div>
                        </label>
                    </div>
                    <div class="company_details">
                        <div class="company_box">
                            <div class="criteria_title">Company Name</div>
                            <div class="container">
                                <input type="text" class="co_name" name="companyName">
                            </div>
                        </div>
                        <div class="date_box">
                            <div class="criteria_title">Date of Expiry</div>
                            <div class="container">
                                <input type="date" name="dateOfExpiry">
                            </div>
                        </div>
                    </div>

                    <br>
                    <br>
                    <br>
                    <br>
                    <label>Company logo</label>
                    <input type="file" name="logo">
                    <br>
                    <br>
                    <br>
                    <br>
                    <label>Company image</label>
                    <input type="file" name="comp_image">
                    <br>
                    <br>
                    <br>
                    <div class="job">
                        <div class="criteria_title">Job Description</div>
                        <div class="container">
                            <textarea id="jobtext" rows="10" cols="10" name="jobDesc" style="border:2px solid gray"></textarea>
                        </div>
                    </div>
                    <div class="btn">
                        <div class="container">
                            <button onclick="myFunction()" class="sub_btn w3-blue" value="submit">Send</button>
                        </div>
                    </div>

                </form>

            </div>
        </div>

        <script>
            function myFunction() {
                var str = document.getElementById("jobtext").innerHTML;
                var res = str.replace(/\n/g, "<br/>");
                ;
                document.getElementById("jobtext").innerHTML = res;
            }
        </script>
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