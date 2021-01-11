<%-- 
    Document   : index
    Created on : 31 Aug, 2020, 7:27:07 PM
    Author     : ASUS
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.post"%>
<%@page import="com.blog.dao.getcategorydao"%>
<%@page import="com.blog.helper.connection_provider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--        css-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                background: #fff;
                font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
                font-size: 14px;
                color: #000;
                margin: 0;
                padding: 0;
            }

            .swiper-container {
                width: 100%;
                padding-top: 50px;
                padding-bottom: 50px;
            }

            .swiper-slide {
                background-position: center;
                background-size: cover;
                width: 300px;
                height: 500px;

            }
        </style>
    </head>
    <body>
        <!--navbar-->
        <%@include file="simple_navbar.jsp" %>

        <!--welcome text-->
        <div class="jumbotron">   <!-- jumbotron feature of bootstrap ----A lightweight, flexible component that can optionally extend the entire viewport to showcase key marketing messages on your site.-->
            <h1>Welcome Techies</h1>
            <h3>Tech blog</h3>
            <p>loem dadadadddb sadndkasnd as dad dasda dada dadad</p>
            <a href="login.jsp"class="btn btn-outline-success btn-lg"><span class="fa fa-id-badge"></span>  Sign-In</a>
        </div>


        <!--cards-->
        <section id="recent-post">
            <h1><pre>    Latest Posts</pre></h1>
            <div class="swiper-container">

                <div class="swiper-wrapper">
                    <%
                        getcategorydao getpost = new getcategorydao(connection_provider.getConnection());

                        ArrayList<post> allposts = getpost.getallposts();
                        int i = 0;
                        for (post p : allposts) {
                            if (i >= 4) {
                                break;
                            }
                            String title = p.getPtitle();
                            String content="";
                            if(p.getPcontent().length()>100)
                            {
                            content = p.getPcontent().substring(0,100);
                            }
                            else
                            content=p.getPcontent();
                    %>
                    <div class="swiper-slide"> 



                        <div class="" style="width: 18rem;">
                            <img src="blog_images/<%=p.getPpic()%>" class="card-img-top" alt="..." style="max-width:auto;height:300px">
                            <div class="card-body">
                                <h5 class="card-title"><%=title%></h5>
                                <p><%=content%>...</p>
                                <a href="login.jsp" class="btn btn-primary">Read More</a>
                            </div>
                        </div>


                    </div>








                    <%
                            i++;
                        }
                    %> 

                </div>

                <!-- Add Pagination -->
                <div class="swiper-pagination"></div>


            </div>


        </section>

        <section>
            <div class="row-mb-3 jumbotron  m-0" style="max-width:auto;">
                <div class="row no-gutters">
                    <div class="col-md-4">
                        <img src="images/world.png" class="text-center" alt="..." style="max-width:auto;max-height: 400px;">


                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title"></h5>
                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                            <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>

            </div>

        </section>
        <footer class=" container text-center text-white"style="background-color:black ">
            
        </footer> 











        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="js/javascript.js" type="text/javascript"></script>

        <!--for sliding effect used from swiper.js-->
        <script>
            var swiper = new Swiper('.swiper-container', {
                effect: 'coverflow',
                grabCursor: true,
                centeredSlides: true,
                slidesPerView: 'auto',
                coverflowEffect: {
                    rotate: 50,
                    stretch: 0,
                    depth: 50,
                    modifier: 1,
                    slideShadows: true,
                },
                autoplay: {
                    delay: 1000,
                    disableOnInteraction: true,
                },
                loop: true,
                pagination: {
                    el: '.swiper-pagination',
                },
            });
        </script>

    </body>
</html>
