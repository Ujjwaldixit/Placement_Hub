<%-- 
    Document   : mail
    Created on : 08-Mar-2021, 11:33:51 pm
    Author     : ASUS
--%>
<%@page import="com.amrph.helper.mailSender"%>
<%
    admin admin = (admin) session.getAttribute("currentuser");
%>

<%@page import="com.amrph.entities.admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <title>W3.CSS Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><style>
        html,body,h1,h2,h3,h4,h5 {font-family: "RobotoDraft", "Roboto", sans-serif}
        .w3-bar-block .w3-bar-item {padding: 16px}
    </style>
    <body onload="document.getElementById('id01').style.display = 'block'">





        <!-- Modal that pops up when you click on "New Message" -->
        <form action="mailServ" method="post" enctype="multipart/form-data">
            <div id="id01" class="w3-modal" style="z-index:4">
                <div class="w3-modal-content w3-animate-zoom">
                    <div class="w3-container w3-padding w3-red">
                        <span onclick="document.getElementById('id01').style.display = 'none'"
                              class="w3-button w3-red w3-right w3-xxlarge"><i class="fa fa-remove"></i></span>
                        <h2>Send Mail</h2>
                    </div>
                    <div class="w3-panel">

                        <label>From</label>
                        <input class="w3-input w3-border w3-margin-bottom" type="text" value="<%=admin.getEmail()%>"  name="adminEmailId">

                        <label>Password</label>
                        <input class="w3-input w3-border w3-margin-bottom" type="password" name="adminEmailPassword">

                        <label>Subject</label>
                        <input class="w3-input w3-border w3-margin-bottom" type="text" name="subject">
                        <textarea id="jobtext" rows="10" cols="40" class="w3-input w3-border w3-margin-bottom" style="height:150px" placeholder="Job Desc"  name="jobDesc"><%=request.getAttribute("jobDesc")%></textarea>
                        <input type="file" name="pdfFile">
                        <div class="w3-section">
                            <a class="w3-button w3-red" onclick="document.getElementById('id01').style.display = 'none'">Cancel  <i class="fa fa-remove"></i></a>
                            <button  class="w3-button w3-light-grey w3-right" type="submit">Send  <i class="fa fa-paper-plane"></i></button> 
                        </div> 
                        <!--to pass student emailId  values to servlet mailServ-->
                        <input type="hidden"  value="<%=request.getAttribute("emailId")%>" name="emailId">
                    </div>
                </div>
            </div>
        </form>
                    
        <script>
            var openInbox = document.getElementById("myBtn");
            openInbox.click();

            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("myOverlay").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("myOverlay").style.display = "none";
            }



            openMail("Borge")
            function openMail(personName) {
                var i;
                var x = document.getElementsByClassName("person");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                x = document.getElementsByClassName("test");
                for (i = 0; i < x.length; i++) {
                    x[i].className = x[i].className.replace(" w3-light-grey", "");
                }
                document.getElementById(personName).style.display = "block";
                event.currentTarget.className += " w3-light-grey";
            }
        </script>
      
        <script>
            var openTab = document.getElementById("firstTab");
            openTab.click();
        </script>

    </body>
</html> 
