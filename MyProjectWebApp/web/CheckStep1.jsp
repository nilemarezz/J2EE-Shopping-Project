<%-- 
    Document   : CheckStep1
    Created on : Nov 13, 2018, 1:57:05 PM
    Author     : Nile
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookMart</title>
    </head>
    <body>
        <%@include file="include/Header.jsp" %>
    <center><h1>Payment Step</h1></center>
    <form class="form cf">
        <div class="wizard">
            <div class="wizard-inner">
                <div class="connecting-line"></div>
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="nav-item" style="margin-left: 22%;">
                        <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1" class="nav-link active">
                            <span class="round-tab">
                                <i class="fa fa-building"></i>
                            </span>
                        </a>
                    </li>
                    <li role="presentation" class="nav-item">
                        <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2" class="nav-link disabled">
                            <span class="round-tab">
                                <i class="fa fa-money"></i>
                            </span>
                        </a>
                    </li>
                    <li role="presentation" class="nav-item">
                        <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3" class="nav-link disabled">
                            <span class="round-tab">
                                <i class="fa fa-check"></i>
                            </span>
                        </a>   
                </ul>
            </div>

            <div class="tab-content">
                <div class="tab-pane active text-center" role="tabpanel" id="step1">
                    <div class="row">

                    </div>
                    <p class="text-center"><h5 style="margin-top: -2%">Check Your Address</h5>
                    <center><div style="background-color: #ffcc66;padding: 20px;border-style: double;height: 270;width:400px; margin-top: 2%">
                            <div style="background-color: white;width:350px;height: 230px;padding: 20px;">
                                <h5>Address</h5>
                                <input type="radio" name="address" value="address" checked>${username.address}<br><br>
                                <center><a href="Profile.jsp"><button class="btn btn-sm btn-success"style="width: 50%;margin-top: 8%" >Change Address</button></a></center>
                            </div>
                        </div></center>
                    <ul class="list-inline text-md-center">
                        <li><button type="button" class="btn btn-primary btn-common next-step next-button" style="margin-top: 3%">Next Step</button></li>
                    </ul>
                </div>
                <div class="tab-pane" role="tabpanel" id="step2">
                    <div class="row">


                    </div>
                    <p class="text-center"><article class="card" style="margin-top: -5%">
                        <center><div class="card-body p-5" style="width: 50%;">
                                <p> <img src="http://bootstrap-ecommerce.com/main/images/icons/pay-visa.png"> 
                                    <img src="http://bootstrap-ecommerce.com/main/images/icons/pay-mastercard.png"> 
                                    <img src="http://bootstrap-ecommerce.com/main/images/icons/pay-american-ex.png">
                                </p>


                                <form role="form">
                                    <div class="form-group">
                                        <label for="username">Full name (on the card)</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-user"></i></span>
                                            </div>
                                            <input type="text" class="form-control" name="username" placeholder="" required="">
                                        </div> <!-- input-group.// -->
                                    </div> <!-- form-group.// -->

                                    <div class="form-group">
                                        <label for="cardNumber">Card number</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-credit-card"></i></span>
                                            </div>
                                            <input type="text" class="form-control" name="cardNumber" placeholder="">
                                        </div> <!-- input-group.// -->
                                    </div> <!-- form-group.// -->

                                    <div class="row">
                                        <div class="col-sm-8">
                                            <div class="form-group">
                                                <label><span class="hidden-xs">Expiration</span> </label>
                                                <div class="form-inline">
                                                    <select class="form-control" style="width:45%">
                                                        <option>MM</option>
                                                        <option>01 - January</option>
                                                        <option>02 - February</option>
                                                        <option>03 - February</option>
                                                    </select>
                                                    <span style="width:10%; text-align: center"> / </span>
                                                    <select class="form-control" style="width:45%">
                                                        <option>YY</option>
                                                        <option>2018</option>
                                                        <option>2019</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV <i class="fa fa-question-circle"></i></label>
                                                <input class="form-control" required="" type="text">
                                            </div> <!-- form-group.// -->
                                        </div>
                                    </div> <!-- row.// -->

                                </form>
                            </div></center> <!-- card-body.// -->
                    </article>
                    <ul class="list-inline text-md-center">
                        <li><button type="button" class="btn btn-primary btn-common next-step next-button" style="margin-top: 1%">Next Step</button></li>
                    </ul>
                </div>
                <div class="tab-pane" role="tabpanel" id="step3">
                    <div class="row">

                    </div>
                    <center><div style="border-style: double;width: 50%;height: 50%;padding: 20px;">
                            <center><h4>Are you sure?</h4></center>
                            <img src="pic/caution.png" alt="Smiley face" height="120" width="120">

                            <center><strong>Total:฿<c:set var="total" value="${0}"/>
                                    <c:forEach var="article" items="${cart.lineItems}">
                                        <c:set var="total" value="${total + article.totalPrice}" />
                                    </c:forEach>
                                    <c:out value ="${total}"/></strong><br></center>
                            <center><a href="Order" width ="120" >
                                <input type ="button" class="btn btn-success" value="Comfirm" width="120"/>
                            </a></center>
                        </div></center>
                </div>
                <div class="clearfix"></div>
            </div>

        </div>
    </form>
</body>
<style>
    .wizard {
        margin: 20px auto;
        background: #fff;
    }

    .wizard .nav-tabs {
        position: relative;
        margin: 40px auto;
        margin-bottom: 0;
        border-bottom-color: #e0e0e0;
    }

    .wizard > div.wizard-inner {
        position: relative;
    }

    .connecting-line {
        height: 2px;
        background: #e0e0e0;
        position: absolute;
        width: 40%;
        margin: 0 auto;
        left: 0;
        right: 0;
        top: 50%;
        z-index: 1;
    }

    .wizard .nav-tabs > li.active > a,
    .wizard .nav-tabs > li.active > a:hover,
    .wizard .nav-tabs > li.active > a:focus {
        color: #555555;
        cursor: default;
        border: 0;
        border-bottom-color: transparent;
    }

    span.round-tab {
        width: 70px;
        height: 70px;
        line-height: 70px;
        display: inline-block;
        border-radius: 100px;
        background: #fff;
        border: 2px solid #e0e0e0;
        z-index: 2;
        position: absolute;
        left: 0;
        text-align: center;
        font-size: 25px;
    }

    span.round-tab i {
        color: #555555;
    }

    .wizard li a.active span.round-tab {
        background: #fff;
        border: 2px solid #5bc0de;

    }

    .wizard li a.active span.round-tab i {
        color: #5bc0de;
    }

    span.round-tab:hover {
        color: #333;
        border: 2px solid #333;
    }

    .wizard .nav-tabs > li {
        width: 19%;
    }

    .wizard li a:after {
        content: " ";
        position: relative;
        left: 46%;
        top: -20px;
        opacity: 0;
        margin: 0 auto;
        bottom: 0px;
        border: 5px solid transparent;
        border-bottom-color: #5bc0de;
        transition: 0.1s ease-in-out;
    }

    .wizard li.active.nav-item:after {
        content: " ";
        position: relative;
        left: 46%;
        top: -20px;
        opacity: 1;
        margin: 0 auto;
        bottom: 0px;
        border: 10px solid transparent;
        border-bottom-color: #5bc0de;
    }

    .wizard .nav-tabs > li a {
        width: 70px;
        height: 70px;
        margin: 20px auto;
        border-radius: 100%;
        padding: 0;
        position: relative;
    }

    .wizard .nav-tabs > li a:hover {
        background: transparent;
    }

    .wizard .tab-pane {
        position: relative;
        padding-top: 50px;
    }

    .wizard h3 {
        margin-top: 0;
    }

    @media( max-width: 585px) {

        .wizard {
            width: 90%;
            height: auto !important;
        }

        span.round-tab {
            font-size: 16px;
            width: 50px;
            height: 50px;
            line-height: 50px;
        }

        .wizard .nav-tabs > li a {
            width: 50px;
            height: 50px;
            line-height: 50px;
        }

        .wizard li.active:after {
            content: " ";
            position: absolute;
            left: 35%;
        }
    }
</style>
<script>
    $('.nav-tabs > li a[title]').tooltip();

    //Wizard
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

        var $target = $(e.target);

        if ($target.hasClass('disabled')) {
            return false;
        }
    });

    $(".next-step").click(function (e) {
        var $active = $('.wizard .nav-tabs .nav-item .active');
        var $activeli = $active.parent("li");

        $($activeli).next().find('a[data-toggle="tab"]').removeClass("disabled");
        $($activeli).next().find('a[data-toggle="tab"]').click();
    });


    $(".prev-step").click(function (e) {

        var $active = $('.wizard .nav-tabs .nav-item .active');
        var $activeli = $active.parent("li");

        $($activeli).prev().find('a[data-toggle="tab"]').removeClass("disabled");
        $($activeli).prev().find('a[data-toggle="tab"]').click();

    });

</script>
</html>
