<%@page import="bean.User"%>
<%@page import="bean.Program"%>
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

        <title>CMMS - Program</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        <style>
        table, td, th {
          padding: 10px;
        }
        
        th{
            background-color: #336EC4;
            color: white;
        }

        table {
          border-collapse: collapse;
          font-size: medium;
        }
        </style>
    </head>
    <body>
        <% 
            Program programView = (Program)session.getAttribute("programView");
        %>
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
                            <h1 class="h3 mb-0 text-gray-800">Program Approval</h1>
                            <a class="btn btn-blue" href="staff_program.jsp" role="button"><i class='fas fa-arrow-left'></i>  Back</a>
                        </div>
                        
                        <p style="font-style: italic; margin-bottom: -8px;">
                                Program > Program Verification > Program View
                        </p><hr>
                        
                        <!-- Page Details -->
                        <div class="container-fluid">
                            <div class="card shadow mb-4">
                                 <div class="card-body">
                                    <table>
                                        <tr>
                                            <td>Student Name</td>
                                            <td>:</td>
                                            <td><%= programView.getStudName() %></td>
                                        </tr>
                                        <tr>
                                            <td>Program Name</td>
                                            <td>:</td>
                                            <td><%= programView.getProgName() %></td>
                                        </tr>
                                        <tr>
                                            <td>Location</td>
                                            <td>:</td>
                                            <td><%= programView.getProgLocation() %></td>
                                        </tr>
                                        <tr>
                                            <td>Start Date</td>
                                            <td>:</td>
                                            <td><%= programView.getProgStartDate() %></td>
                                        </tr>
                                        <tr>
                                            <td>End Date</td>
                                            <td>:</td>
                                            <td><%= programView.getProgEndDate() %></td>
                                        </tr>
                                        <tr>
                                            <td>Organizer</td>
                                            <td>:</td>
                                            <td><%= programView.getProgOrganizer() %></td>
                                        </tr>
                                        <tr>
                                            <td>Category</td>
                                            <td>:</td>
                                           <td><%= programView.getProgCategory() %></td>
                                        </tr>
                                        <tr>
                                            <td>Description</td>
                                            <td>:</td>
                                            <td><%= programView.getProgDescription() %></td>
                                        </tr>
                                        <tr>
                                            <td>Status</td>
                                            <td>:</td>
                                            <td><%= programView.getProgStatus() %></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><form action="ApproveServlet"><input name="progID" type="text" value="<%= programView.getProgID() %>" hidden><button class="btn btn-success" type="submit">Approve</button></form></td>
                                            <td><form action="DeclineServlet"><input name="progID" type="text" value="<%= programView.getProgID() %>" hidden><button class="btn btn-danger" type="submit">Decline</button></form></td>
                                        </tr>
                                    </table><br>
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
