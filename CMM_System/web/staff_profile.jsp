<%-- 
    Document   : staff_profile
    Created on : Dec 31, 2020, 8:11:24 PM
    Author     : User
--%>

<%@page import="bean.Staff"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>CMMS - Profile</title>

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
        <% Staff staff = (Staff)session.getAttribute("staff"); %>
        <!-- Page Wrapper -->
        <div id="wrapper">
            
            <%@include file="asset/staff_sidebar.jsp"%>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <%@include file="asset/staff_topbar.jsp"%>

                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        
                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Profile</h1>
                            <a class="btn btn-blue" href="staff_index.jsp" role="button"><i class='fas fa-arrow-left'></i>Back</a>
                        </div>
                        <p style="font-style: italic; margin-bottom: -8px;">
                                Account > Profile
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
                                            <center>
                                                <!-- Start form -->
                                                <form action="staff_editprofile.jsp">
                                                    <!-- Start table -->
                                                    <table>
                                                        <tr>
                                                            <td>Full name</td>
                                                            <td>:</td>
                                                            <td><input class="form-control" type="text" value="<%= staff.getFullname() %>" disabled></td>
                                                        </tr>
                                                        <tr><td colspan="3"><br></td></tr>
                                                        <tr>
                                                            <td>Nickname</td>
                                                            <td>:</td>
                                                            <td><input class="form-control" type="text" value="<%= staff.getNickname() %>" disabled></td>
                                                        </tr>
                                                        <tr><td colspan="3"><br></td></tr>
                                                        <tr>
                                                            <td>First email</td>
                                                            <td>:</td>
                                                            <td><input class="form-control" type="text" value="<%= staff.getFirstemail()%>" disabled></td>
                                                        </tr>
                                                        <tr><td colspan="3"><br></td></tr>
                                                        <tr>
                                                            <td>Student ID</td>
                                                            <td>:</td>
                                                            <td><input class="form-control" type="text" value="<%= staff.getStaffID()%>" disabled></td>
                                                        </tr>
                                                        <tr><td colspan="3"><br></td></tr>
                                                        <tr>
                                                            <td>Phone Number</td>
                                                            <td>:</td>
                                                            <td><input class="form-control" type="text" value="<%= staff.getStaffphoneno()%>" disabled></td>
                                                        </tr>
                                                    </table><br><br>
                                                    <!-- End table -->
                                                    <center>
                                                        <button class="btn btn-success" type="submit">Edit Profile</button>
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
