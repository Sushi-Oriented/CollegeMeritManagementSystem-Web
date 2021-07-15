<%-- 
    Document   : login
    Created on : Dec 31, 2020, 8:13:37 PM
    Author     : User
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

        <title>CMMS - Login</title>

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
                        <li><a class="nav-link active" data-toggle="pill" href="#student">Student</a></li>
                        <li><a class="nav-link" data-toggle="pill" href="#staff">Staff</a></li>
                    </ul>

                    <!--Tab panes-->
                    <div class="tab-content">
                        <!--Student-->
                        <div id="student" class="container tab-pane active">
                            <center><img class="imageStud" src="pictures/ktdi.png" alt=""/></center><br>
                            <form method="post" action="LoginServletStudent">
                                <label>Student e-mail</label>
                                <div class="form-group">
                                    <input type="email" name="firstemail" id="firstemail" class="form-control form-control-user" placeholder="Email address" required>
                                </div>
                                <label>Password</label>
                                <div class="form-group">
                                    <input type="password" name="password" id="password" class="form-control form-control-user" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                </div><br>
                                <input type="submit" class="btn btn-primary btn-user btn-block" value="Login" /><hr>
                                <center><a href="stud_register.jsp" >Sign Up</a></center>
                            </form>
                        </div>
                        <!--Staff-->
                        <div id="staff" class="container tab-pane">
                            <center><img class="imageStaff" src="pictures/utmlogo.png" alt=""/></center><br>
                            <form method="post" action="LoginServletStaff">
                                <label>Staff e-mail</label>
                                <div class="form-group">
                                    <input type="email" name="firstemail" id="firstemail" class="form-control form-control-user" placeholder="Email address" required>
                                </div>
                                <label>Password</label>
                                <div class="form-group">
                                    <input type="password" name="password" id="password" class="form-control form-control-user" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                </div><br>
                                <input type="submit" class="btn btn-primary btn-user btn-block" value="Login" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="asset/bootstrapScript.jsp"%>
    </body>
</html>
