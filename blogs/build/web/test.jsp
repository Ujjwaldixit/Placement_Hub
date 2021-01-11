<%-- 
    Document   : test
    Created on : 1 Sep, 2020, 5:08:41 PM
    Author     : ASUS
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="com.blog.entities.entity"%>
<%@page import="com.blog.dao.userdao"%>
<%@page import="com.blog.entities.post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.category"%>
<%@page import="com.blog.entities.category"%>
<%@page import="com.blog.dao.getcategorydao"%>
<%@page import="com.blog.helper.connection_provider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>

<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <header class="text-center container ">
            <span><h1><b>BLOG</b><i style="color:blue">Life</i></h1></span>
            <h4>Welcome to the World of <i style="color:blue">Blogging</i></h4>
        </header>

        <div class="">
            <div class="row">
                <div class="col-md-8 p-4 m-4" id="cardpost" style=" box-shadow: 0 4px 8px 0 rgba(0,0,0,0.7);">
                    <%
                        getcategorydao getpost = new getcategorydao(connection_provider.getConnection());

                        ArrayList<post> allposts = getpost.getallposts();
                        String caty = request.getParameter("caty");
                        int cat = 0;
                        if (caty != null) {

                            cat = Integer.parseInt(caty);
                            allposts = getpost.getpostbycatid(cat);
                        }

                        for (post p : allposts) {
                    %>
                    <!--<div class=" col-md-8 card m-4 p-4" id="cardpost" style=" box-shadow: 0 4px 8px 0 rgba(0,0,0,0.7);">-->
                        <div class="row no-gutters">
                            <div class="col-md-4 ">
                                <div class="col-m-0 p-2">
                                    <% userdao udao = new userdao(connection_provider.getConnection());
                                        entity entusr = udao.getUserByUserId(p.getUserid());

                                    %>
                                    <img src="images/<%=entusr.getProfile_pic()%>" style="max-width:30px;border-radius:100%;">
                                </div>

                                <img  src="blog_images/<%=p.getPpic()%>" class="card-img" alt="...">
                            </div>
                            <div class="col-md-8">


                                <div class="card-body">
                                    <h2 class="card-title"><%=p.getPtitle()%></h2>

                                    <p class="card-text"><%=p.getPcontent()%></p>


                                </div>


                            </div>

                        </div>
                        <h7 class="text-center">Author: <%=entusr.getName()%></h7>           
                        <small class="text-muted  text-right">Posted on <%=DateFormat.getDateTimeInstance().format(p.getPdate())%></small> 



                    <!--</div>-->
                    <%
                        }
                    %>





                </div>


                <!--side bar-->
                <div class="col-md-3">
                    
                    <div class="card text-white primary-background text-center" style="width: 18rem;margin: 20px;padding: 10px">
                          <h5 class="card-title">Card title</h5>
                        <img class="card-img-top" src="images/s.png" alt="Card image cap">
                        <div class="card-body">
                          
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>


                    <div class="card" style="width: 18rem;margin: 20px">
                        <img class="card-img-top" src="..." alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>

                    <div class="card" style="width: 18rem;margin: 20px">
                        <img class="card-img-top" src="..." alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>




              

                </div>
            </div>

        </div>


        <script>

        </script>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="js/javascript.js" type="text/javascript"></script>
    </body>
</html>
</body>
</html>
