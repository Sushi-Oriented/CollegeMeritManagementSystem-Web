<%@page import="bean.Availability"%>
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
            background-color: #336EC4;;
            color: white;
        }

        table {
          border-collapse: collapse;
          width: 100%;
          font-size: medium;
        }
        </style>
    </head>
    <body>
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
                            <a class="btn btn-blue" href="staff_index.jsp" role="button"><i class='fas fa-arrow-left'></i>Back</a>
                        </div>
                        
                        <p style="font-style: italic; margin-bottom: -8px;">Program > Program Verification</p><hr>
                       
                        <div>
                            <% 
                                Availability status = (Availability) session.getAttribute("status"); 
                                String st = status.getStatus();
                            %>
                       <form action="staff_programAvailable" method="post">
                            <table  style=" width: 50%">
                                <tr>
                                    <td>Program Availability</td>
                                    <td>:</td>
                                    <td>
                                        <select class="form-control" name="progAvailability">
                                            <option value="<%= st %>"><%= st %> Program Application</option>
                                            <% 
                                                if(st.equals("Enable")){ %>
                                                    <option value="Disable">Disable Program Application</option>
                                                <%
                                                }
                                                else{ %>
                                                    <option value="Enable">Enable Program Application</option>
                                                    <!--<option value="Enable">PROGRAMMM</option>-->
                                                <% } %>
                                        </select>
                                    </td>
                                    <td><input class="btn btn-success" type="submit" value="Set"></td>
                                </tr>
                            </table>
                        </form>
                        </div>
                        
                        <!-- Page Details -->
                        <%
                            Vector progList = (Vector) session.getAttribute("progList");
                            if (progList != null && (progList.size() > 0)){
                        %>
                            <div class="container-fluid">
                                <div class="card-body">
                                    <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" >  
                                        <tr>
                                            <th>No.</th>
                                            <th>Program Name</th>
                                            <th>Location</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th>Organizer</th>
                                            <th>Category</th>
                                            <th>Status</th>
                                            <th colspan="2">Action</th>
                                        </tr>
                                        <%
                                            for (int index=0; index < progList.size();index++){
                                                Program stude_prog = (Program) progList.elementAt(index);
                                        %>
                                        <tr>
                                            <td><%= index + 1 %></td>
                                            <td><%= stude_prog.getProgName() %></td>
                                            <td><%= stude_prog.getProgLocation() %></td>
                                            <td><%= stude_prog.getProgStartDate() %></td>
                                            <td><%= stude_prog.getProgEndDate() %></td>
                                            <td><%= stude_prog.getProgOrganizer()%></td>
                                            <td><%= stude_prog.getProgCategory()%></td>
                                            <td><%= stude_prog.getProgStatus()%></td>
                                            <td>
                                                <form action="details_programServlet">
                                                    <input type="text" name ="progID" value="<%= stude_prog.getProgID() %>" hidden>
                                                    <center><button class="btn btn-blue" type="submit">
                                                        <i class="fas fa-eye"></i>
                                                        View Details
                                                        </button></center>
                                                </form>
                                            </td>
                                        </tr>
                                <% }} else{%> 
                                    <center>
                                        <img src="images/empty.gif" alt=""/>
                                        <br><br>
                                        <p class="lead text-gray-800 mb-5">Program Application is empty.<br>
                                        <a href="stud_index.jsp">&larr; Back to Dashboard</a></p>
                                        
                                    </center>
                                <%}%>
                                    </table>
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
    </body>
</html>
