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
        <div class="nav">
            <%@include file="include/Header.jsp" %>
        </div>
        <h1  style="margin-top: 80px;margin-left: 750px;">Profile</h1>

        <form  action ="ChangeProfile" method="post" style="margin-top: 250px;margin-left: 650px;">
                    <table>
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
                            <td><div class="form-group"><textarea  type="text" class="form-control" placeholder="${username.address}"  name="address" required rows="10" style="height:120px"></textarea>

                                </div></td>

                        </tr>
                        <tr>
                            <td><button type="submit" class="btn btn-success">Change Profile</button></td>
                            <td style="text-align: right;"><a href="Main.jsp" class="btn btn-danger" style="width: 130px;">Back</a></td>
                            
                            
                        </tr>
                    </table>
        </form>
                    

        
    </body>
</html>
