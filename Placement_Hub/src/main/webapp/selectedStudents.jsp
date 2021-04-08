


<%@page import="java.sql.ResultSet"%>
<%@page import="com.amrph.dao.AdminDao"%>
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

        .btns {
            display: flex;
            justify-content: flex-end;
            width: 95%;
        }

        .btn_send {
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 5px;
            height: 30px;
            width: 80px;
            font-size: large;
            font-weight: 500;
            margin-right: 20px;
        }

        .btn_send {
            position: relative;
            background-color: #3383b9;
            border: none;
            color: #FFFFFF;
            padding: 20px;
            -webkit-transition-duration: 0.9s;
            /* Safari */
            transition-duration: 0.9s;
            text-decoration: none;
            overflow: hidden;
            cursor: pointer;
        }

        .btn_send:after {
            content: "";
            background: #68def3;
            display: block;
            border: none;
            position: absolute;
            padding-top: 300%;
            padding-left: 350%;
            margin-left: -20px !important;
            margin-top: -120%;
            opacity: 0;
            transition: all 0.9s
        }

        .btn_send:active:after {
            padding: 0;
            border: none;
            margin: 0;
            opacity: 1;
            transition: 0s
        }

        .btn_send img {
            height: 20px;
            width: 25px;
            padding-left: 5px;
        }

        .btn_download{
            border: none;
        }

        .btn_download img {
            height: 40px;
            border-radius: 5px;
            width: 40px;
            padding: 0;
            margin: 0;
            cursor: pointer;

        }

        .card_table {
            display: flex;
            justify-content: center;
        }

        .styled-table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            font-family: sans-serif;
            width: 90%;
            min-width: 400px;
            box-shadow: 0 0 20px rgba(99, 159, 187, 0.658);
        }

        .styled-table thead tr {
            background-color: #476b6b;
            color: #ffffff;
            text-align: left;
        }

        .styled-table th,
        .styled-table td {
            padding: 12px 15px;
        }

        .head_check {
            display: flex;
            justify-content: center;
        }

        .styled-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        .styled-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .styled-table tbody tr:nth-of-type(odd) {
            background-color: #ffffff;
        }

        .styled-table tbody tr:last-of-type {
            border-bottom: 2px solid  #75a3a3;
        }

        .styled-table tbody tr:hover {
            cursor: pointer;
            font-weight: bold;
            color: #1fbbbb;
        }
    </style>
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

                <div class="w3-main" style="margin-left:300px;margin-top:43px;">
                    <%                        String department = request.getParameter("dept");
                        AdminDao admindao = new AdminDao(connection_provider.getconnection());
                        ResultSet rs = admindao.getPlacedStudentByDept(department);
                        String companies[] = admindao.getAllCompanyfromPlaced().split(",");
                        // out.print(companies.length);
                        for (String s : companies) {


                    %>
                    <h1 style="text-align:center;"><b><%=s%></b></h1>
                    `<form>
                        <div class="card_table">
                            <table class="styled-table" id="tables">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Passout year</th>
                                        <th>Department</th>


                                    </tr>
                                </thead>
                                <%                            while (rs.next()) {

                                        if (s.equals(rs.getString("company_name"))) {

                                %>
                                <tbody>
                                    <tr>
                                        <td><%=rs.getString("student_name")%></td>
                                        <td><%=rs.getString("passout_year")%></td>
                                        <td><%=rs.getString("dept")%></td>


                                    </tr>
                                    <%
                                            }
                                        }
                                    %>

                                </tbody>

                            </table>


                        </div>
                    </form>   
                    <%  // this will move the rs pointer to the first row of resultSet
                            rs.first();

                        }
                    %>
                </div>


                <!-- End Grid -->
            </div>

            <!-- End Page Container -->
        </div>
        <br>

        <!-- Footer -->
        <footer class="w3-container w3-theme-d3 w3-padding-16">
            <h5>Footer</h5>
        </footer>

        <footer class="w3-container w3-theme-d5">
            <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
        </footer>

        <script>
            // Accordion
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

            // Used to toggle the menu on smaller screens when clicking on the menu button
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

