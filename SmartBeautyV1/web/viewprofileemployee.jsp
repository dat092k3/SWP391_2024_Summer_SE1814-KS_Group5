<%-- 
    Document   : viewprofileemployee
    Created on : Jul 7, 2024, 11:52:01 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Profile Header Card</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://netdna.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body {
                margin-top: 20px;
                background: #f4f7f6;
                font-family: 'Arial', sans-serif;
            }
            .header {
                background-color: #333;
                color: white;
                padding: 10px 0;
                text-align: center;
                font-size: 24px;
                position: fixed;
                width: 100%;
                z-index: 1000;
                top: 0;
                left: 0;
            }
            .sidebar {
                height: 100%;
                width: 250px;
                position: fixed;
                z-index: 1;
                top: 50px; /* Adjusted for header height */
                left: 0;
                background-color: #333;
                overflow-x: hidden;
                padding-top: 20px;
            }
            .sidebar a {
                padding: 15px 20px;
                text-decoration: none;
                font-size: 18px;
                color: #ddd;
                display: block;
                transition: 0.3s;
            }
            .sidebar a:hover {
                background-color: #575757;
                color: white;
            }
            .main-content {
                margin-left: 250px;
                padding: 70px 20px 20px; /* Adjusted for header height */
            }
            .card {
                background: #fff;
                margin-bottom: 30px;
                transition: .5s;
                border: 0;
                border-radius: .375rem;
                box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
            }
            .card .body {
                font-size: 14px;
                color: #424242;
                padding: 20px;
                font-weight: 400;
            }
            .profile-page .profile-header {
                position: relative;
                background: linear-gradient(135deg, #72edf2 10%, #5151e5 100%);
                color: white;
                border-radius: .375rem;
            }
            .profile-page .profile-header .profile-image img {
                border-radius: 50%;
                width: 140px;
                border: 3px solid #fff;
                box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
            }
            .profile-page .profile-header .profile-image {
                text-align: center;
                margin-top: 20px;
            }
            .profile-page .profile-header h4 {
                font-weight: bold;
            }
            .profile-page .profile-header .job_post {
                font-size: 16px;
                color: #e0e0e0;
            }
            .profile-page .profile-header p {
                margin: 0;
            }
            .btn-custom {
                background-color: #007bff;
                color: white;
                border-radius: 25px;
                padding: 10px 20px;
                transition: background-color 0.3s ease;
            }
            .btn-custom:hover {
                background-color: #0056b3;
                color: white;
            }
            .pagination .page-item.active .page-link {
                background-color: #007bff;
                border-color: #007bff;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="header">
            Employee Profile
        </div>
        <div class="sidebar">
            <a href="index.jsp"><i class="fa fa-home"></i> Home</a>
            <!--            <a href="#services"><i class="fa fa-cogs"></i> Services</a>
                        <a href="#contact"><i class="fa fa-envelope"></i> Contact</a>-->
            <c:if test="${department_name=='Admin'}">
                <a href="viewaccountadmin"><i class="fa fa-users"></i>Account Amdin</a>
            </c:if>
        </div>
        <div class="main-content">
            <div class="container profile-page">
                <div class="row" id="profile-container">
                    <span style="color: green">${success}</span>
                    <span style="color: red">${error1}</span>
                    <span style="color: red">${error2}</span>
                    <span style="color: red">${error3}</span>
                    <span style="color: red">${error4}</span>
                    <span style="color: red">${error5}</span>
                    <span style="color: red">${error6}</span>
                    <span style="color: red">${error7}</span>
                    <span style="color: red">${error8}</span>
                    <span style="color: red">${error9}</span>
                    <span style="color: red">${error10}</span>
                    <c:forEach var="profile" items="${listprofile}">
                        <div class="col-xl-6 col-lg-7 col-md-12 profile-item">
                            <div class="card profile-header">
                                <div class="body">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-12">
                                            <div class="profile-image"> <img src="${profile.image}" alt> </div>
                                        </div>
                                        <div class="col-lg-8 col-md-8 col-12">
                                            <h4 class="m-t-0 m-b-0"><strong>${profile.fullName}</strong> ${profile.account_id}</h4>
                                            <span class="job_post">${department_name}</span>
                                            <p>${profile.address}</p>
                                            <div>
                                                <c:choose>
                                                    <c:when test="${profile.fullName == null || profile.fullName.isEmpty()}">
                                                        <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#addProfileModal" data-account-id="${profile.account_id}">Empty Profile</button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="position-relative" style="margin-right: 30px">
                                                            <button class="btn btn-primary btn-custom"><a href="viewdetailprofileemployee?account_id=${profile.account_id}" style="color: white; text-decoration: none;">View Detail</a></button>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <ul id="pagination" class="pagination justify-content-center"></ul>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addProfileModal" tabindex="-1" aria-labelledby="addProfileModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addProfileModalLabel">Add Profile</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="get" action="addprofileemployeeofmanagerempty">
                            <div class="row">
                                <div class="col-xl-4">
                                    <div class="card mb-4 mb-xl-0">
                                        <div class="card-header">Profile Picture</div> 
                                        <div class="card-body text-center">
                                            <img class="img-account-profile rounded-circle mb-2" src="" alt> 
                                            <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                                            <button class="btn btn-primary" type="button">Upload new image<span class="text-danger">*</span></button>
                                            <input class="form-control" placeholder="Enter link image" name="image" value="${param.image}" required="">
                                            <c:if test="${not empty error5}">
                                                <div class="text-danger">${error5}</div>
                                            </c:if> 
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-8"> 
                                    <div class="card mb-4">
                                        <div class="card-header">Add Account Profile</div>
                                        <div class="card-body">
                                            <input class="form-control" type="text" name="account_id" value="${profile.account_id}" id="modal-account-id" readonly="">
                                            <div class="mb-3">
                                                <label class="small mb-1">Full Name<span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" placeholder="Enter Full Name" name="fullname" value="${param.fullname}" maxlength="255"  required="">
                                                <c:if test="${not empty error1}">
                                                    <div class="text-danger">${error1}</div>
                                                </c:if>
                                            </div>
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1">Gender</label>
                                                    <select class="form-control" name="gender" required>
                                                        <option value="Nam">Nam</option>
                                                        <option value="Nữ">Nữ</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="small mb-1">Email<span class="text-danger">*</span></label>
                                                    <input class="form-control" type="email" name="email" value="${param.email}" placeholder="Enter Email"  maxlength="255"  required="">
                                                    <c:if test="${not empty error2}">
                                                        <div class="text-danger">${error2}</div>
                                                    </c:if>
                                                    <c:if test="${not empty error8}">
                                                        <div class="text-danger">${error8}</div>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1">Phone Number<span class="text-danger">*</span></label>
                                                    <input class="form-control" type="text" placeholder="Enter Phone Number" name="phonenumber" value="${param.phonenumber}" required="">
                                                    <c:if test="${not empty error3}">
                                                        <div class="text-danger">${error3}</div>
                                                    </c:if>
                                                    <c:if test="${not empty error9}">
                                                        <div class="text-danger">${error9}</div>
                                                    </c:if>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="small mb-1" >Date of Birth<span class="text-danger">*</span></label>
                                                    <input class="form-control" type="date" placeholder="Enter Date of Birth" name="dateofbirth" value="${param.dateofbirth}" required="">
                                                    <c:if test="${not empty error4}">
                                                        <div class="text-danger">${error4}</div>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <div class="col-md-12"><label class="labels">Address<span class="text-danger">*</span></label>
                                                    <div>
                                                        <select name="city" id="city" required="">
                                                            <option value="" selected>City</option>           
                                                        </select>
                                                        <select name="district" id="district">
                                                            <option value="" selected>District</option>
                                                        </select> 
                                                        <select name="ward" id="ward">
                                                            <option value="" selected>Ward</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-6">
                                                    <label class="small mb-1" >Hire Date<span class="text-danger">*</span></label>
                                                    <input class="form-control" type="date" placeholder="Enter Hire Date" name="hiredate" value="${param.hiredate}" required="">
                                                    <c:if test="${not empty error10}">
                                                        <div class="text-danger">${error10}</div>
                                                    </c:if>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="small mb-1" >Department</label>
                                                    <select class="form-control" name="department_id" required="">
                                                        <option value="${department_id}">${department_name}</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-12">
                                                    <label class="labels">Experience Knowledge</label>
                                                    <input type="text" name="experience" class="form-control" placeholder="experience" value="${param.experience}">
                                                </div>
                                            </div>
                                            <button class="btn btn-primary" type="submit">Save changes</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://netdna.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
        <script src="js/address.js"></script>
        <script type="text/javascript">
            // Script để khởi động modal và điền giá trị account_id vào form
            $('#addProfileModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var accountId = button.data('account-id');
                var modal = $(this);
                modal.find('.modal-body #modal-account-id').val(accountId);
            });

            document.addEventListener("DOMContentLoaded", function () {
                const rowsPerPage = 10;
                const container = document.getElementById("profile-container");
                const profiles = container.getElementsByClassName("profile-item");
                const pagination = document.getElementById("pagination");
                const totalPages = Math.ceil(profiles.length / rowsPerPage);
                let currentPage = 1;

                function displayProfiles(page) {
                    const start = (page - 1) * rowsPerPage;
                    const end = start + rowsPerPage;
                    for (let i = 0; i < profiles.length; i++) {
                        profiles[i].style.display = (i >= start && i < end) ? "block" : "none";
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
                            displayProfiles(currentPage);
                            updatePagination();
                        });
                        li.appendChild(a);
                        pagination.appendChild(li);
                    }
                }

                function initPagination() {
                    displayProfiles(currentPage);
                    updatePagination();
                }

                initPagination();
            });
        </script>
    </body>
</html>
