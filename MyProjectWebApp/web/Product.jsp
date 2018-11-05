<%-- 
    Document   : ProductList
    Created on : Aug 8, 2018, 3:22:24 PM
    Author     : INT303
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <%@include file="include/Header.jsp" %>

    <body style="background-color: #ffffff; font-family: 'Rosario', sans-serif;">
        <p style="font-size: 50px;margin-top: 8%; margin-left: 7.5%"><kbd>${message}</kbd></p>
        <div class="container" style="margin-top: 2%; margin-bottom:5%;">
            <table id ="example" class="table" >
                <thead>
                <th class="success">Image</th>

                <th class="warning">Product Name </th>

                <th class="success">Price</th>
                </thead>
                <c:forEach items="${products}" var="p">
                    <tr>
                        <td><img src = "book/${p.productcode}.jpg" width="120"></td>
                        <td ><a href="GetProduct?productCode=${p.productcode}" style="font-size: 20px;">${p.productname}</a><br>
                            <p style="font-weight: bold">Categories: ${p.productline.productline}</p> 
                            <p>${p.productdescription}</p></td><td>
                            <img src = "pic/buy.png" width="30">${p.productprice} ฿
                            <br>
                            <br><a href="AddItemToCart?productCode=${p.productcode}" width ="120" >
                                <input type = button class="btn btn-success" value="Add to cart" width="120"/>
                            </a> </td></tr>
                        </c:forEach>          
            </table>

        </div>

        <div>
            <script>

                $(document).ready(function () {
                    $('#example').DataTable();
                });

                $('#example').dataTable({
                    "searching": false
                });

            </script>

        </div>

    </body>
</html>
