<!DOCTYPE html>
<html lang="en">
    <head>
        <title>My Shop</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link rel="shortcut icon" href="view/img/logo.png" />

    </head>
    <body background-color="white">
        <img class="background" src="view/img/bglogin.jpg" alt="bglogin" width="100%" height="100%">
        <div class="container" >
            <img class="logo" src="view/img/logo.png" alt="login" width="40%" height="40%">
            <h1><center>Login</center></h1>
            <p style="color: red">${messageregister}</p> 
            <p style="color: red">${messagelogin}</p> 

            <form action="Login" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail1">Username</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Username" name="username">

                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your infomation with anyone else.</small>
                </div>
                
                    
                <table >
                    
                    <tr>
                        <td><a href="Register.jsp" style="margin-left: 110px"><small>Register</small></a></td>
                        <td><a href="Register.jsp"style="padding-left: 40px"><small>Forget Password?</small></a></td>
                    </tr>
                </table>
                    
                    

               
                <button type="submit" class="btn btn-primary btn-lg btn-block" style="margin-top: 20px">Submit</button>
            </form>

            <a href="view/state/landing.html" class="btn btn-primary btn-lg btn-block" style="background-color: #FB2320;margin-top: 10px;">Back</a>

        </div>    
        <style>
            .container{
                width: 400px;
                padding: 50px;
                background-color: white;
                margin-left: 500px;
                margin-top: 60px;

                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-radius: 10px;

            }

            img.background {
                width: 100%;
                height: 100%;
                position: absolute;
                left: 0px;
                top: 0px;
                z-index: -1;
                -webkit-filter: blur(35px); /* Safari 6.0 - 9.0 */
                filter: blur(10px);
            }
            .logo{
                margin-left: 90px;
            }

        </style>


    </body>
</html>