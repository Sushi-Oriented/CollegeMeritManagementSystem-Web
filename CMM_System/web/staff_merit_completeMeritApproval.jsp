<%-- 
    Document   : stud_merit
    Created on : Dec 31, 2020, 8:10:44 PM
    Author     : User
--%>

<%@page import="bean.Merit"%>
<%@page import="java.util.Vector"%>
<%@page import="bean.Program"%>
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

        <title>CMMS - Merit</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <!-- Custom styles for this template-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
    
    </head>
    <body>
        
        <% Program detailsprogram = (Program)session.getAttribute("detailsprogram"); %>
        <% Merit dispmerit = (Merit)session.getAttribute("dispmerit"); %>
        <% Vector dm = (Vector) session.getAttribute("dm");%>
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
                            
                            </div>
                            
                            <div class="container-fluid">
                                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                    <h1 class="h3 mb-0 text-gray-800"><%= detailsprogram.getProgName()%></h1><br>
                                    <a class="btn btn-blue" href="staff_merit_SELECTrequestApprovalMerit" role="button"><i class='fas fa-arrow-left'></i>Back</a>

                                </div>
                                
                                
                                <p class="mb-2 text-gray-800">Merit > Merit Approval > <b> <%= detailsprogram.getProgName()%></b></p>
                                <hr class="sidebar-divider my-0"><br>
                                <div class="card shadow mb-4">
<!--                                    <div class="card-header py-3 center">
                                        <h2 class="m-0 font-weight-bold text-primary text-center">Program details</h2>
                                    </div>-->
                                    <div class="card-body">
                                        
                                        <h4 class="mb-2 text-gray-800"><b>Program Details</b></h4>
                                   
                                        <p class="mb-2 text-gray-800"><b>Program Name:</b> <%= detailsprogram.getProgName()%></p>
                                        <p class="mb-2 text-gray-800"><b>Location:</b> <%= detailsprogram.getProgLocation()%></p>
                                        <p class="mb-2 text-gray-800"><b>Start Date:</b> <%= detailsprogram.getProgStartDate()%></p>
                                        <p class="mb-2 text-gray-800"><b>End Date:</b> <%= detailsprogram.getProgEndDate()%></p>
                                        <p class="mb-2 text-gray-800"><b>Organizer:</b> <%= detailsprogram.getProgOrganizer()%></p>
                                        <p class="mb-2 text-gray-800"><b>Category:</b> <%= detailsprogram.getProgCategory()%></p>
                                        <p class="mb-2 text-gray-800"><b>Description:</b> <%= detailsprogram.getProgDescription()%></p>
                                        
                                    </div>


                                </div>
                                
                                <div class="card shadow mb-4">


                                    <div class="card-body">
                        
                        <div class="card-body">
                            
                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <p class="mb-2 text-gray-800 ">Participant List</b></p>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                              
                              <button type="button" class="btn btn-danger me-md-2 " data-bs-toggle="modal" data-bs-target="#exampleModal">
                                      Decline
                              </button>
                              
                              <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                      <div class="modal-dialog">
                                        <div class="modal-content">
                                          <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Details Program</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                          </div>
                                          <div class="modal-body">
                                              
                                                
                                                <p class="mb-2 text-gray-800 text-center"><b>Confirm to decline this merit application ?</b></p><br>
                                                              <div class="row">
                                                                <div class="col-4">
                                                                    <p class="mb-2 text-gray-800"><b>Program Name:</b>
                                                                </div>
                                                                <div class="col-8"><%= detailsprogram.getProgName()%></div>
                                                              </div>
                                                              <div class="row">
                                                                <div class="col-4">
                                                                    <p class="mb-2 text-gray-800"><b>Organizer:</b>
                                                                </div>
                                                                <div class="col-8"><%= detailsprogram.getProgOrganizer()%></div>
                                                              </div>
                                                              <div class="row">
                                                                <div class="col-4">
                                                                    <p class="mb-2 text-gray-800"><b>Total Applied:</b>
                                                                </div>
                                                                <div class="col-8"><%= dm.size()%></div>
                                                              </div>
                                                              <br><p><sub>** Once this application status is declined, the applied merit is not counted. <br>
                                                                      ** Please remake program approval application if want to insert student's merit for particular program. this action must be completed by student</sub></p>
                                                              
                                          </div>
                                          <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <a class="btn btn-danger"  href="staff_merit_DECLINEapprovalMerit" role="button">Yes</a>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                                              
                              <button type="button" class="btn" style="background-color: #4CAF50;color: white;" data-bs-toggle="modal" data-bs-target="#exampleModal1">
                                       Approve
                              </button>
  
                                    <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                      <div class="modal-dialog">
                                        <div class="modal-content">
                                          <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Details Program</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                          </div>
                                          <div class="modal-body">
                                              
                                                
                                                <p class="mb-2 text-gray-800 text-center"><b>Details program for merit approval</b></p><br>
                                                              <div class="row">
                                                                <div class="col-4">
                                                                    <p class="mb-2 text-gray-800"><b>Program Name:</b>
                                                                </div>
                                                                <div class="col-8"><%= detailsprogram.getProgName()%></div>
                                                              </div>
                                                              <div class="row">
                                                                <div class="col-4">
                                                                    <p class="mb-2 text-gray-800"><b>Organizer:</b>
                                                                </div>
                                                                <div class="col-8"><%= detailsprogram.getProgOrganizer()%></div>
                                                              </div>
                                                              <div class="row">
                                                                <div class="col-4">
                                                                    <p class="mb-2 text-gray-800"><b>Total Applied:</b>
                                                                </div>
                                                                <div class="col-8"><%= dm.size()%></div>
                                                              </div>
                                                              
                                          </div>
                                          <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <a class="btn" style="background-color: #336EC4;color: white;" href="staff_merit_COMPLETEapprovalMerit" role="button">Submit</a>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                                              
                                                              
                            </div>
                        </div>
                            
                            
                            <div class="table-responsive">
                                
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    
                                    <thead style="background-color: #336EC4;; color: white;">
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Matric No</th>
                                            <th>IC Number</th>
                                            <th>Merit</th>
                                         
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
        <%
            
            if (dm != null && (dm.size() > 0)){
                for (int index=0; index < dm.size();index++){
                    Merit p = (Merit) dm.elementAt(index);
            
        %>                                          
                                        
                                        <tr>
                                            <td><%= p.getName()%></td>
                                            <td><%= p.getRole()%></td>
                                            <td><%= p.getMatricNum()%></td>
                                            <td><%= p.getIcNum()%></td>
                                            <td><%= p.getMerit()%></td>
                                        </tr>
                                        
  
        <% } }%>  
                                    </tbody>
                                </table>
                            </div>
                        </div>
                                    
         
                <!-- /.container-fluid -->
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
        
                   <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>
    
<!--    <script src="vendor/datatables/jquery.dataTables.min.jsp"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.jsp"></script>
    <script src="js/demo/datatables-demo.js"></script>-->
    
    </body>
</html>
