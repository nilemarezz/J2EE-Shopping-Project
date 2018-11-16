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
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        <!--<section class="jumbotron text-center">
            <div class="container">
                <h1 class="jumbotron-heading">E-COMMERCE CART</h1>
             </div>
        </section>-->

        <div class="container mb-4" style="margin-top: 7%">
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col"> Image</th>
                                    <th scope="col">Product</th>

                                    <th scope="col">Available</th>

                                    <th scope="col" class="text-center">Quantity</th>
                                    <th scope="col"></th>
                                    <th scope="col"></th>
                                    <th scope="col" class="text-right">Price</th>
                                    <th> </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cart.lineItems}" var="line" varStatus="vs">
                                    <tr>
                                        <td><img src="book/${line.product.productcode}.jpg" width="120"></td>
                                        <td ><a href="GetProduct?productCode=${line.product.productcode}" style="font-size: 20px;">${line.product.productname}</a><br>
                                            <p>${line.product.productdescription}</p> 
                                            <p>${p.productdescription}</p></td>
                                        <td>${line.product.quantityinstock}</td>

                                        <td><input class="form-control" type="text" id="quantity" value="${line.quantity}" /></td>
                                        <td><a href="AddItemToCart?productCode=${line.product.productcode}&url=ShowCart"><button class="btn btn-sm btn-success"style="width: 107%" >+</button></a></td>
                                        <td><a href="MinusItem?productCode=${line.product.productcode}&url=ShowCart&operator=minus"><button class="btn btn-sm btn-success"style="width: 120%" >-</button></a></td>
                                        <td class="text-right" id="price">฿${line.totalPrice}</td>
                                        <td class="text-right"><a href="Remove?productCode=${line.product.productcode}&url=ShowCart"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button></a> </td>
                                    </tr>
                                </c:forEach>
                                
                            </tbody>
                        </table>
                    </div>
                </div>

                <div style="margin-left: 80%;width:350px;height: 250px;" >   

                    <h4 color: #FF8C00">
                        <strong>Total: </strong>
                        ฿<c:set var="total" value="${0}"/>
                        <c:forEach var="article" items="${cart.lineItems}">
                            <c:set var="total" value="${total + article.totalPrice}" />
                        </c:forEach>
                        <c:out value ="${total}"/><br>
                    </h4><br>
                    <a href="Checkout"><button class="btn btn-sm btn-primary"style="width: 75%;height: 20%" >Confirm</button></a> 
                </div>


            </div>
        </div>






    </body>
</body>

</html>
