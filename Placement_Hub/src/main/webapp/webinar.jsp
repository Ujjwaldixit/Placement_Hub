<%-- 
    Document   : webinar
    Created on : 12-Mar-2021, 8:22:32 pm
    Author     : ASUS
--%>

<%@page import="java.time.Month"%>
<%@page import="com.amrph.helper.connection_provider"%>
<%@page import="com.amrph.dao.getWebinarDao"%>
<%@page import="com.amrph.entities.webinar"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .event-container {
                font-family: "Roboto", sans-serif;
                max-width: 800px;
                margin: 0 auto;
            }

            .event-container h3.year {
                font-size: 40px;
                text-align: center;
                border-bottom: 1px solid #b1b1b1;
            }

            .event-container .event {
                box-shadow: 0 4px 16px -8px rgba(0, 0, 0, 0.4);
                display: flex;
                border-radius: 8px;
                margin: 32px 0;
            }

            .event .event-left {
                background: #222;
                min-width: 82px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #eee;
                padding: 8px 48px;
                font-weight: bold;
                text-align: center;
                border-radius: 8px 0 0 8px;
            }

            .event .event-left .date {
                font-size: 56px;
            }

            .event .event-left .month {
                font-size: 16px;
                font-weight: normal;
            }

            .event .event-right {
                display: flex;
                flex-direction: column;
                justify-content: center;
                padding: 0 24px;
            }

            .event .event-right h3.event-title {
                font-size: 24px;
                margin: 24px 0 10px 0;
                color: #218bbb;
                text-transform: uppercase;
            }

            .event .event-right .event-timing {
                background: #fff8ba;
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100px;
                padding: 8px;
                border-radius: 16px;
                margin: 24px 0;
                font-size: 14px;
            }

            .event .event-right .event-timing img {
                height: 20px;
                padding-right: 8px;
            }

            @media (max-width: 550px) {
                .event {
                    flex-direction: column;
                }

                .event .event-left {
                    padding: 0;
                    border-radius: 8px 8px 0 0;
                }

                .event .event-left .event-date .date,
                .event .event-left .event-date .month {
                    display: inline-block;
                    font-size: 24px;
                }

                .event .event-left .event-date {
                    padding: 10px 0;
                }
            }
        </style>
    </head>

    <body>

        <%@include file="AdminSidebar.jsp" %>
        <div class="w3-main" style="margin-left:300px;margin-top:43px;">

            <%                getWebinarDao getWebinarDao = new getWebinarDao(connection_provider.getconnection());
                ArrayList<webinar> web = getWebinarDao.getWebinar();

            %>
            <div class="event-container">
                <div class="w3-container" style="padding:0px">
                    <h1 style="font-size: 40px;
                        text-align: center;
                        "><b>Webinars</b></h1>
                    <div class="w3-section w3-bottombar w3-padding-16">
                        <button class="w3-button w3-blue" onClick="document.location.href = 'addWebinar.jsp'"><i class="fa fa-google w3-margin-right"></i></button>
                    </div>
                </div>

                <%  for (webinar webinar : web) {
                        String Date = webinar.getDate();
                        String date = Date.substring(8, 10);
                        int mon = Integer.parseInt(Date.substring(5, 7));
                        Month month = Month.of(mon);

                %>
                <a href="<%=webinar.getLink()%>" style="text-decoration:none">
                    <div class="event">
                        <div class="event-left">
                            <div class="event-date">
                                <div class="date"><%=date%></div>
                                <div class="month"><%=month%></div>
                            </div>
                        </div>

                        <div class="event-right">
                            <h3 class="event-title"><%=webinar.getAgenda()%></h3>

                            <div class="event-description">
                                <%=webinar.getDescription()%>
                            </div>

                            <div class="event-timing">
                                <img src="images/time.png" alt="" /><%=webinar.getTime()%>
                            </div>
                            <form action="deleteWebinar" method="post">  
                                <input type="text" name="webinar_no" value="<%=webinar.getSno()%>"  style="display: none">
                                <button class="w3-button w3-red w3-margin-bottom w3-left" type="submit"><i class="fa fa-remove w3-margin-right"></i>Delete</button>                    
                            </form>
                        </div>

                    </div></a>
                    <%
                        }
                    %>




            </div>
        </div>
    </body>
</html>
