<%-- 
    Document   : placedStudents
    Created on : 01-Apr-2021, 12:13:31 am
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            <%                
                AdminDao admindao = new AdminDao(connection_provider.getconnection());
                ResultSet rs = admindao.getPlacedStudent();
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

