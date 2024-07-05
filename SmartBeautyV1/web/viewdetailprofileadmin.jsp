<%-- 
    Document   : viewdetailprofileadmin
    Created on : Jul 3, 2024, 4:39:33 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <<link rel="stylesheet" href="styles/viewdetailprofileptandtakecare.css"/>
    </head>
    <body>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> 
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
        <div class="text-danger">${success}</div>
        <div class="container emp-profile">
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-img">
                        <img src="${profilebyaccountid.image}" alt=""/>
                        <div class="file btn btn-lg btn-primary">
                            Change Photo
                            <input type="file" name="file"/>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="profile-head">
                        <h5>
                            ${profilebyaccountid.fullName}  
                        </h5>
                        <h6>
                            ${profilebyaccountid.department_id}  
                        </h6>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link"  href="viewprofileemployeeadmin">Back</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <input type="button" class="profile-edit-btn" data-toggle="modal" data-target="#editProfileModal" value="Edit Profile"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-work">
                        <div class="col-md-6">
                            <label>Date Of Birth</label>
                        </div>
                        <div class="col-md-6">
                            <p>${profilebyaccountid.dateOfBirth}</p>
                        </div>
                    </div>
                    <div class="profile-work">
                        <div class="col-md-6">
                            <label>HireDate:</label>
                        </div>
                        <div class="col-md-6">
                            <p>${profilebyaccountid.hireDate}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Employee Id</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profilebyaccountid.employee_id}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Full Name</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profilebyaccountid.fullName}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Gender</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profilebyaccountid.gender}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Email</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profilebyaccountid.email}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Phone</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profilebyaccountid.phoneNumber}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Address</label>
                                </div>
                                <div class="col-md-6">
                                    <p>${profilebyaccountid.address}</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Experience</label>
                                </div>
                                <div class="col-md-6">
                                    <textarea>${profilebyaccountid.experience}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>          
        </div>

        <!-- Modal -->
        <div class="modal fade" id="editProfileModal" tabindex="-1" aria-labelledby="editProfileModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editProfileModalLabel">Edit Profile</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="get" action="editprofileemployeeadmin">
                            <div class="row">  
                                <div class="col-xl-4">
                                    <div class="card mb-4 mb-xl-0">
                                        <div class="card-header">Profile Picture</div> 
                                        <div class="card-body text-center">
                                            <img class="img-account-profile rounded-circle mb-2" style="width: 100px; height: 100px" src="${profilebyaccountid.image}" > 
                                            <div class="small font-italic text-muted mb-4" >JPG or PNG no larger than 5 MB</div>
                                            <button class="btn btn-primary" type="button">Upload new image<span class="text-danger">*</span></button>
                                            <input class="form-control" placeholder="Enter link image" name="image" value="${profilebyaccountid.image}" >
                                            <c:if test="${not empty error5}">
                                                <div class="text-danger">${error5}</div>
                                            </c:if> 
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-8"> 
                                    <div class="card mb-4">
                                        <div class="card-header">Edit Account Profile</div>
                                        <div class="card-body">
                                            <input class="form-control"  type="text" name="account_id" value="${profilebyaccountid.account_id}" hidden="">
                                            <div class="mb-3">
                                                <label class="small mb-1">Full Name<span class="text-danger">*</span></label>
                                                <input class="form-control"  type="text" placeholder="Enter Full Name" name="fullname" value="${profilebyaccountid.fullName}"  maxlength="255"  required="">
                                                <c:if test="${not empty error1}">
                                                    <div class="text-danger">${error1}</div>
                                                </c:if>
                                            </div> 

                                            <div class="row gx-3 mb-3">

                                                <div class="col-md-6">
                                                    <label class="small mb-1">Gender</label>
                                                    <select class="form-control" name="gender" required>
                                                        <option value="Nam" ${profilebyaccountid.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                                        <option value="Nữ" ${profilebyaccountid.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                                    </select>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="small mb-1">Email<span class="text-danger">*</span></label>
                                                    <input class="form-control" type="email" name="email" placeholder="Enter Email" value="${profilebyaccountid.email}"  maxlength="255"  required="">
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
                                                    <input class="form-control" type="text" placeholder="Enter Phone Number" name="phonenumber" value="${profilebyaccountid.phoneNumber}" required="">
                                                    <c:if test="${not empty error3}">
                                                        <div class="text-danger">${error3}</div>
                                                    </c:if>
                                                    <c:if test="${not empty error9}">
                                                        <div class="text-danger">${error9}</div>
                                                    </c:if>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="small mb-1" >Date of Birth<span class="text-danger">*</span></label>
                                                    <input class="form-control" type="date" placeholder="Enter Date of Birth" name="dateofbirth" value="${profilebyaccountid.dateOfBirth}" required="">
                                                    <c:if test="${not empty error4}">
                                                        <div class="text-danger">${error4}</div>
                                                    </c:if>
                                                </div>
                                            </div>

                                            <div class="mb-3">
                                                <div class="col-md-12"><label class="labels">Address<span class="text-danger">*</span></label>
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
                                                    <input type="text" pattern="^\S.*$" class="form-control" value="${profilebyaccountid.address}" readonly="" placeholder="detail address" >
                                                </div>
                                            </div>

                                            <div class="row gx-3 mb-3">

                                                <div class="col-md-6">
                                                    <label class="small mb-1" >Hire Date<span class="text-danger">*</span></label>
                                                    <input class="form-control" type="date" placeholder="Enter Hire Date" name="hiredate" value="${profilebyaccountid.hireDate}" required="">
                                                    <c:if test="${not empty error10}">
                                                        <div class="text-danger">${error10}</div>
                                                    </c:if>
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="small mb-1" >Department</label>
                                                    <select class="form-control" name="department" required="">
                                                        <option value="3" ${profilebyaccountid.department_id == '3' ? 'selected' : ''}>Admin</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <hr>
                                            <div class="row gx-3 mb-3">
                                                <div class="col-md-12">
                                                    <label class="labels">Experience Knowledge</label>
                                                    <textarea class="form-control" name="experience" placeholder="Experience">${profilebyaccountid.experience}</textarea>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script src="js/profile.js"></script>
        <script src="js/profile1.js"></script>
        <script src="js/address.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    </body>
</html>
