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
        <h1  style="margin-top:7%;margin-left: 49%;">Profile</h1>
        <form  action ="ChangeProfile" method="post" style="margin-top: 0.75%;margin-left: 40%;">
            <img src="pic/imgacc.png" width="100px" style="margin-left: 15%;clip-path: circle();"/>
            <table style="margin-top: 1.75%">

                <tr>
                    <td>Username:</td>
                    <td>
                        <div class="form-group">
                            <input type="text" id="1" class="form-control" id="inputEmail" placeholder="${username.username}" name="name" required style=" border: none;
                                   border-bottom: 1.5px solid grey;"  disabled>
                        </div></td>
                </tr>
                <tr>
                    <td>Name-Surname:</td>
                    <td>            
                        <div class="form-group">
                            <input type="text" id="2" class="form-control" id="inputEmail" value="${username.name}" onfocus="if (this.value == 'Name') {
                                        this.value = '';
                                    }" onblur="if (this.value == '')
                                                " name="name" required style=" border: none;
                                   border-bottom: 1.5px solid grey;">
                        </div></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><div class="form-group">
                            <input type="email" id="3" class="form-control" id="inputEmail" value="${username.email}" name="email" required style=" border: none ;
                                   border-bottom: 1.5px solid grey;" onfocus="if (this.value == 'Email') {
                                               this.value = '';
                                           }" onblur="if (this.value == '')
                                                       ">
                        </div></td>
                </tr>
                <tr >
                    <td>Address:</td>
                    <td><div class="form-group"><textarea id="4" type="text" class="form-control"  name="address" required rows="4" style="border-bottom: 1.5px solid grey;">${username.address}</textarea>
                        </div></td>
                </tr>
                <tr>
                    <td>Province:</td>
                    <td><select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="inlineFormCustomSelect" name="province" style=" border: none;
                                border-bottom: 1.5px solid grey;">
                            <option selected>${username.provice}</option>
                            <option value="Bangkok">Bangkok</option>
                            <option value="SamutPrakran">SamutPrakran</option>
                            <option value="Chonburi">Chonburi</option>
                        </select>
                        </div></td>
                </tr>
                <tr>
                    <td height="60"><button type="submit" class="btn btn-success">Change Profile</button></td>
                    <td style="text-align: right;"><a href="Main.jsp" class="btn btn-danger" style="width: 130px;">Back</a></td>
                </tr>

            </table>
        </form>

    </body>

    
</html>
