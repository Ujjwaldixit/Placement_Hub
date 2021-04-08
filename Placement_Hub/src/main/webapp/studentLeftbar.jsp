<%-- 
    Document   : studentLeftbar.jsp
    Created on : 11-Mar-2021, 1:25:52 pm
    Author     : ASUS
--%>

<%@page import="com.amrph.entities.student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    student student = (student) session.getAttribute("currentStudent");
    if (student == null) {
        response.sendRedirect("studentLogin.jsp");
    }
%>


<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <title>W3.CSS Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
    </style>
    <body class="w3-theme-l5">
        
       

        <!-- Page Container -->

        <!-- The Grid -->

        <!-- Left Column -->
        <div class="w3-col m3">
            <!-- Profile -->
            <div class="w3-card w3-round w3-white">
                <div class="w3-container">
                    <h4 class="w3-center">My Profile</h4>
                    <p class="w3-center"><img src="images/<%=student.getProfile_pic()%>" class="w3-circle" style="height:106px;width:106px;border :1px solid lightslategray" alt="Avatar"></p>
                    <hr>
                    <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i><%=student.getName()%></p>
                    <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i><%=student.getCourse()%> <%=student.getDept()%></p>
                    <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i><%=student.getEmail()%></p>
                </div>
            </div>
            <br>

            <!-- Accordion -->
            <div class="w3-card w3-round">
                <div class="w3-white">
                    <button onclick="document.location.href = 'studentDashboard.jsp'" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-dashboard fa-fw w3-margin-right"></i>Dashboard</button>
                    <div id="Demo1" class="w3-hide w3-container">
                        <p>Some text..</p>
                    </div>
                    <button onclick="document.location.href = 'studentWebinar.jsp'" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i>Webinar</button>
                    <div id="Demo2" class="w3-hide w3-container">
                        <p>Some other text..</p>
                    </div>
                    <form action="selectedStudents.jsp">
                    <input name ="dept" type="hidden" value="<%=student.getDept()%>">
                    <button  type="submit"  class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-user fa-fw w3-margin-right"></i>Selected Students</button>
                    <div id="Demo2" class="w3-hide w3-container">
                        <p>Some other text..</p>
                    </div>
                    </form>

                </div>      
            </div>
            <br>

           

            <!-- End Left Column -->
        </div>


        <!-- End Grid -->


        <!-- End Page Container -->

        <br>


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


