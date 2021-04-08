
<%@page import="com.amrph.entities.drives"%>
<%@page import="com.amrph.dao.drivesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.amrph.entities.webinar"%>
<%@page import="com.amrph.helper.connection_provider"%>
<%@page import="com.amrph.dao.getWebinarDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="AdminSidebar.jsp"%>

        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <header id="portfolio">
                <a href="#"><img src="images/team-2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
                <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
                <div class="w3-container" style="">
                    <h1 style="font-size: 40px;
                        text-align: center;
                        "><b>Placement Drives</b></h1>
                    <div class="w3-section w3-bottombar w3-padding-16">
                        <button class="w3-button w3-blue" onClick="document.location.href = 'addDrives.jsp'"><i class="fa fa-plus w3-margin-right"></i>ADD DRIVES</button>
                    </div>
                </div>
            </header>


            <!-- First Photo Grid-->
            <div class="w3-row-padding w3-padding">
                <%                    drivesDao drivesDao = new drivesDao(connection_provider.getconnection());
                    ArrayList<drives> drivesList = drivesDao.getDrives();
                    for (drives d : drivesList) {
                        String jobDesc = d.getJobDesc();
                        if (jobDesc.length() > 55) {
                            jobDesc = jobDesc.substring(0, 50);
                        }

                %>

                <div class="w3-third w3-container w3-padding">
                    <img src="logo/<%=d.getLogo()%>" alt="" style="width:100%;height:200px" class="w3-hover-opacity">
                    <div class="w3-container w3-white">
                        <p><b><%=d.getCompanyName()%></b></p>
                        <p class="w3-opacity">Date of Expiry:<br><%=d.getDateOfExp()%></p>
                        <p><%=jobDesc%></p>

                        <!--update drives-->
                       


                        <!--delete drives-->
                        <form action="deleteDrive" method="post">  
                            <input type="" name="job_no" value="<%=d.getCompanyName()%>" style="display: none">
                            <button class="w3-button w3-red w3-margin-bottom w3-left" type="submit"><i class="fa fa-remove w3-margin-right"></i>Delete</button>                    
                        </form>
                    </div>
                </div>
                <%
                    }
                %>


            </div>


            <script>
                // Script to open and close sidebar
                function w3_open() {
                    document.getElementById("mySidebar").style.display = "block";
                    document.getElementById("myOverlay").style.display = "block";
                }

                function w3_close() {
                    document.getElementById("mySidebar").style.display = "none";
                    document.getElementById("myOverlay").style.display = "none";
                }
            </script>
        </div>


    </body>
</html>
