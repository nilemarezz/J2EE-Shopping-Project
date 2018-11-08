<%-- 
    Document   : ShowCart
    Created on : Nov 8, 2018, 3:49:20 PM
    Author     : Nile
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="include/Header.jsp" %>
        <body style="background-color: #ffffff; font-family: 'Rosario', sans-serif;">
        <p style="font-size: 50px;margin-top: 8%; margin-left: 7.5%"><kbd>${message}</kbd></p>
        <div class="container" style="margin-top: 2%; margin-bottom:5%;">
            <table border="1">
                <tr>
                    <td>#</td>
                    <td>Image</td>
                    <td>Name</td>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Total Price</td>
                    
                </tr>
                <c:forEach items="${cart.lineItems}" var="line" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td><img src = "book/${line.product.productcode}.jpg" width="120"></td>
                        <td>${line.product.productname}</td>
                        <td>${line.product.productprice}</td>
                        <td>${line.quantity}</td>
                        <td>${line.totalPrice}</td>
                    </tr>
                </c:forEach>
            </table>

        </div>

       

    </body>
    </body>
</html>
