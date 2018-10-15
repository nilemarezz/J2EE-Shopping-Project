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
    <body>

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



    </body>


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
                        <p>Try to cook foods by your self.  <br>  We have many kinds of food such as Western,Thai food,Deesert,France etc. </p>
                    </div>
                    <a href="#" class="button">More Details</a>
                </div>
                <div class="box">
                    <img src="images/pic02.jpg" width="320" height="220" alt="" />
                    <div class="details">
                        <h4>Documentary</h4>
                        <p>Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl.</p>
                    </div>
                    <a href="#" class="button">More Details</a>
                </div>
            </div>
            <div class="boxB">
                <div class="box">
                    <img src="images/pic03.jpg" width="320" height="280" alt="" />
                    <div class="details">
                        <h4>Science</h4>
                        <p>Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl.</p>
                    </div>
                    <a href="#" class="button">More Details</a>
                </div>
                <div class="box">
                    <img src="images/pic05.jpg" width="320" height="140" alt="" />
                    <div class="details">
                        <h4>Kids</h4>
                        <p>Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl.</p>
                    </div>
                    <a href="#" class="button">More Details</a>
                </div>

            </div>
            <div class="boxC">
                <div class="box">
                    <img src="images/pic04.jpg" width="320" height="200" alt="" />
                    <div class="details">
                        <h4>Magezine</h4>
                        <p>Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl.</p>
                    </div>
                    <a href="#" class="button">More Details</a>
                </div>
                <div class="box">
                    <img src="images/pic06.jpg" width="320" height="200" alt="" />
                    <div class="details">
                        <h4>All</h4>
                        <p>Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl.</p>
                    </div>
                    <a href="#" class="button">More Details</a>
                </div>

            </div>
        </div>
    </div>
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

        .button:before
        {
            display: inline-block;
            background: #FFC31F;
            margin-right: 1em;
            width: 40px;
            height: 40px;
            line-height: 40px;
            border-radius: 20px;
            text-align: center;
            color: #272925;
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
    </style>



    <!--    <div>
    <%@include file="include/Footer.jsp" %>    
    
</div>-->

</html>
