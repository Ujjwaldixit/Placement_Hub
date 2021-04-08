<%-- 
    Document   : updateShortlistedStudents
    Created on : 16-Mar-2021, 3:51:51 pm
    Author     : ASUS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.amrph.entities.shortlistedStudent"%>
<%@page import="com.amrph.entities.student"%>
<%@page import="com.amrph.dao.StudentDao"%>
<%@page import="com.amrph.helper.connection_provider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.amrph.dao.AdminDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 30px;
        }

        .switch input { 
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .5s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 17px;
            width: 17px;
            left: 4px;
            bottom: 7px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color:	#00FF7F;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }
    </style>
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
            background-color: #16809b;
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
            border-bottom: 2px solid #1f98bd;
        }

        .styled-table tbody tr:hover {
            cursor: pointer;
            font-weight: bold;
            color: #1fbbbb;
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
        <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer"
             title="close side menu" id="myOverlay"></div>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">
            <%                AdminDao admindao = new AdminDao(connection_provider.getconnection());
                ResultSet rs = admindao.getShortListedStudent();
                String companies[] = admindao.getAllCompany().split(",");
                // out.print(companies.length);
                for (String s : companies) {
            %>
            `<form action="updateShortListedServ" method="post">
                <h1 style="text-align:center;"><b><%=s%></b></h1>
                <div class="btns">
                    <div style="padding-right:20px;" title="Update Final List"> 
                        <label class="switch">
                            <input type="checkbox" name="SelectedStudents" value="1">
                            <span class="slider round"></span>
                        </label>
                    </div>
                    <button class="btn_send" type="submit" name="companyName" value="<%=s%>">Send<img src="images/send.png"></button>
                  
                </div>
                <!--toggle button-->
                
                <div class="card_table">

                    <table class="styled-table" id="tables">
                        <thead>

                            <tr>

                                <th class="head_check">
                                </th>
                                <th>Name</th>
                                <th>Course</th>
                                <th>Department</th>
                                <th>E-mail</th>

                            </tr>
                        </thead>
                        <%
                            while (rs.next()) {
                                if (s.equals(rs.getString("company_name"))) {

                        %>
                        <tbody>
                            <tr>
                                <th><INPUT type="checkbox" name="check" value="<%=rs.getString("email")%>"></th>
                                <td><%=rs.getString("name")%></td>
                                <td><%=rs.getString("course")%></td>
                                <td><%=rs.getString("department")%></td>
                                <td><%=rs.getString("email")%></td>
                        
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
        <script>
            function checkAll(ele) {
                var checkboxes = document.getElementsByTagName('input');
                if (ele.checked) {
                    for (var i = 0; i < checkboxes.length; i++) {
                        if (checkboxes[i].type == 'checkbox') {
                            checkboxes[i].checked = true;
                        }
                    }
                } else {
                    for (var i = 0; i < checkboxes.length; i++) {
                        console.log(i)
                        if (checkboxes[i].type == 'checkbox') {
                            checkboxes[i].checked = false;
                        }
                    }
                }
            }
        </script>

    </body>

</html>
