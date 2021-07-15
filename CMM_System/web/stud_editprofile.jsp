<%-- 
    Document   : stud_editprofile
    Created on : Jan 16, 2021, 2:19:10 PM
    Author     : Alifah Ilyana binti Soharto B19EC0003
--%>

<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>CMMS - Edit Profile</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        <style>
            td{
                padding-left: 20px;
                padding-right: 40px;
            }
        </style>
    </head>
    <body>
        <% User student = (User)session.getAttribute("student"); %>
        <!-- Page Wrapper -->
        <div id="wrapper">
            
            <%@include file="asset/stud_sidebar.jsp"%>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <%@include file="asset/topbar.jsp"%>

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        
                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Edit Profile</h1>
                        </div>
                        <p style="font-style: italic; margin-bottom: -8px;">
                                Account > Profile > Edit Profile
                        </p><hr><br>
                        <div class="card shadow mb-4">
                            <div class="card-body">
                                <!-- Start table for dividing profile and picture -->
                                <table>
                                    <tr>
                                        <td>
                                            <div class="text-center">
                                                <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" 
                                                     src="pictures/loginpic.svg" alt="">
                                            </div>
                                        </td>
                                        <td></td>
                                        <td>
                                            <!-- Start form -->
                                            <center>
                                                <form method="post" action="EditProfileStudent">
                                                    <!-- Start table -->
                                                    <table>
                                                        <tr>
                                                            <td>Full name</td>
                                                            <td>:</td>
                                                            <td><input class="form-control" type="text" value="<%= student.getFullname() %>" disabled></td>
                                                        </tr>
                                                        <tr><td colspan="3"><br></td></tr>
                                                        <tr>
                                                            <td>Nickname</td>
                                                            <td>:</td>
                                                            <td><input class="form-control" type="text" name="nickname" value="<%= student.getNickname() %>"></td>
                                                        </tr>
                                                        <tr><td colspan="3"><br></td></tr>
                                                        <tr>
                                                            <td>First email</td>
                                                            <td>:</td>
                                                            <td><input class="form-control" type="text" value="<%= student.getFirstemail()%>" disabled></td>
                                                        </tr>
                                                        <tr><td colspan="3"><br></td></tr>
                                                        <tr>
                                                            <td>Student ID</td>
                                                            <td>:</td>
                                                            <td><input class="form-control" type="text" value="<%= student.getStudentID()%>" disabled></td>
                                                        </tr>
                                                        <tr><td colspan="3"><br></td></tr>
                                                        <tr>
                                                            <td>Phone Number<br><small><i>Format: xxx-xxxxxxx</i></small></td>
                                                            <td>:</td>
                                                            <td><input class="form-control" type="tel" name="studphoneno" value="<%= student.getStudphoneno() %>" pattern="[0-9]{3}-[0-9]{7}" required></td>
                                                        </tr>
                                                    </table><br><br>
                                                    <!-- End table -->
                                                    <center>
                                                        <button class="btn btn-success" type="submit">Save</button>
                                                        <a href="stud_profile.jsp" role="button" class="btn btn-danger">Cancel</a>
                                                    </center>
                                                </form>
                                                <!-- End form -->
                                            </center>
                                        </td>
                                    </tr>
                                </table>
                                <!-- End table for dividing profile and picture -->
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <%@include file="asset/footer.jsp" %>
            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->
        
        <%@include file="asset/scrollTop.jsp"%>
        <%@include file="asset/bootstrapScript.jsp"%>
    </body>
</html>
