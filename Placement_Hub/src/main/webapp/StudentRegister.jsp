<%-- 
    Document   : StudentRegister
    Created on : 07-Mar-2021, 1:13:05 pm
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">

    </head>
    <body>

        <form action="studentregister" method="post">
            <input type="text" placeholder="name" name="name">
            <input type="text" placeholder="password" name="password">
            <input type="text" placeholder="high_per" name="high_per">
            <input type="text" placeholder="inter_per" name="inter_per">
            <input type="text" placeholder="roll_no" name="roll_no">
            <input type="text" placeholder="email" name="email">
            <input type="text" placeholder="course" name="course">
            <input type="text" placeholder="depart" name="depart">
            <input type="text" placeholder="mobile" name="mobile">
            <input type="text" placeholder="passout_year" name="passout_year">
            <input type="text" placeholder="pg_per" name="pg_per">
            <input type="text" placeholder="ug_per" name="ug_per">
            <button type="submit" >ok</button>
        </form>

    </body>
</html>
