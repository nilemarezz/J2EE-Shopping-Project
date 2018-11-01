<%-- 
    Document   : Main
    Created on : Sep 22, 2018, 4:12:36 PM
    Author     : Nile
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style=" font-family: 'Rosario'">

        <%@include file="include/Header.jsp" %>

        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width: 100%; margin-top: 30px;" >
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" >
                <div class="carousel-item active" style="max-height:600px; ">
                    <img class="d-block w-100" src="pic/welcome.png" alt="First slide" height="600px" >
                    <div class="carousel-caption">
                        <h5 >Welcome to our Shops</h5>
                        <p>Find All your Book You want from here!</p>
                    </div>
                </div>
                <div class="carousel-item" style="max-height:600px; ">
                    <img class="d-block w-100" src="pic/documentary.jpg" alt="Second slide" >
                    <div class="carousel-caption">
                        <h5>Lots of Documentary Book Here </h5>
                        <p>Explore the world with the Documentary Books</p>
                    </div>
                </div>
                <div class="carousel-item"  style="max-height:600px; ">
                    <img class="d-block w-100" src="pic/magezine.jpg" alt="Third slide">
                    <div class="carousel-caption">
                        <h5>Lots of Magezine Here </h5>
                        <p>Update the daily news and Fashion</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div id="page"> 
            <div class="container">
                <div class="title">
                    <h2>CATEGORIES</h2>
                </div>
                <br>
                <div class="boxA">
                    <div class="box margin-btm">
                        <img src="pic/food.jpg" width="320" height="180" alt="" />
                        <div class="details">
                            <h4>Food</h4>
                            <p><strong>Try to cook foods by your self</strong>  <br>  We have many kinds of food books such as Western,Thai food,Dessert,France etc. </p>
                        </div>
                        <a href="#" class="button">More Details</a>
                    </div>
                    <div class="box">
                        <img src="pic/children.jpg" width="320" height="180" alt="" />
                        <div class="details">
                            <h4>Kids</h4>
                            <p><strong>Grown your babies</strong><br> Books can be the perfect tool for helping our children learn about their emotions.</p>
                        </div>
                        <a href="#" class="button">More Details</a>
                    </div>
                </div>
                <div class="boxB">
                    <div class="box">
                        <img src="pic/science.jpg" width="320" height="180" alt="" />
                        <div class="details">
                            <h4>Science</h4>
                            <p><strong>Science is Experiment</strong><br>Science books such as Chemistry, Biology ,Electrical , Physic and others.</p><br>
                        </div>
                        <a href="#" class="button">More Details</a>
                    </div>
                    <div class="box">
                        <img src="pic/education.jpg" width="320" height="180" alt="" />
                        <div class="details">
                            <h4>Education</h4>
                            <p><strong>Information about subject</strong><br>Be enjoy and fun with a comics or improve your Children and spend the family time together</p>
                        </div>
                        <a href="#" class="button">More Details</a>
                    </div>

                </div>
                <div class="boxC">
                    <div class="box">
                        <img src="pic/entertainment.jpg" width="320" height="180" alt="" />
                        <div class="details">
                            <h4>Travel</h4>
                            <p><strong>Explore the world </strong><br>Make a journey, typically of some length or abroad by reading a books</p><br>
                        </div>
                        <a href="#" class="button">More Details</a>
                    </div>
                    <div class="box">
                        <img src="pic/allbooks.jpg" width="320" height="200" alt="" />
                        <div class="details">
                            <h4>All</h4>
                            <p><strong>Find All Books in Website</strong><br></p><br><br>
                        </div>
                        <a href="Product" class="button" style="background-color: #B71010">More Details</a>
                    </div>

                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Trending <b>Products</b></h2>
                    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="0">
                        <!-- Carousel indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>   
                        <!-- Wrapper for carousel items -->
                        <div class="carousel-inner">
                            <div class="item carousel-item active">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="thumb-wrapper">
                                            <div class="img-box">
                                                <img src="book/S01-5.jpg" class="img-responsive img-fluid" alt="">
                                            </div>
                                            <div class="thumb-content">
                                                <h4><a href="GetProduct?productCode=S01-5" style="font-size: 20px;">Wikipatterns</a></h4><br>

                                                <p class="item-price"><span>$1026.00</span></p>
                                                <div class="star-rating">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fak-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                                <a href="#" class="btn btn-primary">Add to Cart</a>
                                            </div>						
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="thumb-wrapper">
                                            <div class="img-box">
                                                <img src="book/S01-8.jpg" class="img-responsive img-fluid" alt="">

                                            </div>
                                            <div class="thumb-content">
                                                <h4><a href="GetProduct?productCode=S01-8" style="font-size: 20px;">How Cool Stuff Works</a></h4><br>

                                                <p class="item-price"><span>$997.50</span></p>
                                                <div class="star-rating">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                                <a href="#" class="btn btn-primary">Add to Cart</a>
                                            </div>						
                                        </div>
                                    </div>		
                                    <div class="col-sm-3">
                                        <div class="thumb-wrapper">
                                            <div class="img-box">
                                                <img src="book/L02-1.jpg" class="img-responsive img-fluid" alt="">
                                            </div>
                                            <div class="thumb-content">
                                                <h4><a href="GetProduct?productCode=L02-1" style="font-size: 20px;">Horridly Ever After</a></h4><br>

                                                <p class="item-price"><span>$317.30</span></p>
                                                <div class="star-rating">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-half-o"></i></li>
                                                    </ul>
                                                </div>
                                                <a href="#" class="btn btn-primary">Add to Cart</a>
                                            </div>						
                                        </div>
                                    </div>								
                                    <div class="col-sm-3">
                                        <div class="thumb-wrapper">
                                            <div class="img-box">
                                                <img src="book/L02-7.jpg" class="img-responsive img-fluid" alt="">
                                            </div>
                                            <div class="thumb-content">
                                                <h4><a href="GetProduct?productCode=L02-7" style="font-size: 20px;">Harry Potter and the Deathly Hallows</a></h4>

                                                <p class="item-price"><span>$1187.50</span></p>
                                                <div class="star-rating">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                                <a href="#" class="btn btn-primary">Add to Cart</a>
                                            </div>						
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item carousel-item">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="thumb-wrapper">
                                            <div class="img-box">
                                                <img src="book/E03-2.jpg" class="img-responsive img-fluid" alt="">
                                            </div>
                                            <div class="thumb-content">

                                                
                                                <h4><a href="GetProduct?productCode=E03-2" style="font-size: 20px;">Complete TOEIC - Listening</a></h4>

                                                <p class="item-price"><span>$274.55</span></p>
                                                <div class="star-rating">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                                <a href="#" class="btn btn-primary">Add to Cart</a>
                                            </div>						
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="thumb-wrapper">
                                            <div class="img-box">
                                                <img src="book/E03-9.jpg" class="img-responsive img-fluid" alt="">
                                            </div>
                                            <div class="thumb-content">
                                                <h4><a href="GetProduct?productCode=E03-9" style="font-size: 20px;">Learning English Nursery</a></h4>
                                                <p class="item-price"><span>$204.25</span></p>
                                                <div class="star-rating">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-half-o"></i></li>
                                                    </ul>
                                                </div>
                                                <a href="#" class="btn btn-primary">Add to Cart</a>
                                            </div>						
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="thumb-wrapper">
                                            <div class="img-box">
                                                <img src="book/C04-2.jpg" class="img-responsive img-fluid" alt="">
                                            </div>
                                            <div class="thumb-content">
                                                <h4><a href="GetProduct?productCode=C04-2" style="font-size: 20px;">Alice in Wonder Sea</a></h4><br>
                                                <p class="item-price"><span>$407.55</span></p>
                                                <div class="star-rating">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                                <a href="#" class="btn btn-primary">Add to Cart</a>
                                            </div>						
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="thumb-wrapper">
                                            <div class="img-box">
                                                <img src="book/C04-7.jpg" class="img-responsive img-fluid" alt="">
                                            </div>
                                            <div class="thumb-content">
                                                <h4><a href="GetProduct?productCode=C04-7" style="font-size: 20px;">Pairs : Twins and Other Twosomes</a></h4>
                                               
                                                <p class="item-price"><span>$460.75</span></p>
                                                <div class="star-rating">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                                <a href="#" class="btn btn-primary">Add to Cart</a>
                                            </div>						
                                        </div>
                                    </div>						
                                </div>
                            </div>
                            <div class="item carousel-item">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="thumb-wrapper">
                                            <div class="img-box">
                                                <img src="book/ET05-2.jpg" class="img-responsive img-fluid" alt="">
                                            </div>
                                            <div class="thumb-content">
                                                <h4><a href="GetProduct?productCode=ET05-2" style="font-size: 20px;">Thailand Small Hotels : Bangkok 2</a></h4>
                                               
                                                <p class="item-price"><span>$845.50</span></p>
                                                <div class="star-rating">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                                <a href="#" class="btn btn-primary">Add to Cart</a>
                                            </div>						
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="thumb-wrapper">
                                            <div class="img-box">
                                                <img src="book/ET05-8.jpg" class="img-responsive img-fluid" alt="">
                                            </div>
                                            <div class="thumb-content">
                                                <h4><a href="GetProduct?productCode=ET05-8" style="font-size: 20px;">Jazz Chant Fairy Tales</a></h4><br>
                                                
                                                <p class="item-price"><span>$522.50</span></p>
                                                <div class="star-rating">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                                <a href="#" class="btn btn-primary">Add to Cart</a>
                                            </div>						
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="thumb-wrapper">
                                            <div class="img-box">
                                                <img src="book/ET05-13.jpg" class="img-responsive img-fluid" alt="">
                                            </div>
                                            <div class="thumb-content">
                                                <h4><a href="GetProduct?productCode=ET05-13" style="font-size: 20px;">The Rough Guide to Laos</a></h4>
                                                <p class="item-price"><span>$617.50</span></p>
                                                <div class="star-rating">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                                <a href="#" class="btn btn-primary">Add to Cart</a>
                                            </div>						
                                        </div>
                                    </div>	
                                    <div class="col-sm-3">
                                        <div class="thumb-wrapper">
                                            <div class="img-box">
                                                <img src="book/FH06-7.jpg" class="img-responsive img-fluid" alt="">
                                            </div>
                                            <div class="thumb-content">
                                                <h4><a href="GetProduct?productCode=FH06-7" style="font-size: 20px;">Healthy Meals for Babies and Toddlers</a></h4>
                                               
                                                <p class="item-price"><span>$246.05</span></p>
                                                <div class="star-rating">
                                                    <ul class="list-inline">
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star"></i></li>
                                                        <li class="list-inline-item"><i class="fa fa-star-o"></i></li>
                                                    </ul>
                                                </div>
                                                <a href="#" class="btn btn-primary">Add to Cart</a>
                                            </div>						
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Carousel controls -->
                        <a class="carousel-control left carousel-control-prev" href="#myCarousel" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a class="carousel-control right carousel-control-next" href="#myCarousel" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <style>

        ul.contact li a.icon-twitter:before { background: #2DAAE4; }
        ul.contact li a.icon-facebook:before { background: #39599F; }
        ul.contact li a.icon-dribbble:before { background: #C4376B;	}
        ul.contact li a.icon-tumblr:before { background: #31516A; }
        ul.contact li a.icon-rss:before { background: #F2600B; }
        .button
        {
            display: inline-block;
            padding: 1em 3em 1em 2em;
            background: #4C4532;
            letter-spacing: 0.20em;
            text-decoration: none;
            text-transform: uppercase;
            font-weight: 400;
            font-size: 0.90em;
            color: #FFF;
        }


        .box1,
        .box2,
        .box3,
        .box4
        {
            width: 235px;
        }

        .box1,
        .box2,
        .box3
        {
            float: left;
            margin-right: 20px;
        }
        .box4
        {
            float: right;
        }
        .boxA,
        .boxB,
        .boxC
        {
            width: 320px;
        }

        .boxA,
        .boxB
        {
            float: left;

        }
        .boxB{
            margin-left: 80px;
        }

        .boxC
        {
            float: right;
        }

        /*********************************************************************************/
        /* 2-column                                                                      */
        /*********************************************************************************/

        .tbox1,
        .tbox2
        {
            width: 575px;
        }

        .tbox1
        {
            float: left;
        }

        .tbox2
        {
            float: right;
        }


        #page
        {
            overflow: hidden;
            padding: 5em 0em;
            background: #f5f5f0;
        }

        .box
        {
            background: #FFFFFF;
            margin-bottom: 2em;
        }

        .box .margin-btm
        {
            margin-bottom: 2em;
        }

        .box .details
        {
            display: block;
            padding: 1em 2em 1em 2em;
        }

        h2 {
            color: #000;
            font-size: 26px;
            font-weight: 300;
            text-align: center;
            text-transform: uppercase;
            position: relative;
            margin: 30px 0 80px;
        }
        h2 b {
            color: #ffc000;
        }
        h2::after {
            content: "";
            width: 100px;
            position: absolute;
            margin: 0 auto;
            height: 4px;
            background: rgba(0, 0, 0, 0.2);
            left: 0;
            right: 0;
            bottom: -20px;
        }
        .carousel {
            margin: 50px auto;
            padding: 0 70px;
        }
        .carousel .item {
            min-height: 330px;
            text-align: center;
            overflow: hidden;
        }
        .carousel .item .img-box {
            height: 160px;
            width: 100%;
            position: relative;
        }
        .carousel .item img {	
            max-width: 100%;
            max-height: 100%;
            display: inline-block;
            position: absolute;
            bottom: 0;
            margin: 0 auto;
            left: 0;
            right: 0;
        }
        .carousel .item h4 {
            font-size: 18px;
            margin: 10px 0;
        }
        .carousel .item .btn {
            color: #333;
            border-radius: 0;
            font-size: 11px;
            text-transform: uppercase;
            font-weight: bold;
            background: none;
            border: 1px solid #ccc;
            padding: 5px 10px;
            margin-top: 5px;
            line-height: 16px;
        }
        .carousel .item .btn:hover, .carousel .item .btn:focus {
            color: #fff;
            background: #000;
            border-color: #000;
            box-shadow: none;
        }
        .carousel .item .btn i {
            font-size: 14px;
            font-weight: bold;
            margin-left: 5px;
        }
        .carousel .thumb-wrapper {
            text-align: center;
        }
        .carousel .thumb-content {
            padding: 15px;
        }
        .carousel .carousel-control {
            height: 100px;
            width: 40px;
            background: none;
            margin: auto 0;
            background: rgba(0, 0, 0, 0.2);
        }
        .carousel .carousel-control i {
            font-size: 30px;
            position: absolute;
            top: 50%;
            display: inline-block;
            margin: -16px 0 0 0;
            z-index: 5;
            left: 0;
            right: 0;
            color: rgba(0, 0, 0, 0.8);
            text-shadow: none;
            font-weight: bold;
        }
        .carousel .item-price {
            font-size: 13px;
            padding: 2px 0;
        }
        .carousel .item-price strike {
            color: #999;
            margin-right: 5px;
        }
        .carousel .item-price span {
            color: #86bd57;
            font-size: 110%;
        }
        .carousel .carousel-control.left i {
            margin-left: -3px;
        }
        .carousel .carousel-control.left i {
            margin-right: -3px;
        }
        .carousel .carousel-indicators {
            bottom: -50px;
        }
        .carousel-indicators li, .carousel-indicators li.active {
            width: 10px;
            height: 10px;
            margin: 4px;
            border-radius: 50%;
            border-color: transparent;
        }
        .carousel-indicators li {	
            background: rgba(0, 0, 0, 0.2);
        }
        .carousel-indicators li.active {	
            background: rgba(0, 0, 0, 0.6);
        }
        .star-rating li {
            padding: 0;
        }
        .star-rating i {
            font-size: 14px;
            color: #ffc000;
        }
    </style>




    <!--    <div>
 
    
</div>-->

</html>
