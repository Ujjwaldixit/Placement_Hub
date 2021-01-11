<%-- 
    Document   : profile
    Created on : 2 Sep, 2020, 5:13:16 PM
    Author     : ASUS
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="com.blog.dao.userdao"%>
<%@page import="java.io.File"%>
<%@page import="com.blog.entities.post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.category"%>
<%@page import="com.blog.helper.connection_provider"%>
<%@page import="com.blog.dao.getcategorydao"%>
<%@page import="com.blog.entities.entity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<%
    //this is done for to get get the user details  for <%=user.getName() 
    entity user = new entity();
    user = (entity) session.getAttribute("user");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>



        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-list-alt"> Tech_BLOG</span></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"> Bloging<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Category
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <!--calling same page for all categories-->
                            <a  class="dropdown-item" href="profile.jsp">All</a>
                            <%
                                getcategorydao getcat = new getcategorydao(connection_provider.getConnection());
                                ArrayList<category> List = getcat.getallcategory();
                                for (category c : List) {

                            %>
                            <!--calling same page for filtering category wise-->
                            <a  class="dropdown-item" href="profile.jsp?caty=<%=c.getCid()%>" value="<%=c.getCid()%>"><%=c.getCname()%></a>

                            <%
                                }
                            %>

                        </div>


                    </li>

                    <li class="nav-item">
                        <a class="nav-link primary-background" data-toggle="modal" data-target="#postmodal">Post</a>
                    </li>



                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="navbar-item fa-1x"><%--  below exmaple model and data model  for displaying profile  ..checkout out that commented button in modal--%>
                        <a class="nav-link" href="#exampleModal" data-toggle="modal"><span class="fa fa-expeditedssl"></span><%=user.getName()%></a>
                    </li>

                </ul>




                <ul class="navbar-nav mr-right">
                    <li class="navbar-item fa-1x">
                        <a class="nav-link" href="logout_serv"><span class="fa fa-expeditedssl "></span>LogOut</a>






                    </li>


                </ul>


            </div>
        </nav>

        <header class="text-center container">
            <span><h1><b>BLOG</b><i style="color:blue">Life</i></h1></span>
            <h4>Welcome to the World of <i style="color:blue">Blogging</i></h4>
        </header>




        <!-- Button trigger modal -->
        <!--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    Launch demo modal
                </button>-->

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">

                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>




                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="text-center">
                        <img class="text-center " src="images/<%=user.getProfile_pic()%>" style="width: 200px;height: 200px;border-radius: 50%; border: solid black 2px">
                        <h1><%=user.getProfile_pic()%></h1>
                    </div>

                    <div class="modal-body">


                        <div id="profile-details">
                            <table class="table">

                                <tbody>
                                <thead>
                                <td><span class="fa fa-user-circle-o fa-3x"></span><small>   Name:-</small></td>
                                <td> <h5 class="modal-title text-center" id="exampleModalLabel"><%=user.getName()%></h5></td>
                                </thead>
                                <tr>
                                    <td><span class="fa fa-at fa-3x"></span><small>   Email:-</small></td>
                                    <td> <h5 class="modal-title text-center" id="exampleModalLabel"><%=user.getEmail()%></h5></td>
                                </tr>

                                <tr>
                                    <td><span class="fa fa-clock-o fa-3x"></span><small>  Registered On:-</small></td>
                                    <td> <h5 class="modal-title text-center" id="exampleModalLabel"><%=user.getTime()%></h5></td>
                                </tr>

                                </tbody>
                            </table>
                        </div>


                        <!--form edit--> 
                        <div id="profile-edit" style="display: none;">



                            <!--edit profile-->


                            <form action="editprofile_serv" method="post" enctype="multipart/form-data">
                                <table class="table">

                                    <tbody>
                                    <thead>
                                    <td><span class="fa fa-user-circle-o fa-3x"></span><small>   Name:-</small></td>
                                    <td><input type="text" name="name" value="<%=user.getName()%>"></td>
                                    </thead>
                                    <tr>
                                        <td><span class="fa fa-at fa-3x"></span><small>   Email:-</small></td>
                                        <td><input type="email" name="email" value="<%=user.getEmail()%>"></td>
                                    </tr>

                                    <tr>
                                        <td><span class="fa fa-lock fa-3x"></span><small>Password:-</small></td>
                                        <td><input type="password" name="password" value="<%=user.getPassword()%>"></td>

                                    </tr>

                                    <tr>
                                        <td><span class="fa fa-image fa-2x"></span><small> Profile Image:-</small></td>
                                        <td><input type="file" name="image" value="<%=user.getProfile_pic()%>" ></td>

                                    </tr>

                                    </tbody>
                                </table>

                                <div class="text-center">
                                    <button   type="submit" class=" btn btn-primary" style="background-color:lightsteelblue ;"><span class="fa fa-save"></span>  Save</button>
                                </div>

                            </form>
                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-button" type="button" class="btn btn-primary"><span class="fa fa-pencil"></span> Edit</button>
                    </div>
                </div>
            </div>
        </div>             




        <!--post model start-->

        <!-- Button trigger modal -->
        <!--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postmodal">
                    Launch demo modal
                </button>-->

        <!-- Modal -->
        <div class="modal fade" id="postmodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-center">
                        <h5 class="modal-title text-white" id="exampleModalLabel">Post Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">



                        <form action="addpost_serv" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <input  class="form-control" required name="ptitle" type="text" placeholder="Enter Title">

                            </div>
                            <div class="form-group">
                                <textarea required="" name="pcontent" class="form-control" style="height: 200px"></textarea>
                            </div>
                            <div class="form-group"  >
                                <label>Category</label>
                                <select  name="cid"  onclick="" style="background-color: lightgray; " required>
                                    <option selected disabled >Select Category</option>
                                    <%
                                        getcategorydao getcategory = new getcategorydao(connection_provider.getConnection());
                                        ArrayList<category> list = getcategory.getallcategory();
                                        for (category c : list) {

                                    %>

                                    <option  class="text-white" style="background-color: graytext"  value="<%=c.getCid()%>"><%=c.getCname()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>


                            <div clas="form-group">
                                <label>Add Photos (if any)</label>
                                <input type="file" name="ppic">
                            </div>
                            <div class="text-center">
                                <br>
                                <br>
                                <button type="submit" formaction="addpost_serv" class="btn btn-outline-primary">POST</button>
                            </div> 
                        </form>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>


        <main>
            <div class="row">
                <div class="col-md-8">
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
                    <div class="card m-4 p-4" id="cardpost" style=" box-shadow: 0 4px 8px 0 rgba(0,0,0,0.7);">
                        <div class="row no-gutters">
                            <div class="col-md-4 ">
                                <div class="col-m-0 p-2">
                                    <% userdao udao = new userdao(connection_provider.getConnection());
                                        entity entusr = udao.getUserByUserId(p.getUserid());

                                    %>
                                    <img src="images/<%=entusr.getProfile_pic()%>" style="max-width:40px;max-height:40px;border-radius:100%;border: 2px solid black;">
                                </div>

                                    <img  src="blog_images/<%=p.getPpic()%>" class="card-img" alt="..." style="border-radius: 4%">
                            </div>
                            <div class="col-md-8">


                                <div class="card-body">
                                    <h2 class="card-title"><%=p.getPtitle().toUpperCase()%></h2>

                                    <i class="card-text"><%=p.getPcontent()%></i>


                                </div>


                            </div>

                        </div>
                        <h7 class="text-center">Author: <%=entusr.getName()%></h7>           
                        <small class="text-muted  text-right">Posted on <%=DateFormat.getDateTimeInstance().format(p.getPdate())%></small> 



                    </div>
                    <%
                        }
                    %>







                </div>






                <!--side bar-->
                <div class="col-md-3">

                    <div class="card text-white primary-background text-center" style="width: 18rem;margin: 20px;padding: 10px;box-shadow: 0 4px 8px 0 blue;">
                        <h5 class="card-title">Card title</h5>
                        <img class="card-img-top" src="images/s.png" alt="Card image cap">
                        <div class="card-body">

                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>


                    <div class="card primary-background" style="width: 18rem;margin: 20px;box-shadow: 0 4px 8px 0 blue;">
                        <h2 class="card-title primary-background  text-center"><pre class="text-white">Follow Me</pre></h2>
                        <div class="card-body">

                            <div class="container">

                                <a href="#" class="fa fa-facebook-official w3-hover-opacity"></a>
                                <a href="#" class="fa fa-instagram w3-hover-opacity"></a>
                                <a href="#" class="fa fa-snapchat w3-hover-opacity"></a>
                                <a href="#" class="fa fa-pinterest-p w3-hover-opacity"></a>
                                <a href="#" class="fa fa-twitter w3-hover-opacity"></a>
                                <a  href="#"class="fa fa-linkedin w3-hover-opacity"></a>

                            </div>

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
        </main>




                    







        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="js/javascript.js" type="text/javascript"></script>
        <script>
//            scrpit for toogle in edit button
            $(document).ready(function ()
            {
                var editstatus = false;
                $('#edit-button').click(function () {
                    if (editstatus === false)
                    {
                        $('#profile-details').hide()
                        $('#profile-edit').show()
                        $('#edit-button').text("Back");
                        editstatus = true;
                    } else
                    {
                        $('#profile-details').show()
                        $('#profile-edit').hide()

                        $('#edit-button').text("Edit");
                        editstatus = false;
                    }
                })
            });
        </script>


    </body>
</html>
