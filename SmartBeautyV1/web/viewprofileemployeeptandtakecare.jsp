<%-- 
    Document   : viewprofileemployeeptandtakecare
    Created on : Jul 2, 2024, 1:53:14 AM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>View Profile Employee Pt, Takecare</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="styles/viewprofileemployeeptandtakecare.css" rel="stylesheet">
    </head>
    <body>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <div class="container">
            <div class="card overflow-hidden">
                <div class="card-body p-0">
                    <img src="https://lh3.googleusercontent.com/amzunT_MGmwm4cV2zJnrY2G9d1H7pnEDB0fPWn4SGJMEGW9ePVlsSMmSuW2wHgmXMfRekEl416AZBwzrImEVF3ARfntHX2UX9TIeoRD_LI23nNGIFW-X6fDtql6YUdYVDPf78Ml48ToRTzlfknCNHY-L-xWiRMYMVrw4uRFCxDWnNvZgwLGhSt-gkP647buLqntbnII4F-FlnNhn62lnIl4Kvc63-3plqCIvfeCrz00uecDQPQM_X-bTPIM9uE0vGIl_eWzF8_TI3faQ9PcZTIcvV3ZKobMeK_8F1kyPv4tZmRrUSzzlWOH6HWuu-JrXvm5TIixdM9_F6Z4Vh8foudgfGwVAgCchBJmj8u6GrzVAGp2kNkR6JXL4nTrHq6lnazqbseVkcuRFxMHWoYEm8hFjr6cwL55QBcdpcaU6qpZLc9sK9fr1cC7ia2WxWjt0Z73oJ6Af4Lv1dXyajOvXU9v9fEJFz4mUKw6341kcDvDAajJp3k3Qf7BSjUYPQd7pf_O4lpqcJEjsWJj8jjDvQE50LM8p4xtsvpb9XGuzepvTvFZHFuPuIDojYKTPdQb390ju8tFiZY7_UuM_MIvfRPhieHWL7-3ogqG5adTTjGQ55nvz4Fr3QClabPAaFPiXkfjKX6R18nrFJ_fJCz9iv5a7b7vjqOSd-7uhwT48Z6Jaoz6hJMZScwAvnEi_LMnnYyMNnElQmqhlMVcuCwH0opdlLf-nx3VRFEa8cm1vCTghJyYiWHF-Gg=w1219-h657-no" alt class="img-fluid">
                    <div class="row align-items-center">
                        <div class="col-lg-4 order-lg-1 order-2">
                            <div class="d-flex align-items-center justify-content-around m-4">
                                <div class="text-center">
                                    <button class="btn btn-primary"><a href="index.jsp" style="color: white">Home</a></button>
                                </div>
                                <div class="text-center">
                                    <button class="btn btn-primary"><a href="viewaccount" style="color: white">Manage Account</a></button>
                                </div>    
                                <div class="text-center">
                                    <button class="btn btn-primary"><a href="viewprofilemanager" style="color: white">Profile Manager</a></button>
                                </div>  
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
            <div class="tab-content" id="pills-tabContent"> 
                <div class="tab-pane fade show active" id="pills-friends" role="tabpanel" aria-labelledby="pills-friends-tab" tabindex="0">
                    <div class="d-sm-flex align-items-center justify-content-between mt-3 mb-4">
                        <h3 class="mb-3 mb-sm-0 fw-semibold d-flex align-items-center">Profile Employee</h3>
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
                        <form class="position-relative">
                            <input type="text" class="form-control search-chat py-2 ps-5" id="text-srh" placeholder="Search Friends">
                            <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y text-dark ms-3"></i>
                        </form>
                    </div>
                    <div class="row" id="profile-container">
                        <c:forEach var="profile" items="${list}"> 
                            <div class="col-sm-6 col-lg-4 profile-item">
                                <div class="card hover-img">
                                    <div class="card-body p-4 text-center border-bottom">
                                        <img src="${profile.image}" alt class="rounded-circle mb-3" width="80" height="80">
                                        <h5 class="fw-semibold mb-0">${profile.fullName}</h5>
                                        <span class="text-dark fs-2">${profile.account_id}</span>
                                    </div>
                                    <ul class="px-2 py-2 bg-light list-unstyled d-flex align-items-center justify-content-center mb-0">
                                        <li class="position-relative">
                                            <c:choose>
                                                <c:when test="${profile.fullName == null || profile.fullName.isEmpty()}">
                                                    <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#addProfileModal" data-account-id="${profile.account_id}">Empty Profile</button>
                                                </c:when>
                                                <c:otherwise>
                                                <li class="position-relative" style="margin-right: 30px">
                                                    <button class="btn btn-primary"><a href="viewdetailprofileptandtakecare?account_id=${profile.account_id}" style="color: white">View Detail</a></button>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="d-flex justify-content-center">
                        <ul class="pagination mt-3 mb-0" id="pagination">
                            <!-- Pagination will be inserted here -->
                        </ul>
                    </div>
                </div>
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
                        <form method="get" action="addprofileemployeeempty">
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
                                                    <label class="small mb-1" >Hire Date<span class="text-danger">*</span></label>
                                                    <input class="form-control" type="date" placeholder="Enter Hire Date" name="hiredate" value="${param.hiredate}" required="">
                                                    <c:if test="${not empty error10}">
                                                        <div class="text-danger">${error10}</div>
                                                    </c:if>
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
        <script src="js/address.js"></script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">
            // Script để khởi động modal và điền giá trị account_id vào form
            $('#addProfileModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var accountId = button.data('account-id');
                var modal = $(this);
                modal.find('.modal-body #modal-account-id').val(accountId);
            });

            document.addEventListener("DOMContentLoaded", function () {
                const rowsPerPage = 9;
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
