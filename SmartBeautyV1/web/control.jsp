<%-- 
    Document   : statistic
    Created on : Jul 8, 2024, 9:26:19 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <title>Statistic</title>
        <!-- loader-->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link href="assets/css/pace.min.css" rel="stylesheet"/>
        <script src="assets/js/pace.min.js"></script>
        <!--favicon-->
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
        <!-- Vector CSS -->
        <link href="assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet"/>
        <!-- simplebar CSS-->
        <link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
        <!-- Bootstrap core CSS-->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
        <!-- animate CSS-->
        <link href="assets/css/animate.css" rel="stylesheet" type="text/css"/>
        <!-- Icons CSS-->
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css"/>
        <!-- Sidebar CSS-->
        <link href="assets/css/sidebar-menu.css" rel="stylesheet"/>
        <!-- Custom Style-->
        <link href="assets/css/app-style.css" rel="stylesheet"/>

        <style>
            .brand-logo {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .brand-logo img {
                max-width: 100px;  /* Giới hạn chiều rộng của logo */
                height: auto;
            }

            .brand-logo h5 {
                margin-left: 10px;
            }

        </style>
    </head>

    <body class="bg-theme bg-theme1">

        <!-- Start wrapper-->
        <div id="wrapper">

            <!--Start sidebar-wrapper-->
            <div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
                <div class="brand-logo">
                    <a href="index.jsp">
                        <img src="images/dot.png" class="logo-icon" alt="logo icon">
                        <h5 class="logo-text">Dashtreme Admin</h5>
                    </a>
                </div>
                <ul class="sidebar-menu do-nicescrol">
                    <li class="sidebar-header">MAIN NAVIGATION</li>
                    <li>
                        <a href="control">
                            <i class="zmdi zmdi-view-dashboard"></i> <span>Dashboard</span>
                        </a>
                    </li>
                </ul>
            </div>
            <!--End sidebar-wrapper-->

            <!--Start topbar header-->
            <header class="topbar-nav">
                <nav class="navbar navbar-expand fixed-top">
                    <ul class="navbar-nav mr-auto align-items-center">
                        <li class="nav-item">
                            <a class="nav-link toggle-menu" href="javascript:void();">
                                <i class="icon-menu menu-icon"></i>
                            </a>
                        </li>
                    </ul>

                    <ul class="navbar-nav align-items-center right-nav-link">
                        <li class="nav-item dropdown-lg">
                            <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href="javascript:void();">
                                <i class="fa fa-envelope-open-o"></i></a>
                        </li>
                        <li class="nav-item dropdown-lg">
                            <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href="javascript:void();">
                                <i class="fa fa-bell-o"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown" href="#">
                                <span class="user-profile"><img src="https://via.placeholder.com/110x110" class="img-circle" alt="user avatar"></span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </header>
            <!--End topbar header-->

            <div class="clearfix"></div>

            <div class="content-wrapper">
                <div class="container-fluid">

                    <!--Start Dashboard Content--> 

                    <div class="row">
                        <div class="col-12 col-lg-8 col-xl-8">
                            <div class="card">
                                <div class="card-header">List Manager
                                    <div class="card-action">
                                        <div class="dropdown">
                                            <a href="javascript:void();" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown">
                                                <i class="icon-options"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table align-items-center table-flush table-borderless">
                                        <thead>
                                            <tr>
                                                <th>Manager_ID</th>
                                                <th>Manager_name</th>
                                                <th>Address</th>
                                                <th>Phonenumber</th>
                                                <th>Department_name</th>
                                            </tr>
                                        </thead>
                                        <tbody  id="content">
                                            <c:forEach items="${listManager}" var="manager">
                                                <tr>
                                                    <td>${manager.manager_id}</td>
                                                    <td>${manager.fullName}</td>
                                                    <td>${manager.address}</td> 
                                                    <td>${manager.phoneNumber}</td>
                                                    <td>${manager.department_name}</td>                                                      
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-4 col-xl-4">
                            <div class="card">
                                <div class="card-header">Employee
                                    <div class="card-action">
                                        <div class="dropdown">
                                            <a href="javascript:void();" class="dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown"></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="chart-container-2">
                                        <canvas id="chartemployee"></canvas>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table align-items-center">
                                        <tbody>
                                            <tr>
                                                <td><i class="fa fa-circle text-white mr-2"></i> Admin</td>
                                                <td>${requestScope.numberAdmin}</td>
                                            </tr>
                                            <tr>
                                                <td><i class="fa fa-circle text-light-1 mr-2"></i>PT</td>
                                                <td>${requestScope.numberPT}</td>
                                            </tr>
                                            <tr>
                                                <td><i class="fa fa-circle text-light-2 mr-2"></i>Take care</td>
                                                <td>${requestScope.numberTakeCare}</td>
                                            </tr>
                                            <tr>
                                                <td><i class="fa fa-circle text-light-3 mr-2"></i>Manager</td>
                                                <td>${requestScope.numberManager}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div><!--End Row-->

                    <div class="row mt-3">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">The employee is still active</h5>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>Employee_id</th>
                                                    <th>Employee_name</th>
                                                    <th>Address</th>
                                                    <th>Phonenumber</th>
                                                    <th>Department_name</th>
                                                </tr>
                                            </thead>
                                            <tbody  id="content">
                                                <c:forEach items="${listEmployeeActive}" var="employee">
                                                    <tr>  
                                                        <td>${employee.employee_id}</td>
                                                        <td>${employee.fullName}</td>
                                                        <td>${employee.address}</td>
                                                        <td>${employee.phoneNumber}</td>
                                                        <td>${employee.department_name}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">The employee has been fired</h5>
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Employee_id</th>
                                                    <th>Employee_name</th>
                                                    <th>Address</th>
                                                    <th>Phonenumber</th>
                                                    <th>Department_name</th>
                                                </tr>
                                            </thead>
                                            <tbody  id="content">
                                                <c:forEach items="${listEmployeeNonActive}" var="employee">
                                                    <tr>
                                                        <td>${employee.employee_id}</td>
                                                        <td>${employee.fullName}</td>
                                                        <td>${employee.address}</td>
                                                        <td>${employee.phoneNumber}</td>
                                                        <td>${employee.department_name}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--End Row-->
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">The department is still active</h5>
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Department_ID</th>
                                                    <th>Department_name</th>
                                                </tr>
                                            </thead>
                                            <tbody  id="content">
                                                <c:forEach items="${listDepartmentActive}" var="department">
                                                    <tr>
                                                        <td>${department.department_id}</td>
                                                        <td>${department.department_name}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">The department is no longer active</h5>
                                    <div class="table-responsive">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Department_ID</th>
                                                    <th>Department_name</th>
                                                </tr>
                                            </thead>
                                            <tbody  id="content">
                                                <c:forEach items="${listDepartmentNonActive}" var="department">
                                                    <tr> 
                                                        <td>${department.department_id}</td>
                                                        <td>${department.department_name}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--End Row-->


                    <!--End Dashboard Content-->

                    <!--start overlay-->
                    <div class="overlay toggle-menu"></div>
                    <!--end overlay-->

                </div>
                <!-- End container-fluid-->

            </div><!--End content-wrapper-->
            <!--Start Back To Top Button-->
            <a href="javaScript:void();" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
            <!--End Back To Top Button-->

            <!--start color switcher-->
            <div class="right-sidebar">
                <div class="switcher-icon">
                    <i class="zmdi zmdi-settings zmdi-hc-spin"></i>
                </div>
                <div class="right-sidebar-content">

                    <p class="mb-0">Gaussion Texture</p>
                    <hr>

                    <ul class="switcher">
                        <li id="theme1"></li>
                        <li id="theme2"></li>
                        <li id="theme3"></li>
                        <li id="theme4"></li>
                        <li id="theme5"></li>
                        <li id="theme6"></li>
                    </ul>

                    <p class="mb-0">Gradient Background</p>
                    <hr>

                    <ul class="switcher">
                        <li id="theme7"></li>
                        <li id="theme8"></li>
                        <li id="theme9"></li>
                        <li id="theme10"></li>
                        <li id="theme11"></li>
                        <li id="theme12"></li>
                        <li id="theme13"></li>
                        <li id="theme14"></li>
                        <li id="theme15"></li>
                    </ul>

                </div>
            </div>
            <!--end color switcher-->

        </div><!--End wrapper-->

        <!-- Bootstrap core JavaScript-->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!-- simplebar js -->
        <script src="assets/plugins/simplebar/js/simplebar.js"></script>
        <!-- sidebar-menu js -->
        <script src="assets/js/sidebar-menu.js"></script>
        <!-- loader scripts -->
        <script src="assets/js/jquery.loading-indicator.js"></script>
        <!-- Custom scripts -->
        <script src="assets/js/app-script.js"></script>
        <!-- Chart js -->

        <script src="assets/plugins/Chart.js/Chart.min.js"></script>

        <!-- Index js -->
        <script src="assets/js/index.js"></script>
        <script>
            var ctx = document.getElementById('chartemployee').getContext('2d');
            var chart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ['Admin', 'PT', 'Take care', 'Manager'],
                    datasets: [{
                            label: 'Revenue',
                            data: [
            ${requestScope.numberAdmin},
            ${requestScope.numberPT},
            ${requestScope.numberTakeCare},
            ${requestScope.numberManager}
                            ],
                            backgroundColor: [
                                'rgba(255, 255, 255, 0.7)',
                                'rgba(211, 211, 211, 0.7)',
                                'rgba(169, 169, 169, 0.7)',
                                'rgba(128, 128, 128, 0.7)'
                            ],
                            borderColor: [
                                'rgba(255, 255, 255, 1)',
                                'rgba(211, 211, 211, 1)',
                                'rgba(169, 169, 169, 1)',
                                'rgba(128, 128, 128, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            callbacks: {
                                label: function (context) {
                                    var label = context.label || '';
                                    if (label) {
                                        label += ': ';
                                    }
                                    if (context.parsed !== null) {
                                        label += new Intl.NumberFormat('en-US', {
                                            style: 'currency',
                                            currency: 'USD'
                                        }).format(context.parsed);
                                    }
                                    return label;
                                }
                            }
                        }
                    }
                }
            });
        </script>   
    </body>
</html>

