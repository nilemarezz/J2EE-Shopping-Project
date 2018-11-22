<%-- 
    Document   : History
    Created on : Nov 22, 2018, 2:51:14 PM
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="include/Header.jsp" %>
        <p style="font-size: 50px;margin-top: 8%; margin-left: 7.5%"><kbd>${message}</kbd></p>

        <div class="container" style="margin-top: 2%; margin-bottom:5%;">

            <table id ="example" class="table" >
                <thead>
                <th class="success">Order Number</th>

                <th class="warning">Date</th>

                <th class="success">Price</th>

                <th class="success">Quantity</th>
                </thead>
                <c:forEach items="${order}" var="order">
                    <tr>
                        <a href="Orderdetail?order=${order.orderid}" style="font-size: 20px;">${order.orderid}</a><br>
                        
                        <td>${order.orderdate}<br>
                        <td>${order.ordertotalprice}<br>
                        <td>${order.totalquantity}<br>
                    </tr>

                        </c:forEach>      

            </table>

        </div>
    </body>
</html>
