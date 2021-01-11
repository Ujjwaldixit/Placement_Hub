<%-- 
    Document   : login
    Created on : 31 Aug, 2020, 8:43:31 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>

        <!--css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .login-ba
        </style>
        
    </head>
    <body>
        <!--navbar-->
        <nav>
            <%@include file="simple_navbar.jsp"%>
        </nav>
        
        <main clas="login-back">
            <div class="container"style="padding-top: 10vh">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">

                            <div class="card-header text-center"><h1><span class="fa fa-user-circle fa-2x"></span></br>Login</h1></div>
                            <div class="card-body text-center">
                                
                                <form action="login_serv" method="post">
                                    
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="login_email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input  name="login_password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
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
