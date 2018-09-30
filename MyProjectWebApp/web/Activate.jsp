<%-- 
    Document   : Activate
    Created on : Sep 30, 2018, 1:44:31 PM
    Author     : Nile
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Activate key<p>${username.activatekey}</p>
        <form action="Activate" method="post">
            username:<input type="text" name="username">
            ActivateKey:<input type="text" name="activateKey">
            <button type="submit">Submit</button>
        </form>
    </body>
</html>
