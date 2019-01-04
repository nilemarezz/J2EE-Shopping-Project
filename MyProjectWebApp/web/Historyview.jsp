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
        <title>BookMart</title>
    </head>

    <%@include file="include/Header.jsp" %>

    <body style="background-color: #ffffff; font-family: 'Rosario', sans-serif;">
        <p style="font-size: 50px;margin-top: 8%; margin-left: 7.5%"><kbd>History</kbd></p>
        <form action="SearchPrice" method="get">
            
        </form>
        <div class="container" style="margin-top: 2%; margin-bottom:5%;">

            <table id ="example" class="table" >
                <thead>
                <th></th>
                <th class="success">OrderId</th>
                <th class="success">Date</th>
                <th class="success">Method</th>
                
                <th class="success">Amount</th>
                <th class="success">Price</th>
                </thead>
                
                <c:forEach items="${order}" var="p">
                    <tr>
                        <th><a href="Orderdetail?orderid=${p.orderid}" width ="120" >
                                <input type = button class="btn btn-success" value="View Detail" width="120"/>
                            </a></th>
                        <th class="success">${p.orderid}</th>
                        <th class="success">${p.timedate}</th>
                        <th class="success">${p.method}</th>
                        <th class="success">${p.amount}</th>
                        <th class="success">${p.price}</th>
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
