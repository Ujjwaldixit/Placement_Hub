<%-- 
    Document   : register
    Created on : 1 Sep, 2020, 10:29:10 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        
        
       

    </head>
    <body>
        <!--navbar-->
        <nav>
            <%@include file="simple_navbar.jsp"%>
        </nav>
        <main clas="register">
            <div class="container"style="padding-top: 10vh">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">

                            <div class="card-header text-center"><h1><span class="fa fa-user-plus fa-1x"></span></br>Sign-Up</h1></div>
                            <div class="card-body text-center">





                                <form  name="reg_form" id="rform" method="post" action="register_serv">
                                    <div class="form-group">
                                        <label for="exampleInputName">User Name</label>
                                        <input  required name="user_name" type="text" class="form-control" id="exampleInputName"  placeholder="Enter Name">

                                    </div>


                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input required name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>



                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input required name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>





                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    
                                    
                                </form>




                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </main>



        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="js/javascript.js" type="text/javascript"></script>

  




    </body>
</html>
