<%-- 
    Document   : stud_approvalProgram
    Created on : Dec 31, 2020, 8:10:44 PM
    Author     : User
--%>

<%@page import="java.util.Vector"%>
<%@page import="bean.User"%>
<%@page import="bean.Program"%>
<%@page import="bean.Program"%>
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

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.css" rel="stylesheet" type="text/css"/>
        
        
    </head>
    <body>
         <% Program detailsprogram = (Program)session.getAttribute("detailsprogram"); %>
 

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
                            <h1 class="h3 mb-0 text-gray-800">Approval Program</h1>
                            <a class="btn btn-maroon" href="stud_index.jsp" role="button"><i class='fas fa-arrow-left'></i>Back</a>

                        </div>
                        
                        <p style="font-style: italic; margin-bottom: -8px;">
                                Merit > <b>Approval Program </b>
                        </p><hr><!-- comment -->
                        

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            
                            </div>
                            
                            <div class="container-fluid">
<!--                                <h1 class="h3 mb-0 text-gray-800">Approval Program</h1><br>
                                <p class="mb-2 text-gray-800">Merit > Approval Program > <b>Program Name ></b></p>
                                <hr class="sidebar-divider my-0"><br>-->

        <%
            Vector dp = (Vector) session.getAttribute("dp");
            if (dp != null && (dp.size() > 0)){
                for (int index=0; index < dp.size();index++){
                    Program p = (Program) dp.elementAt(index);
            
        %>  
                            <form action="stud_merit_GETapprovalProgram">                        
                                <div class="card shadow mb-4 btn btn-light btn-circle1">
<!--                                    <div class="card-header py-3 center">
                                        <h2 class="m-0 font-weight-bold text-primary text-center">Program details</h2>
                                    </div>-->
 
                                    <button class="btn  btn-circle1 text-left" >
                                      
                                        <h4 class="mb-2 text-gray-800"><b>Program Details</b></h4>
                                        <p class="mb-2 text-gray-800"><b>Program Name:</b> <%= p.getProgName()%></p>
                                        <p class="mb-2 text-gray-800"><b>Location:</b> <%= p.getProgLocation()%></p>
                                        <p class="mb-2 text-gray-800"><b>Start Date:</b> <%= p.getProgStartDate()%></p>
                                        <p class="mb-2 text-gray-800"><b>End Date:</b> <%= p.getProgEndDate()%></p>
                                        <p class="mb-2 text-gray-800"><b>Organizer:</b> <%= p.getProgOrganizer()%></p>
                                        <p class="mb-2 text-gray-800"><b>Category:</b> <%= p.getProgCategory()%></p>
                                        <p class="mb-2 text-gray-800"><b>Description:</b> <%= p.getProgDescription()%></p>
                                        <input type="int" name="progid" value="<%= p.getProgID()%>" hidden>                              
                                 
                                    </button>
                                </div>
                            </form>  
         <% } }
            else{%> 
            <center>
                <img src="images/empty.gif" alt=""/>
                <br><br><p>No approval program in your list </p>
            </center>
            <%}
         
         %>                              
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
