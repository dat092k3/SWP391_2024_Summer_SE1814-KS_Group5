<%-- 
    Document   : manageaccount
    Created on : Jun 23, 2024, 10:00:34 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                            <button class="btn btn-primary" style="margin-left:15px"><a style="color: white" href="index.jsp">Home</a></button>

                        </div>
                        <div class="e-navlist e-navlist--active-bg">
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link px-2 active" href="#"><i class="fa fa-fw fa-bar-chart mr-1"></i><span>Overview</span></a></li>
                                <li class="nav-item"><a class="nav-link px-2" href="viewprofileemployeeptandtakecare" target="__blank"><i class="fa fa-fw fa-th mr-1"></i><span>Profile Employee</span></a></li>
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
                                    <span style="color: green">${successemployee}</span>
                                    <p style="color:green; font-weight: bold"> ${messen1}</p>
                                    <span style="color: red">${err_username}</span>
                                    <span style="color: red">${err_email}</span>
                                    <span style="color: red">${err_phone}</span>
                                    <span style="color: red">${re_password}</span>
                                    <span style="color: green">${success}</span>
                                    <div class="e-table">
                                        <div class="table-responsive table-lg mt-3">
                                            <table class="table table-bordered" id="accountTable">
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
                                                    <c:forEach var="account" items="${listaccountemployee}">
                                                        <tr>
                                                            <td class="text-nowrap align-middle">${account.username}</td>
                                                            <td class="text-nowrap align-middle">${account.password}</td>
                                                            <td class="text-nowrap align-middle">${account.email}</td>
                                                            <td class="text-nowrap align-middle">${account.phoneNumber}</td>
                                                            <td class="text-center align-middle">
                                                                <i class="fa fa-fw cursor-pointer
                                                                   <c:choose>
                                                                       <c:when test="${account.status}">
                                                                           fa-toggle-on text-success
                                                                       </c:when>
                                                                       <c:otherwise>
                                                                           fa-toggle-off text-secondary
                                                                       </c:otherwise>
                                                                   </c:choose>">
                                                                    ${account.status ? 'On' : 'Off'}
                                                                </i>
                                                            </td>

                                                            <td class="text-nowrap align-middle">${account.role}</td>
                                                            <td class="text-center align-middle">
                                                                <div class="btn-group align-top">
                                                                    <a href="viewdetailaccountptandtakecare?account_id=${account.account_id}">Edit</a>
                                                                </div>                                                            
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <ul class="pagination mt-3 mb-0" id="pagination">
                                                <!-- Pagination will be inserted here -->
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

                                    <form action="searchaccount" method="get">
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
                                        <form class="form" method="get" action="addaccount">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Username<span class="text-danger">*</span></label>
                                                                <input class="form-control" type="text" name="username"  placeholder="username" pattern="^\S.*$" value="${param.username}" title="cannot contain any spaces." required="">
                                                                <span style="color: red">${err_username}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Email<span class="text-danger">*</span></label>
                                                                <input class="form-control" type="email" name="email" placeholder="user@example.com"  pattern="^\S.*$" value="${param.email}"  title="cannot contain any spaces." required="">
                                                                <span style="color: red">${err_email}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>PhoneNumber<span class="text-danger">*</span></label>
                                                                <input class="form-control" type="text" name="phonenumber" placeholder="0987654321"  pattern="^0\d{9}$"  value="${param.phonenumber}"  title="Phone number must start with 0 and be 10 digits long." required="">
                                                                <span style="color: red">${err_phone}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12 col-sm-6 mb-3">
                                                    <div class="mb-2"><b>Password<span class="text-danger">*</span></b></div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Password</label>
                                                                <input class="form-control" type="password" name="password" placeholder="••••••" pattern="^\S.*$" value="${param.password}" title="cannot contain any spaces." required="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label>Confirm <span class="d-none d-xl-inline">Password Account</span></label>
                                                                <input class="form-control" type="password" name="repassword" placeholder="••••••" pattern="^\S.*$" value="${param.repassword}" title="cannot contain any spaces." required=""></div>
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
                                                                <option value="PT">PT</option>
                                                                <option value="Takecare">Takecare</option>
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

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const rowsPerPage = 10;
                const table = document.getElementById("accountTable");
                const pagination = document.getElementById("pagination");
                const rows = table.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
                const totalPages = Math.ceil(rows.length / rowsPerPage);
                let currentPage = 1;

                function displayRows(page) {
                    const start = (page - 1) * rowsPerPage;
                    const end = start + rowsPerPage;
                    for (let i = 0; i < rows.length; i++) {
                        rows[i].style.display = (i >= start && i < end) ? "" : "none";
                    }
                }

                function updatePagination() {
                    pagination.innerHTML = "";
                    for (let i = 1; i <= totalPages; i++) {
                        const li = document.createElement("li");
                        li.className = "page-item " + (i === currentPage ? "active" : "");
                        const a = document.createElement("a");
                        a.className = "page-link";
                        a.href = "#";
                        a.innerText = i;
                        a.addEventListener("click", function (e) {
                            e.preventDefault();
                            currentPage = i;
                            displayRows(currentPage);
                            updatePagination();
                        });
                        li.appendChild(a);
                        pagination.appendChild(li);
                    }
                }

                function initPagination() {
                    displayRows(currentPage);
                    updatePagination();
                }

                initPagination();
            });
        </script>
    </body>
</html>
