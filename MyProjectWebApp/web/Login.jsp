<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<html>
    <head>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
    </head>

    <body id="LoginForm">



        <div class="login-form">
            <div class="main-div">
                <div class="panel">
                    <img class="logo" src="view/img/logo.png" alt="login" width="40%" height="20%">
                    <h2 style="margin-top: 10px">Login</h2>
                    <p>Please enter your username and password</p>
                </div>
                <form id="Login" action="Login" method="post">

                    <div class="form-group">


                        <input type="text" class="form-control" id="inputEmail" placeholder="Username" name="username">

                    </div>

                    <div class="form-group">

                        <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="password">

                    </div>
                    <div class="forgot">
                        <a href="reset.html">Forgot password?</a>
                    </div>
                    <button type="submit" class="btn btn-success" style="width:100%">Login</button>

                </form>
                <a href="view/state/landing.html" class="btn btn-danger" style="width:100%">Back</a>
            </div>

        </div></div>


</body>

<style>

    body#LoginForm{ background-image:url("view/img/bglogin.png"); background-repeat:no-repeat; background-position:center; background-size:cover; padding:10px;  }

    .form-heading { color:#fff; font-size:23px;}
    .panel h2{ color:#444444; font-size:18px; margin:0 0 8px 0;}
    .panel p { color:#777777; font-size:14px; margin-bottom:30px; line-height:24px;}
    .login-form .form-control {
        background: #f7f7f7 none repeat scroll 0 0;
        border: 3px solid #d4d4d4;
        border-radius: 4px;
        font-size: 14px;
        height: 50px;
        line-height: 50px;

    }
    .main-div {
        background: #ffffff none repeat scroll 0 0;
        border:10px;
        margin: 10px auto 30px;
        max-width: 38%;
        padding: 50px 70px 70px 71px;
        border-radius: 20px;

    }

    .login-form .form-group {
        margin-bottom:10px;
    }
    .login-form{ text-align:center;}
    .forgot a {
        color: #777777;
        font-size: 14px;
        text-decoration: underline;
    }
    .login-form  .btn.btn-primary {
        background: #f0ad4e none repeat scroll 0 0;
        border-color: #f0ad4e;
        color: #ffffff;
        font-size: 14px;
        width: 100%;
        height: 50px;
        line-height: 50px;
        padding: 0;
    }
    .forgot {
        text-align: left; margin-bottom:30px;
    }
    .botto-text {
        color: #ffffff;
        font-size: 14px;
        margin: auto;
    }
    .login-form .btn.btn-primary.reset {
        background: #ff9900 none repeat scroll 0 0;
    }
    .back { text-align: left; margin-top:10px;}
    .back a {color: #444444; font-size: 13px;text-decoration: none;}

</style>
</html>