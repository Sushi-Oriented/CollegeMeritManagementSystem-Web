<%-- 
    Document   : staff_history
    Author     : mhafizkn
--%>

<%@page import="org.json.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Vector"%>
<%@page import="bean.Program"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>CMMS - History</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        
        <!-- Datatable Bootstrap -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jq-3.3.1/dt-1.10.23/fh-3.1.7/r-2.2.7/sb-1.0.1/sp-1.2.2/sl-1.3.1/datatables.min.css"/>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jq-3.3.1/dt-1.10.23/fh-3.1.7/r-2.2.7/sb-1.0.1/sp-1.2.2/sl-1.3.1/datatables.min.js"></script>
        
        <style>
/*            #textpg{
                font-family: 'Noto Sans JP', sans-serif;
                text-transform: uppercase;
            }*/
            .subtextpg{
                margin-top: -10px;
            }
            
            table, td, th {
                padding: 10px;
            }

            th{
                background-color: #336EC4;
                color: white;
            }

            table {
                border-collapse: collapse;
                width: 100%;
                font-size: medium;
                text-align: center;
            }
            .page-item.active .page-link {
                background-color: #414141;
                border: 1px solid #615E5D;
            }
            .page-link {
                color: black;
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
                            <h1 class="h3 mb-0 text-gray-800" id="textpg">
                                Requested Program &nbsp;
                                <i class="fas fa-history"></i>
                            </h1>
                            <a class="btn btn-blue" href="staff_index.jsp" role="button"><i class='fas fa-arrow-left'></i>Back</a>
                        </div>
                        
                        <div class="subtextpg">
                            <p style="font-style: italic; margin-bottom: -8px;">
                                View the previous requested program
                            </p>
                            <hr>
                        </div>
                        
                    </div>
                    <!-- /.container-fluid -->
                    
                    <!-- Content-array-program -->
                    <div class="container-fluid text-center">    
                        <div class="row content">
                            <div class="col-lg-12 text-left">
                                <div class="card">
                                    <div class="card-body">
                                        <h3 style="text-decoration: underline;"><b>Program Details</b></h3>
                                        <table class="table table-bordered table-hover" id="historyStaffDataTable" style="width: 100%; text-align: center;" cellspacing="0">
                                            <caption>Program History that has been approved or declined</caption>
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Student</th>
                                                    <th>Program Name</th>                                                    
                                                    <th>Category</th>
                                                    <th>Organizer</th>
                                                    <th>Program Status</th>
                                                    <th>Merit Status</th>
                                                    <th>Action</th>
                                                </tr>
                                                <tr style="color: #ee538b;">
                                                    <td></td>
                                                    <td>Student</td>
                                                    <td></td>
                                                    <td>Category</td>
                                                    <td>Organizer</td>
                                                    <td>Program Status</td>
                                                    <td>Merit Status</td>
                                                    <td></td>
                                                </tr>
                                            </thead>
                                        </table>                                       
                                    </div>
                                </div>    
                            </div>
                        </div>
                    </div>

                </div>
                <!-- End of Main Content -->

                <%@include file="asset/footer.jsp" %>

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->       
        
        <%@include file="asset/scrollTop.jsp"%>
        <%@include file="asset/bootstrapScript.jsp"%>
        <script>
            <% 
               JSONArray jArray = (JSONArray) session.getAttribute("jArray"); 
               int idex;
               for(idex=0; idex<jArray.length(); idex++){                   
               }
            %>
            console.log(<%= idex %>);
            console.log(<%= jArray %>);            
            $(document).ready(function() {
                $('#historyStaffDataTable').DataTable( {
                    data: <%= jArray %>,
                    "columns": [
                        { "data": "Bil" },
                        { "data": "studName" },
                        { "data": "ProgramName" },        
                        { "data": "Category" },
                        { "data": "Organizer" },
                        { "data": "ProgramStatus" },
                        { "data": "MeritStatus" },
                        { "data": null, title: '', wrap: true, "render": function (item) 
                            { 
                                return '<form action="staff_historyDetails" method="post"><input type="int" name="progID" value="'+item.progID+'" hidden><button class="btn btn-blue" type="submit"><i class="fas fa-eye"></i>View Details</button></form>' 
                            } 
                        }
                    ],
                    select: true,
                    initComplete: function () { //Append filter to historyDataTable
                        this.api().columns().every( function () {
                            var column = this;
                            if (column.index() !== 0 && column.index() !== 2 && column.index() !== 7) {  //skip if column 0
                                $(column.header()).append("<br>")
                                var select = $('<select><option selected default readonly value="">Any</option></select>')
                                .appendTo( $(column.header()).empty() )
                                .on( 'change', function () {
                                    var val = $.fn.dataTable.util.escapeRegex(
                                        $(this).val()
                                    );
                                    column
                                    .search( val ? '^'+val+'$' : '', true, false )
                                    .draw();
                                } );
                                    
                                column.data().unique().sort().each( function ( d, j ) {
                                    select.append( '<option value="'+d+'">'+d+'</option>' )
                                } );
                            }
                        } );
                    } 
                } );
            } );
        </script>
        
    </body>
</html>