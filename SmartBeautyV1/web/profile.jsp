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
        <jsp:include page="include/home.jsp"></jsp:include>
            <!-- Elements -->
            <form action="updateprofilecustomer" method="get">
            <c:if test="${not empty p}">
                <div class="container rounded bg-white mt-5 mb-5">
                    <div class="row">
                        <div class="col-md-3 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="${p.image}"><span class="font-weight-bold">${p.fullName}</span><span class="text-black-50">${p.email}</span><span> </span></div>
                        </div>
                        <div class="col-md-5 border-right">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h4 class="text-right">Profile Settings</h4>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-12"><label class="labels">Fullname</label><input type="text" pattern="^\S.*$"  title="cannot contain any spaces." class="form-control" name="fullname" placeholder="Full name" value="${p.fullName}" required=""> </div>                         
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label class="labels">Gender</label>
                                        <select class="form-control" name="gender" required>
                                            <option value="Nam" ${p.gender == 'Nam' ? 'selected' : ''}>Nam</option>
                                            <option value="Nữ" ${p.gender == 'Nữ' ? 'selected' : ''}>Nữ</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12"><label class="labels">Email</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="email" placeholder="Enter Email" value="${p.email}" required=""></div>
                                    <div class="col-md-12"><label class="labels">Phone Number</label><input type="text" pattern="^\S.*$" class="form-control" name="phonenumber" placeholder="Phone Number" value="${p.phoneNumber}" required=""></div>
                                    <div class="col-md-12"><label class="labels">Date of Birth</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="dateofbirth" placeholder="Enter Date Of Birth" value="${p.dateOfBirth}" readonly=""></div>
                                    <div class="col-md-12"><label class="labels">Address</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="address" placeholder="Address" value="${p.address}" required=""></div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-6"><label class="labels">Height</label><input type="text" pattern="^\d+(\.\d+)?$" title="cannot contain any spaces/String." class="form-control" name="height" placeholder="height" value="${p.height}"></div>
                                    <div class="col-md-6"><label class="labels">Weight</label><input type="text" pattern="^\d+(\.\d+)?$" title="cannot contain any spaces/String." class="form-control" name="weight" value="${p.weight}" placeholder="weight"></div>
                                    <div class="col-md-6"><label class="labels"></label><input type="hidden" class="form-control" name="account_id" value="${sessionScope.account.account_id}" placeholder="accountid"></div>
                                </div>
                                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit" >Save Profile</button></div>
                            </div>
                        </div>

                    </div>
                </div>    
            </c:if>
        </form>
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
                                    <h4 class="text-right">Profile Settings</h4>
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
                                    <div class="col-md-12"><label class="labels">Email</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="email" placeholder="Enter Email" value="${e.email}" readonly=""></div>
                                    <div class="col-md-12"><label class="labels">Phone Number</label><input type="text" pattern="^\S.*$" class="form-control" name="phonenumber" placeholder="Phone Number" value="${e.phoneNumber}" required=""></div>
                                    <div class="col-md-12"><label class="labels">Date of Birth</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="dateofbirth" placeholder="Enter Date Of Birth" value="${e.dateOfBirth}" readonly=""></div>
                                    <div class="col-md-12"><label class="labels">Address</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="address" placeholder="Address" value="${e.address}" required=""></div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-6"><label class="labels"></label><input type="hidden" class="form-control" name="account_id" value="${sessionScope.account.account_id}" placeholder="accountid"></div>
                                </div>
                                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit" >Save Profile</button></div>
                            </div>
                        </div>
                        <c:if test="${account.getRole() == 'PT' }">
                            <div class="col-md-4">
                                <div class="p-3 py-5">
                                    <div class="col-md-12"><label class="labels">Experience Knowledge</label><input type="text" class="form-control" placeholder="experience" value="${e.experience}"></div> <br>
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
                                    <h4 class="text-right">Profile Settings</h4>
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
                                    <div class="col-md-12"><label class="labels">Email</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="email" placeholder="Enter Email" value="${m.email}" required=""></div>
                                    <div class="col-md-12"><label class="labels">Phone Number</label><input type="text" pattern="^\S.*$" class="form-control" name="phonenumber" placeholder="Phone Number" value="${m.phoneNumber}" required=""></div>
                                    <div class="col-md-12"><label class="labels">Date of Birth</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="dateofbirth" placeholder="Enter Date Of Birth" value="${m.dateOfBirth}" readonly=""></div>
                                    <div class="col-md-12"><label class="labels">Address</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="address" placeholder="Address" value="${m.address}" required=""></div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-6"><label class="labels"></label><input type="hidden" class="form-control" name="account_id" value="${sessionScope.account.account_id}" placeholder="accountid"></div>
                                </div>
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
                                    <h4 class="text-right">Profile Settings</h4>
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
                                    <div class="col-md-12"><label class="labels">Email</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="email" placeholder="Enter Email" value="${d.email}" required=""></div>
                                    <div class="col-md-12"><label class="labels">Phone Number</label><input type="text" pattern="^\S.*$" class="form-control" name="phonenumber" placeholder="Phone Number" value="${d.phoneNumber}" required=""></div>
                                    <div class="col-md-12"><label class="labels">Date of Birth</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="dateofbirth" placeholder="Enter Date Of Birth" value="${d.dateOfBirth}" readonly=""></div>
                                    <div class="col-md-12"><label class="labels">Address</label><input type="text" pattern="^\S.*$" title="cannot contain any spaces." class="form-control" name="address" placeholder="Address" value="${d.address}" required=""></div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-6"><label class="labels"></label><input type="hidden" class="form-control" name="account_id" value="${sessionScope.account.account_id}" placeholder="accountid"></div>
                                </div>
                                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit" >Save Profile</button></div>
                            </div>
                        </div>
                    </div>
                </div>       
            </c:if>
        </form>
    </div>
</div>
<script src="js/profile.js"></script>
<script src="js/profile1.js"></script>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
