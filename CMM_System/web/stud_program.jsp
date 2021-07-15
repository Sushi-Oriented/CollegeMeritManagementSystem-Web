<%-- 
    Document   : stud_program
    Created on : Dec 31, 2020, 8:08:05 PM
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

        <title>CMMS - Program</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        <style>
            table, th, td {padding: 10px;}
            input[type=text]{width:100%;}
            .btn-success {
                padding: 12px 35px;
            } /* Green */
            .btn-danger {
                padding: 12px 35px;
            } /* Red */ 
        </style>
    </head>
    
    <body>
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
                            <h1 class="h3 mb-0 text-gray-800">Program Registration</h1>
                            <a class="btn btn-maroon" href="stud_index.jsp" role="button"><i class='fas fa-arrow-left'></i>  Back</a>
                        </div>
                        
                        <p style="font-style: italic; margin-bottom: -8px;">
                                Program > Program Registration
                        </p><hr>
                        
                        <!-- Page Details -->
                        <div class="container-fluid">
                            <div class="card shadow mb-4">
                                 <div class="card-body">
                                     <form method="post" action="stud_programServlet">
                                        <table>
                                             <tr>
                                                 <td>Program Name</td>
                                                 <td>:</td>
                                                 <td><input class="form-control" type="text" name="progName" id="progName" required></td>
                                             </tr>
                                             <tr>
                                                 <td>Location</td>
                                                 <td>:</td>
                                                 <td><input class="form-control" type="text" name="progLocation" id="progLocation" required></td>
                                             </tr>
                                             <tr>
                                                 <td>Start Date</td>
                                                 <td>:</td>
                                                 <td><input class="form-control" type="date" name="progStartDate" id="progStartDate" required></td>
                                             </tr>
                                             <tr>
                                                 <td>End Date</td>
                                                 <td>:</td>
                                                 <td><input class="form-control" type="date" name="progEndDate" id="progEndDate" required></td>
                                             </tr>
                                             <tr>
                                                 <td>Organizer</td>
                                                 <td>:</td>
                                                 <td><input class="form-control" type="text" name="progOrganizer" id="progOrganizer" required></td>
                                             </tr>
                                             <tr>
                                                 <td>Category</td>
                                                 <td>:</td>
<!--                                                 <td><input type="text" name="progCategory" id="progCategory" required></td>-->
                                                <td>
                                                    <select class="form-control" name="progCategory">
                                                        <option value="Festival">Festival</option>
                                                        <option value="Workshops">Workshops</option>
                                                        <option value="Conferences">Conferences</option>
                                                    </select>
                                                </td>
                                             </tr>
                                             <tr>
                                                 <td>Description</td>
                                                 <td>:</td>
                                                 <td><textarea class="form-control" name="progDescription" id="progDescription" rows="5" cols="50" required></textarea></td>
                                             </tr>
                                        </table><br>
                                        <div class="text-center" >
                                            <input class="btn btn-success" type="submit" value="Submit" />
                                            <a class="btn btn-danger" href="stud_program.jsp" role="button">Reset</a>
                                        </div>
                                    </form>
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
