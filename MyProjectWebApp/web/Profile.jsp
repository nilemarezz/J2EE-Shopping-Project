<%-- 
    Document   : Profile
    Created on : Oct 12, 2018, 11:20:22 AM
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

        <h1  style="margin-top:1%;margin-left: 49%;">Profile</h1>


        <form  action ="ChangeProfile" method="post" style="margin-top: 1.5%;margin-left: 40%;">
            


            
            <img src="imgacc.png" width="100px" style="margin-left: 15%"/>
                
            <table style="margin-top: 3%">

                <tr>
                    <td>Username:</td>
                    <td>
                        <div class="form-group">


                            <input type="text" class="form-control" id="inputEmail" placeholder="${username.username}" name="name" required  >

                        </div></td>
                </tr>
                <tr>
                    <td>Name-Password:</td>
                    <td>            
                        <div class="form-group">


                            <input type="text" class="form-control" id="inputEmail" placeholder="${username.name}" name="username" required>

                        </div></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><div class="form-group">


                            <input type="email" class="form-control" id="inputEmail" placeholder="${username.email}" name="email" required>

                        </div></td>

                </tr>

                <tr style="height:120px;">

                    <td>Address:</td>
                    <td><div class="form-group"><textarea  type="text" class="form-control" placeholder="${username.address}"  name="address" required rows="5" ></textarea>

                        </div></td>

                </tr>
                <tr>
                    <td>Province:</td>
                    <td><div class="form-group">


                            <input type="text" class="form-control" id="inputEmail" placeholder="${username.provice}" name="province" required>

                        </div></td>

                </tr>
                <tr>
                    <td><button type="submit" class="btn btn-success">Change Profile</button></td>
                    <td style="text-align: right;"><a href="Main.jsp" class="btn btn-danger" style="width: 130px;">Back</a></td>


                </tr>

            </table>
        </form>

        <style>
            .image-upload > input
            {
                display: none;
            }
        </style>



    </body>
</html>
