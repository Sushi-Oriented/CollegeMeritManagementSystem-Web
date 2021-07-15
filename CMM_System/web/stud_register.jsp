<%-- 
    Document   : stud_register
    Created on : Jan 27, 2021, 8:31:29 PM
    Author     : Alifah Ilyana binti Soharto B19EC0003
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>CMMS - Register</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.css" rel="stylesheet">
        <link href="css/loginTab.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="asset/topbar.jsp"%>
        <div class="container">
            <!-- Outer Row -->
            <div id="loginCard" class="row justify-content-center">
                <div class="col-xl-10 col-lg-12 col-md-9">
                    <!--Nav pills-->
                    <ul class="nav nav-pills-custom" role="tablist">
                        <li><a class="nav-link active" data-toggle="pill" href="#register">Register</a></li>
                    </ul>
                    <!--End nav pills-->
                    <!--Tab panes-->
                    <div class="tab-content">
                        <!--Register-->
                        <div id="register" class="container tab-pane active">
                            <center><img class="imageStud" src="pictures/ktdi.png" alt=""/></center><br>
                            <!--Start register form-->
                            <form method="post" action="RegServlet">
                                <label>Full name</label>
                                <div class="form-group">
                                    <input type="text" name="fullname" class="form-control form-control-user" placeholder="Full name" required>
                                </div>
                                <label>Nickname</label>
                                <div class="form-group">
                                    <input type="text" name="nickname" class="form-control form-control-user" placeholder="Nickname" required>
                                </div>
                                <label>Student e-mail</label>
                                <div class="form-group">
                                    <input type="email" name="firstemail" class="form-control form-control-user" placeholder="Student e-mail" required>
                                </div>
                                <label>Student ID</label>
                                <small><i>(Format: B21EC0001)</i></small>
                                <div class="form-group">
                                    <input type="text" name="studentID" style='text-transform:uppercase' class="form-control form-control-user" placeholder="Student ID" pattern="[A-Za-z]{1}[0-9]{2}[A-Za-z]{2}[0-9]{4}" required>
                                </div>
                                <label>Phone number</label>
                                <small><i>(Format: 012-3456789)</i></small>
                                <div class="form-group">
                                    <input type="tel" name="studphoneno" class="form-control form-control-user" placeholder="012-3456789" pattern="[0-9]{3}-[0-9]{7}" required>
                                </div>
                                <label>Password</label>
                                <div class="form-group">
                                    <input type="password" name="password" class="form-control form-control-user" placeholder="Password" required>
                                </div><br>
                                <input type="submit" class="btn btn-primary btn-user btn-block" value="Register" />
                                <input type="reset" class="btn btn-danger btn-user btn-block" value="Reset" /><hr>
                                <center><a href="login.jsp" >Back to login page</a></center>
                            </form>
                            <!--End register form-->
                        </div>
                        <!--End register-->
                    </div>
                    <!--End tab panes-->
                </div>
            </div>
        </div>
        <%@include file="asset/bootstrapScript.jsp"%>
    </body>
</html>
