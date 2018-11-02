<%-- 
    Document   : Header
    Created on : Aug 10, 2018, 3:12:06 PM
    Author     : INT303
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src = "https://code.jquery.com/jquery-3.3.1.js"></script>
<script src = "https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src = "https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<link href="https://fonts.googleapis.com/css?family=Rosario" rel="stylesheet"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">




<nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
    <a href="Main.jsp" title="Back to Home"><img src="pic/logo.png" width="50"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active" style="margin-left: 10px">
                <a class="nav-link" href="Main.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Product?name=all">All Books</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="Product?name=Science and Technology">Science and Technology</a>
                    <a class="dropdown-item" href="Product?name=all">Food</a>
                    <a class="dropdown-item" href="Product?name=all">Kids</a>
                    <a class="dropdown-item" href="Product?name=Education">Education</a>
                    <a class="dropdown-item" href="Product?name=all">Travel</a>
                    <a class="dropdown-item" href="Product?name=all">All</a>

                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Contract.jsp">Contact us</a>
            </li>
        </ul>

    </div>
    <div class="login">
        <c:choose>
            <c:when test ="${sessionScope.username != null}">
                <div class="dropdown" >
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Hello:&nbsp;${username.username}
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="Profile.jsp">Profile</a>
                        <a class="dropdown-item" href="History.jsp">History</a>
                        <a class="dropdown-item" href="Logout">Logout</a>

                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <a href="Login" class="btn btn-outline-success my-2 my-sm-0" >Login</a>
            </c:otherwise>
        </c:choose>
    </div>
    <table>
        <tr>
            <td><a href="Main.jsp" title="Pay" style="margin-left: 20px" ><img src="pic/basket.png" width="40"/></a></td>
            <td style="padding-bottom: 10px" height="5"><h1><font size="4">${cart.totalQuantity}</font></h1></td>
        </tr>
    </table>

</nav>
<style>
    nav{font-family: 'Slabo 27px', serif;}
</style>
<style>
    body {
        opacity: 1;
        transition: 1s opacity;
    }
    body.fade-out {
        opacity: 0;
        transition: none;
    }

</style>
<script>document.body.className += ' fade-out';
    $(function () {
        $('body').removeClass('fade-out');
    });
</script>
