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
        <p style="font-size: 50px;margin-top: 8%; margin-left: 7.5%"><kbd>Detail Order: ${order.orderid}</kbd></p>
        
        <div class="container" style="margin-top: 2%; margin-bottom:5%;">

            <table id ="example" class="table" >
                <thead>
                <th class="success">Image</th>

                <th class="success">ProductName</th>
                <th class="success">Quantity</th>
                <th class="success">Price</th>
                </thead>
                <c:forEach items="${order.historyorderdetailList}" var="o">
                    <tr>
                        <td><img src = "book/${o.productcode.productcode}.jpg" width="120"></td>
                        <td>${o.productcode.productname}</td>
                        <td>${o.productquantity}</td>
                        <td><img src = "pic/buy.png" width="30">${o.productprice} ฿</td>    
                    </tr>
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
