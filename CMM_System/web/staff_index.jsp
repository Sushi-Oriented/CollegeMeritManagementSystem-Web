<%-- 
    Document   : staff_index
    Created on : Dec 31, 2020, 6:22:14 PM
    Author     : Alifah Ilyana
--%>

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
        <% Program staffPie = (Program)session.getAttribute("proIndex"); %>
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
                            <h1 class="h3 mb-0 text-gray-800">Welcome to College Merit Management System,<br><b><%= ust1.getFullname() %>!</b> </h1>
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
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= proIndex.getPendingCount()%></div>
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
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= proIndex.getApproveCount()%></div>
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
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= proIndex.getDeclineCount() %></div>
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
                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= proIndex.getProgramCount() %></div>
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
                            
                            <!-- Pie Chart -->
                            <div class="col-xl-3 col-lg-4">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-gray-800">Number of program by program type</h6>
                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">
                                        <div class="chart-pie pt-4 pb-2">
                                            <canvas id="PieChsart"></canvas>
                                        </div>
                                        <hr>
                                        Number of program depends on the program type that available in the system.
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Bar Chart -->
                            <div class="col-xl-9 col-lg-8">                                
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-gray-800">Number of program by month | Current Year: <a id="curYear"></a></h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-bar">
                                            <canvas id="sa"></canvas>
                                        </div>
                                        <hr>
                                        View detail on <a href="staff_programHistory">History</a> page.
                                    </div>
                                </div>
                            </div>
                                                                                    
                        </div>
                        
                        <br><h1 class="h3 mb-0 text-gray-800 text-center">System Guidance and Information</h1><br>
                                                
                                                
                        <div class="row content">
                            
                            <!--tutorial-->
                            <div class="col-xl-9 col-lg-8">                                
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-gray-800">Staff System Guidance </a></h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-bar">
                                            <iframe width="100%" height="100%" src="https://www.youtube.com/embed/qcQe5FceQXY" frameborder="1" 
                                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                        </div>
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
        
        <script>
        var d = new Date();
        var n = d.getFullYear();
        document.getElementById("curYear").innerHTML = n; 
        
        // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';

        // Pie Chart Example
        var ctx = document.getElementById("PieChsart");
        var PieChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ["Festival", "Workshop", "Conferences"],
                datasets: [{
                    data: [<%= staffPie.getFestCount() %>, <%= staffPie.getWorkCount()%>, <%= staffPie.getConfCount()%>],
                    backgroundColor: ['#a11950', '#d7306d', '#f46baf'],
                    hoverBackgroundColor: ['#550a46', '#550a46', '#550a46'],
                    hoverBorderColor: "rgba(234, 236, 244, 1)",
                }],
            },
            options: {
                maintainAspectRatio: false,
                tooltips: {
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    caretPadding: 10,
                },
                legend: {
                    display: true
                },
                cutoutPercentage: 75,
            },
        });
        
        /* ---------------------- Bar Chart ----------------- */
        // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#858796';

        function number_format(number, decimals, dec_point, thousands_sep) {
            // *     example: number_format(1234.56, 2, ',', ' ');
            // *     return: '1 234,56'
            number = (number + '').replace(',', '').replace(' ', '');
            var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            
            toFixedFix = function(n, prec) {
                var k = Math.pow(10, prec);
                return '' + Math.round(n * k) / k;
            };
        
            // Fix for IE parseFloat(0.55).toFixed(0) = 0;
            s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
            if (s[0].length > 3) {
                s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
            }
            if ((s[1] || '').length < prec) {
                s[1] = s[1] || '';
                s[1] += new Array(prec - s[1].length + 1).join('0');
            }
            return s.join(dec);
        }

        // Bar Chart Example
        var ctx = document.getElementById("sa");
        var myBarChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
                datasets: [{
                    label: "Program Count",
                    backgroundColor: "#4e73df",
                    hoverBackgroundColor: "#2e59d9",
                    borderColor: "#4e73df",
                    data: <%= s1 %>, //here
                }],
            },
            options: {
                maintainAspectRatio: false,
                layout: {
                    padding: {
                        left: 10,
                        right: 25,
                        top: 25,
                        bottom: 0
                    }
                },
                scales: {
                    xAxes: [{
                        time: {
                            unit: 'month'
                        },
                        gridLines: {
                            display: false,
                            drawBorder: false
                        },
                        ticks: {
                            maxTicksLimit: 12
                        },
                        maxBarThickness: 20,
                    }],
                    yAxes: [{
                        ticks: {
                            min: 0,
                            max: 40,
                            maxTicksLimit: 5,
                            padding: 10,
                            callback: function(value, index, values) {
                                return + number_format(value);
                            }
                        },
                        gridLines: {
                            color: "rgb(234, 236, 244)",
                            zeroLineColor: "rgb(234, 236, 244)",
                            drawBorder: false,
                            borderDash: [4],
                            zeroLineBorderDash: [1]
                        }
                    }],
                },
                legend: {
                    display: false
                },
                tooltips: {
                    titleMarginBottom: 10,
                    titleFontColor: '#6e707e',
                    titleFontSize: 14,
                    backgroundColor: "rgb(255,255,255)",
                    bodyFontColor: "#858796",
                    borderColor: '#dddfeb',
                    borderWidth: 1,
                    xPadding: 15,
                    yPadding: 15,
                    displayColors: false,
                    caretPadding: 10,
                    callbacks: {
                        label: function(tooltipItem, chart) {
                            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                            return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
                        }
                    }
                },
            }
        });
        
        </script>
    </body>
</html>
