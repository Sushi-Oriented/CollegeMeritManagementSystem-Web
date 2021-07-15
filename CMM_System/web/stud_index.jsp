<%-- 
    Document   : stud_index
    Created on : Dec 31, 2020, 6:22:14 PM
    Author     : Alifah Ilyana
--%>

<%@page import="bean.Program"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>College Merit Management System</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <% ArrayList  s1  = (ArrayList)session.getAttribute("progCount"); %>
        <% Program studProIndex = (Program)session.getAttribute("studProIndex"); %>
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
                            <h1 class="h3 mb-0 text-gray-800">Welcome to College Merit Management System,<br><b><%= ust.getFullname() %>!</b> </h1>
                            <p>
                                Data updated on <a id="date"></a>
                            </p>
                        </div>
                            
                        <div class="row content">
                            
                            <!-- Pending Program -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-gray-800 text-uppercase mb-1">
                                                    Pending Program</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= studProIndex.getPendingCount()%></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-tasks fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Approved Program -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-success  shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-gray-800 text-uppercase mb-1">
                                                    Approved Program</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= studProIndex.getApproveCount()%></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="far fa-check-circle fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Declined Program -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-danger shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-gray-800 text-uppercase mb-1">
                                                    Declined Program</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= studProIndex.getDeclineCount()%></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="far fa-times-circle fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Total Program -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-gray-800 text-uppercase mb-1">
                                                    Total Program
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= studProIndex.getProgramCount() %></div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-list fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                         
                        </div>
                            
                        <div class="row content">
                            <!-- Empty Card -->
                            <div class="col-xl-9 col-lg-8">                                
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-gray-800">Student System Guidance </a></h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-bar">
                                            <iframe width="100%" height="100%" src="https://www.youtube.com/embed/qZGuPXMPIQ8" frameborder="1" 
                                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>                                        </div>
                                        <hr>
                                        <p><i>This video is brought to you by <a href="https://www.youtube.com/channel/UC43UQirlX-HPDr82WIn5KHA">CMMS 2020</a></i></p>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Pie Chart -->
                            <div class="col-xl-3 col-lg-4">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-gray-800">Merit Calculation</h6>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                       
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Position</th>
                                                        <th>Merit</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Secretariat</td>
                                                        <td>5</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Head Of Department</td>
                                                        <td>8</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Treasurer</td>
                                                        <td>10</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Secretary</td>
                                                        <td>10</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Deputy Director</td>
                                                        <td>15</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Director</td>
                                                        <td>15</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
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
