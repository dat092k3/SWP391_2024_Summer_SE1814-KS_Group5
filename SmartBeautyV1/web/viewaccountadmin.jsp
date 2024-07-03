<%-- 
    Document   : viewaccountadmin
    Created on : Jul 3, 2024, 2:47:42 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Manager Account</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                margin-top:20px;
                background:#f8f8f8
            }
        </style>
    </head>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="row flex-lg-nowrap">
                <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
                    <div class="card p-3">
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link px-2 active" href="#"><i class="fa fa-fw fa-bar-chart mr-1"></i><span>Overview</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="viewprofileemployeeadmin" target="__blank"><i class="fa fa-fw fa-th mr-1"></i><span>Profile Employee</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="#" target="__blank"><i class="fa fa-fw fa-cog mr-1"></i><span>Settings</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="e-tabs mb-3 px-3">
                        <ul class="nav nav-tabs">
                            <li class="nav-item"><a class="nav-link active" href="#">Account Employee</a></li>
                        </ul>
                    </div>
                    <div class="row flex-lg-nowrap">
                        <div class="col mb-3">
                            <div class="e-panel card">
                                <div class="card-body">
                                    <div class="card-title">
                                        <h6 class="mr-2"><span>Account Employee</span><small class="px-1">Be a wise leader</small></h6>
                                    </div>
                                    <p style="color:red; font-weight: bold"> ${messen}</p>
                                    <p style="color:green; font-weight: bold"> ${messen1}</p>
                                    <span style="color: red">${err_username}</span>
                                    <span style="color: red">${err_email}</span>
                                    <span style="color: red">${err_phone}</span>
                                    <span style="color: red">${re_password}</span>
                                    <span style="color: green">${success}</span>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>UserName</th>
                                                        <th>PassWord</th>
                                                        <th>Email</th>
                                                        <th>PhoneNumber</th>
                                                        <th>Status</th>
                                                        <th>Role</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="account" items="${listaccountemployeeadmin}">
                                                    <tr>
                                                        <td class="text-nowrap align-middle">${account.username}</td>
                                                        <td class="text-nowrap align-middle">${account.password}</td>
                                                        <td class="text-nowrap align-middle">${account.email}</td>
                                                        <td class="text-nowrap align-middle">${account.phoneNumber}</td>
                                                        <td class="text-center align-middle">
                                                            <i class="fa fa-fw cursor-pointer
                                                               <c:choose>
                                                               <c:when test="${account.status == 1}">
                                                                fa-toggle-on text-success
                                                                </c:when>
                                                                <c:otherwise>
                                                                    fa-toggle-off text-secondary
                                                                </c:otherwise>
                                                                </c:choose>">
                                                                ${account.status == 1 ? 'On' : 'Off'}
                                                            </i>
                                                        </td>
                                                        <td class="text-nowrap align-middle">${account.role}</td>
                                                        <td class="text-center align-middle">
                                                            <div class="btn-group align-top">
                                                                <a href="viewdetailaccount?account_id=${account.account_id}">Edit</a>
                                                            </div>                                                            
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <ul class="pagination mt-3 mb-0">
                                                <li class="disabled page-item"><a href="#" class="page-link">‹</a></li>
                                                <li class="active page-item"><a href="#" class="page-link">1</a></li>
                                                <li class="page-item"><a href="#" class="page-link">2</a></li>
                                                <li class="page-item"><a href="#" class="page-link">3</a></li>
                                                <li class="page-item"><a href="#" class="page-link">4</a></li>
                                                <li class="page-item"><a href="#" class="page-link">5</a></li>
                                                <li class="page-item"><a href="#" class="page-link">›</a></li>
                                                <li class="page-item"><a href="#" class="page-link">»</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-3 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="text-center px-xl-3">
                                        <button class="btn btn-success btn-block" data-toggle="modal" data-target="#new-user-modal">Create Account</button>
                                    </div>
                                    <hr class="my-3">

                                    <form action="searchemployeeadmin" method="get">
                                        <hr class="my-3">
                                        <div>
                                            <div class="form-group">
                                                <label>Search Account:</label>
                                                <div>
                                                    <input class="form-control flatpickr-input" placeholder="search" type="text" value="${txt}" name="txt">
                                                </div>
                                            </div>
                                            <hr class="my-3">
                                            <div class="form-group">
                                                <div class="col d-flex justify-content-end">
                                                    <button class="btn btn-primary" type="submit">Search</button>
                                                </div>
                                            </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- New User Modal -->
                    <div class="modal fade" role="dialog" tabindex="-1" id="new-user-modal">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">New Account</h5>
                                    <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body"> 
                                    <div class="py-1">
                                        <form class="form" method="get" action="addaccountadmin">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Username</label>
                                                                <input class="form-control" type="text" name="username" value="" placeholder="username" pattern="^\S.*$"  title="cannot contain any spaces." required="">
                                                                <span style="color: red">${err_username}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Email</label>
                                                                <input class="form-control" type="email" name="email" placeholder="user@example.com"  pattern="^\S.*$"  title="cannot contain any spaces." required="">
                                                                <span style="color: red">${err_email}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>PhoneNumber</label>
                                                                <input class="form-control" type="text" name="phonenumber" placeholder="0987654321" required pattern="^0\d{9}$" title="Phone number must start with 0 and be 10 digits long.">
                                                                <span style="color: red">${err_phone}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-6 mb-3">
                                                    <div class="mb-2"><b>Password</b></div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Password</label>
                                                                <input class="form-control" type="password" name="password" placeholder="••••••" pattern="^\S.*$"  title="cannot contain any spaces." required="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Confirm <span class="d-none d-xl-inline">Password Account</span></label>
                                                                <input class="form-control" type="password" name="repassword" placeholder="••••••" pattern="^\S.*$"  title="cannot contain any spaces." required=""></div>
                                                        </div>
                                                    </div>
                                                    <span style="color: red">${re_password}</span>
                                                </div>
                                                <div class="col-12 col-sm-5 offset-sm-1 mb-3">
                                                    <div class="mb-2"><b>Role Of Employee</b></div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <label>Role</label>
                                                            <select class="form-control" name="role" required=""> 
                                                                <option value="Admin">Admin</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col d-flex justify-content-end">
                                                    <button class="btn btn-primary" type="submit">Create User</button>
                                                </div>
                                            </div>
                                            <p style="color:red; font-weight: bold"> ${messen}</p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script src="js/address.js"></script> 
    </body>
</html>
