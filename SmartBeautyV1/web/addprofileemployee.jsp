<%-- 
    Document   : addprofileemployee
    Created on : Jul 1, 2024, 1:57:25 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">


        <title>Add Profile Employee</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body{
                margin-top:20px;
                background-color:#f2f6fc;
                color:#69707a;
            }
            .img-account-profile {
                height: 10rem;
            }
            .rounded-circle {
                border-radius: 50% !important;
            }
            .card {
                box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
            }
            .card .card-header {
                font-weight: 500;
            }
            .card-header:first-child {
                border-radius: 0.35rem 0.35rem 0 0;
            }
            .card-header {
                padding: 1rem 1.35rem;
                margin-bottom: 0;
                background-color: rgba(33, 40, 50, 0.03);
                border-bottom: 1px solid rgba(33, 40, 50, 0.125);
            }
            .form-control, .dataTable-input {
                display: block;
                width: 100%;
                padding: 0.875rem 1.125rem;
                font-size: 0.875rem;
                font-weight: 400;
                line-height: 1;
                color: #69707a;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #c5ccd6;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 0.35rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .nav-borders .nav-link.active {
                color: #0061f2;
                border-bottom-color: #0061f2;
            }
            .nav-borders .nav-link {
                color: #69707a;
                border-bottom-width: 0.125rem;
                border-bottom-style: solid;
                border-bottom-color: transparent;
                padding-top: 0.5rem;
                padding-bottom: 0.5rem;
                padding-left: 0;
                padding-right: 0;
                margin-left: 1rem;
                margin-right: 1rem;
            }
        </style>
    </head>
    <body>
        <div class="container-xl px-4 mt-4">

            <nav class="nav nav-borders">
                <a class="nav-link active ms-0" href="" target="__blank">Profile</a> 
                <a class="nav-link" href="viewaccount" target="__blank">Back</a>
                <a class="nav-link" href="" target="__blank">#</a>
                <a class="nav-link" href="" target="__blank">#</a>
            </nav>
            <hr class="mt-0 mb-4">
            <span style="color: green">${messen1}</span>
            <form method="get" action="addprofileemployee">
                <div class="row">
                    <div class="col-xl-4">

                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Profile Picture</div>
                            <div class="card-body text-center">
                                <img class="img-account-profile rounded-circle mb-2" src="http://bootdey.com/img/Content/avatar/avatar1.png" alt> 
                                <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                                <button class="btn btn-primary" type="button">Upload new image</button>
                                <input class="form-control" placeholder="Enter link image" name="image">
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
                                <input class="form-control"  type="text" name="account_id" value="${account_id}" hidden="">
                                <div class="mb-3">
                                    <label class="small mb-1">Full Name</label>
                                    <input class="form-control"  type="text" placeholder="Enter Full Name" name="fullname" required="">
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
                                        <label class="small mb-1">Email</label>
                                        <input class="form-control" type="email" name="email" placeholder="Enter Email" required="">
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
                                        <label class="small mb-1">Phone Number</label>
                                        <input class="form-control" type="text" placeholder="Enter Phone Number" name="phonenumber" required="">
                                        <c:if test="${not empty error3}">
                                            <div class="text-danger">${error3}</div>
                                        </c:if>
                                        <c:if test="${not empty error9}">
                                            <div class="text-danger">${error9}</div>
                                        </c:if>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="small mb-1" >Date of Birth</label>
                                        <input class="form-control" type="date" placeholder="Enter Date of Birth" name="dateofbirth" required="">
                                        <c:if test="${not empty error4}">
                                            <div class="text-danger">${error4}</div>
                                        </c:if>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <div class="col-md-12"><label class="labels">Address</label>
                                        <div>
                                            <select name="city" id="city">
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
                                        <label class="small mb-1" >Hire Date</label>
                                        <input class="form-control" type="date" placeholder="Enter Hire Date" name="hiredate" required="">
                                    </div>

                                    <div class="col-md-6">
                                        <label class="small mb-1" >Department</label>
                                        <select class="form-control" name="department" required="">
                                            <option value="1">Takecare</option>
                                            <option value="2">PT</option>
                                        </select>
                                    </div>
                                </div>
                                <hr>
                                <div class="row gx-3 mb-3">
                                    <div class="col-md-12">
                                        <label class="labels">Experience Knowledge</label>
                                        <input type="text" name="experience" class="form-control" placeholder="experience" value="${e.experience}">
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="submit">Save changes</button>

                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script src="js/profile.js"></script>
        <script src="js/profile1.js"></script>
        <script src="js/address.js"></script>

    </body>
</html>