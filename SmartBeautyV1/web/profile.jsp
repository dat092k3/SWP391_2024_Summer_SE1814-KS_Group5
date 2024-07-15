<%-- 
    Document   : profile
    Created on : Jun 1, 2024, 8:21:46 PM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="styles/profile.css">
        <link rel="stylesheet" type="text/css" href="styles/profile1.css">
    </head>
    <body>
        <!-- Header -->
        <jsp:include page="include/header.jsp"></jsp:include>
            <!-- Hamburger -->
        <jsp:include page="include/hamburger.jsp"></jsp:include>
            <!-- Menu -->
        <jsp:include page="include/menu.jsp"></jsp:include>
            <!-- Home -->
        <jsp:include page="include/backgroundprofile.jsp"></jsp:include>
            <!-- Elements -->
        <c:choose>
            <c:when test="${empty p.fullName}">
                <c:if test="${account.getRole() == 'Customer' }">
                    <button onclick="document.getElementById('modalForm').style.display = 'block';" class="btn btn-primary">Create Profile</button>
                </c:if>
                <c:if test="${not empty error1}">
                    <div class="text-danger" style="text-align: center">${error1}</div>
                </c:if>
                <c:if test="${not empty error2}">
                    <div class="text-danger" style="text-align: center">${error2}</div>
                </c:if>
                <c:if test="${not empty error3}">
                    <div class="text-danger" style="text-align: center">${error3}</div>
                </c:if>
                <c:if test="${not empty error4}">
                    <div class="text-danger" style="text-align: center">${error4}</div>
                </c:if>
                <c:if test="${not empty error5}">
                    <div class="text-danger" style="text-align: center">${error5}</div>
                </c:if>
                <c:if test="${not empty error6}">
                    <div class="text-danger" style="text-align: center">${error6}</div>
                </c:if>
                <c:if test="${not empty error7}">
                    <div class="text-danger" style="text-align: center">${error7}</div>
                </c:if>
                <c:if test="${not empty error8}">
                    <div class="text-danger" style="text-align: center">${error8}</div>
                </c:if>
                <c:if test="${not empty error9}">
                    <div class="text-danger" style="text-align: center">${error9}</div>
                </c:if>
                <!-- Display success message -->
                <c:if test="${not empty param.success}">
                    <div style="text-align: center; color: green">${param.success}</div>
                </c:if>
                <div id="modalForm" style="display:none;">
                    <form action="updateprofilecustomer" method="post">
                        <div class="container rounded bg-white mt-5 mb-5">
                            <div class="row">
                                <div class="col-md-3 border-right">
                                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                        <img class="rounded-circle mt-5" width="150px" src="${p.image}">
                                        <span class="font-weight-bold">${p.fullName}</span>
                                        <span class="text-black-50">${p.email}</span>
                                        <span> </span>
                                    </div>
                                </div>
                                <div class="col-md-5 border-right">
                                    <div class="p-3 py-5">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="text-right">Profile Settings</h4>
                                        </div>
                                        <div class="row mt-2">
                                            <div class=""><label class="labels"></label>
                                                <input type="hidden" class="form-control" name="account_id" value="${sessionScope.account.account_id}" placeholder="accountid">
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Fullname</label>
                                                <input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" maxlength="255" name="fullname" placeholder="Full name" required="">
                                                <c:if test="${not empty error1}">
                                                    <div class="text-danger">${error1}</div>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <label class="labels">Gender</label>
                                                <select class="form-control" name="gender" required>
                                                    <option value="Nam" ${p.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                                    <option value="Nữ" ${p.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                                </select>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Email</label>
                                                <input type="email" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="email"  maxlength="255" placeholder="Enter Email" required="">
                                                <c:if test="${not empty error2}">
                                                    <div class="text-danger">${error2}</div>
                                                </c:if>
                                                <c:if test="${not empty error8}">
                                                    <div class="text-danger">${error8}</div>
                                                </c:if>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Phone Number</label>
                                                <input type="text" class="form-control" name="phonenumber" placeholder="Phone Number" required pattern="^0\d{9}$" title="Phone number must start with 0 and be 10 digits long.">
                                                <c:if test="${not empty error3}">
                                                    <div class="text-danger">${error3}</div>
                                                </c:if>
                                                <c:if test="${not empty error9}">
                                                    <div class="text-danger">${error9}</div>
                                                </c:if>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Date of Birth</label>
                                                <input type="date" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="dateofbirth" placeholder="Enter Date Of Birth" required="">
                                                <c:if test="${not empty error4}">
                                                    <div class="text-danger">${error4}</div>
                                                </c:if>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Address</label>
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
                                                    <input type="text" pattern="^\S.*$" class="form-control" value="${p.address}" readonly="" placeholder="detail address" required="">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Image</label>
                                                <input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" maxlength="2000" name="image"  placeholder="Image">
                                                <c:if test="${not empty error5}">
                                                    <div class="text-danger">${error5}</div>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <label class="labels">Height(Cm)</label>
                                                <input type="text" class="form-control" name="height" placeholder="height">
                                                <c:if test="${not empty error6}">
                                                    <div class="text-danger">${error6}</div>
                                                </c:if>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="labels">Weight(Kg)</label>
                                                <input type="text" class="form-control" name="weight" placeholder="weight">
                                                <c:if test="${not empty error7}">
                                                    <div class="text-danger">${error7}</div>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="mt-5 text-center">
                                            <button class="btn btn-primary profile-button" type="submit">Save Profile</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </c:when>

            <c:otherwise>
                <form action="updateprofilecustomer" method="get">
                    <c:if test="${not empty p}">
                        <c:if test="${not empty error}">
                            <div style="color: red;">
                                <c:out value="${error}"/>
                            </div>
                        </c:if>
                        <div class="container rounded bg-white mt-5 mb-5">
                            <div class="row">
                                <div class="col-md-3 border-right">
                                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                        <img class="rounded-circle mt-5" width="150px" src="${p.image}">
                                        <span class="font-weight-bold">${p.fullName}</span>
                                        <span class="text-black-50">${p.email}</span>
                                        <span></span>
                                    </div>
                                </div>
                                <div class="col-md-5 border-right">
                                    <div class="p-3 py-5">
                                        <!-- Display error messages -->
                                        <c:if test="${not empty error1}">
                                            <div class="text-danger" style="text-align: center">${error1}</div>
                                        </c:if>
                                        <c:if test="${not empty error2}">
                                            <div class="text-danger" style="text-align: center">${error2}</div>
                                        </c:if>
                                        <c:if test="${not empty error3}">
                                            <div class="text-danger" style="text-align: center">${error3}</div>
                                        </c:if>
                                        <c:if test="${not empty error4}">
                                            <div class="text-danger" style="text-align: center">${error4}</div>
                                        </c:if>
                                        <c:if test="${not empty error5}">
                                            <div class="text-danger" style="text-align: center">${error5}</div>
                                        </c:if>
                                        <c:if test="${not empty error6}">
                                            <div class="text-danger" style="text-align: center">${error6}</div>
                                        </c:if>
                                        <c:if test="${not empty error7}">
                                            <div class="text-danger" style="text-align: center">${error7}</div>
                                        </c:if>
                                        <c:if test="${not empty error8}">
                                            <div class="text-danger" style="text-align: center">${error8}</div>
                                        </c:if>
                                        <c:if test="${not empty error9}">
                                            <div class="text-danger" style="text-align: center">${error9}</div>
                                        </c:if>

                                        <!-- Display success message -->
                                        <c:if test="${not empty param.success}">
                                            <div style="text-align: center; color: green">${param.success}</div>
                                        </c:if>

                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="text-right">Profile</h4>
                                        </div>
                                        <div class="row mt-2">
                                            <div class="col-md-12">
                                                <label class="labels">Fullname</label>
                                                <input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="fullname" placeholder="Full name" value="${p.fullName}" required="">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <label class="labels">Gender</label>
                                                <select class="form-control" name="gender" required>
                                                    <option value="Nam" ${p.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                                    <option value="Nữ" ${p.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                                </select>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Email</label>
                                                <input type="email" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="email" placeholder="Enter Email" value="${p.email}" required="">
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Phone Number</label>
                                                <input type="text" class="form-control" name="phonenumber" placeholder="Phone Number" required pattern="^\d{10}$" title="Phone number must start with 0 and be 10 digits long." value="${p.phoneNumber}">
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Date of Birth</label>
                                                <input type="date" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="dateofbirth" placeholder="Enter Date Of Birth" value="${p.dateOfBirth}">
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Address</label>
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
                                                    <input type="text" pattern="^\S.*$" class="form-control" value="${p.address}" readonly="" placeholder="detail address">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <label class="labels">Height(Cm)</label>
                                                <input type="text" pattern="^\d+(\.\d+)?$" title="cannot contain any spaces/String." class="form-control" name="height" placeholder="height" value="${p.height}">
                                            </div>
                                            <div class="col-md-6">
                                                <label class="labels">Weight(Kg)</label>
                                                <input type="text" pattern="^\d+(\.\d+)?$" title="cannot contain any spaces/String." class="form-control" name="weight" value="${p.weight}" placeholder="weight">
                                            </div>
                                            <div class="col-md-6">
                                                <label class="labels"></label>
                                                <input type="hidden" class="form-control" name="account_id" value="${sessionScope.account.account_id}" placeholder="accountid">
                                            </div>
                                        </div>
                                        <div class="">
                                            <label class="labels"></label>
                                            <input type="hidden" class="form-control" name="account_id" value="${sessionScope.account.account_id}" placeholder="accountid">
                                        </div>
                                        <div class="mt-5 text-center">
                                            <button class="btn btn-primary profile-button" type="submit">Save Profile</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </form>


            </c:otherwise>
        </c:choose>
        <form action="updateprofileemployee" method="get">
            <c:if test="${not empty e}">
                <div class="container rounded bg-white mt-5 mb-5">
                    <div class="row">
                        <div class="col-md-3 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="${e.image}"><span class="font-weight-bold">${e.fullName}</span><span class="text-black-50">${e.email}</span><span> </span></div>
                        </div>
                        <div class="col-md-5 border-right">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h4 class="text-right">Profile</h4>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-12"><label class="labels">Fullname</label><input type="text" pattern="^\S.*$"  title="cannot contain any spaces." class="form-control" name="fullname" placeholder="Full name" value="${e.fullName}" required=""> </div>                         
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Gender</label>
                                        <select class="form-control" name="gender" required>
                                            <option value="Nam" ${e.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                            <option value="Nữ" ${e.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12"><label class="labels">Email</label><input type="email" pattern="^\S.*$"  title="cannot contain any spaces." class="form-control" name="email" placeholder="Enter Email" value="${e.email}" readonly=""></div>
                                    <div class="col-md-12"><label class="labels">Phone Number</label><input type="text" class="form-control" name="phonenumber" placeholder="Phone Number" required pattern="^\d{10}$" title="Phone number must start with 0 and be 10 digits long."value="${e.phoneNumber}" readonly=""></div>
                                    <div class="col-md-12"><label class="labels">Date of Birth</label><input type="date" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="dateofbirth" placeholder="Enter Date Of Birth" value="${e.dateOfBirth}" ></div>
                                        <c:if test="${not empty error}">
                                        <div style="color: red;">
                                            <c:out value="${error}"/>
                                        </div>
                                    </c:if>
                                    <div class="col-md-12"><label class="labels">Address</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="address" placeholder="Address" value="${e.address}" required=""></div>
                                </div>
                                <div class=""><label class="labels"></label><input type="hidden" class="form-control" name="account_id" value="${sessionScope.account.account_id}" placeholder="accountid"></div>
                                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit" >Save Profile</button></div>
                            </div>
                        </div>
                        <c:if test="${account.getRole() == 'PT' }">
                            <div class="col-md-4">
                                <div class="p-3 py-5">
                                    <div class="col-md-12"><label class="labels">Experience Knowledge</label><input type="text" name="experience" class="form-control" placeholder="experience" value="${e.experience}"></div> <br>
                                    <!--<div class="col-md-12"><label class="labels">Additional Details</label><input type="text" class="form-control" placeholder="additional details" value=""></div>-->
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>     
            </c:if>
        </form>
        <form action="updateprofilemanager" method="get">
            <c:if test="${not empty m}">
                <div class="container rounded bg-white mt-5 mb-5">
                    <div class="row">
                        <div class="col-md-3 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="${m.image}"><span class="font-weight-bold">${m.fullName}</span><span class="text-black-50">${m.email}</span><span> </span></div>
                        </div>
                        <div class="col-md-5 border-right">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h4 class="text-right">Profile</h4>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-12"><label class="labels">Fullname</label><input type="text" pattern="^\S.*$"  title="cannot contain any spaces." class="form-control" name="fullname" placeholder="Full name" value="${m.fullName}" required=""> </div>                         
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Gender</label>
                                        <select class="form-control" name="gender" required>
                                            <option value="Nam" ${m.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                            <option value="Nữ" ${m.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12"><label class="labels">Email</label><input type="email" pattern="^\S.*$"  title="cannot contain any spaces." class="form-control" name="email" placeholder="Enter Email" value="${m.email}" readonly=""></div>
                                    <div class="col-md-12"><label class="labels">Phone Number</label><input type="text" class="form-control" name="phonenumber" placeholder="Phone Number" required pattern="^\d{10}$" title="Phone number must start with 0 and be 10 digits long." value="${m.phoneNumber}" readonly=""></div>
                                    <div class="col-md-12"><label class="labels">Date of Birth</label><input type="date" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="dateofbirth" placeholder="Enter Date Of Birth" value="${m.dateOfBirth}" ></div>
                                        <c:if test="${not empty error}">
                                        <div style="color: red;">
                                            <c:out value="${error}"/>
                                        </div>
                                    </c:if>
                                    <div class="col-md-12"><label class="labels">Address</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="address" placeholder="Address" value="${m.address}" required=""></div>
                                </div>
                                <div class=""><label class="labels"></label><input type="hidden" class="form-control" name="account_id" value="${sessionScope.account.account_id}" placeholder="accountid"></div>
                                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit" >Save Profile</button></div>
                            </div>
                        </div>

                    </div>
                </div>   
            </c:if>
        </form>
        <form action="updateprofiledirector" method="get">
            <c:if test="${not empty d}">
                <div class="container rounded bg-white mt-5 mb-5">
                    <div class="row">
                        <div class="col-md-3 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="${d.image}"><span class="font-weight-bold">${d.fullName}</span><span class="text-black-50">${d.email}</span><span> </span></div>
                        </div>
                        <div class="col-md-5 border-right">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h4 class="text-right">Profile</h4>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-12"><label class="labels">Fullname</label><input type="text" pattern="^\S.*$"  title="cannot contain any spaces." class="form-control" name="fullname" placeholder="Full name" value="${d.fullName}" required=""> </div>                         
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Gender</label>
                                        <select class="form-control" name="gender" required>
                                            <option value="Nam" ${d.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                            <option value="Nữ" ${d.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12"><label class="labels">Email</label><input type="email" pattern="^\S.*$"  title="cannot contain any spaces." class="form-control" name="email" placeholder="Enter Email" value="${d.email}" required=""></div>
                                    <div class="col-md-12"><label class="labels">Phone Number</label><input type="text" class="form-control" name="phonenumber" placeholder="Phone Number" required pattern="^\d{10}$" title="Phone number must start with 0 and be 10 digits long."value="${d.phoneNumber}" ></div>
                                    <div class="col-md-12"><label class="labels">Date of Birth</label><input type="date" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="dateofbirth" placeholder="Enter Date Of Birth" value="${d.dateOfBirth}" ></div>
                                        <c:if test="${not empty error}">
                                        <div style="color: red;">
                                            <c:out value="${error}"/>
                                        </div>
                                    </c:if>
                                    <div class="col-md-12"><label class="labels">Address</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="address" placeholder="Address" value="${d.address}" required=""></div>
                                </div>
                                <div class=""><label class="labels"></label><input type="hidden" class="form-control" name="account_id" value="${sessionScope.account.account_id}" placeholder="accountid"></div>
                                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit" >Save Profile</button></div>
                            </div>
                        </div>
                    </div>
                </div>       
            </c:if>
        </form>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script src="js/profile.js"></script>
<script src="js/profile1.js"></script>
<script src="js/address.js"></script>

</body>
</html>
