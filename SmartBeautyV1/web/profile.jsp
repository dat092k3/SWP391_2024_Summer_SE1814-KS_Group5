<%-- 
    Document   : profile
    Created on : Jun 1, 2024, 8:21:46 PM
    Author     : admin
--%>

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
            <form action="action" method="">
                <div class="container rounded bg-white mt-5 mb-5">
                    <div class="row">
                        <div class="col-md-3 border-right">
                            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">Edogaru</span><span class="text-black-50">edogaru@mail.com.my</span><span> </span></div>
                        </div>
                        <div class="col-md-5 border-right">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h4 class="text-right">Profile Settings</h4>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-12"><label class="labels">Fullname</label><input type="text" class="form-control" placeholder="Full name" value=""></div>                         
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12"><label class="labels">Gender</label><input type="text" class="form-control" placeholder="Choose Gender" value="" required=""></div>
                                    <div class="col-md-12"><label class="labels">Email</label><input type="text" class="form-control" placeholder="Enter Email" value="" required=""></div>
                                    <div class="col-md-12"><label class="labels">Phone Number</label><input type="text" class="form-control" placeholder="Phone Number" value="" required=""></div>                            <div class="col-md-12"><label class="labels">Date Of Birth</label><input type="text" class="form-control" placeholder="Enter Date Of Birth" value=""></div>
                                    <div class="col-md-12"><label class="labels">Address</label><input type="text" class="form-control" placeholder="Address" value="" required=""></div>
                                </div>
                                <!--                        <div class="row mt-3">
                                                            <div class="col-md-6"><label class="labels">Country</label><input type="text" class="form-control" placeholder="country" value=""></div>
                                                            <div class="col-md-6"><label class="labels">State/Region</label><input type="text" class="form-control" value="" placeholder="state"></div>
                                                        </div>-->
                                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit" >Save Profile</button></div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="p-3 py-5">
                                <div class="d-flex justify-content-between align-items-center experience"><span>Edit Experience</span><span class="border px-3 p-1 add-experience"><i class="fa fa-plus"></i>&nbsp;Experience</span></div><br>
                                <div class="col-md-12"><label class="labels">Experience in Designing</label><input type="text" class="form-control" placeholder="experience" value=""></div> <br>
                                <div class="col-md-12"><label class="labels">Additional Details</label><input type="text" class="form-control" placeholder="additional details" value=""></div>
                            </div>
                        </div>
                    </div>
                </div>    
            </form>
        </div>
    </div>
    <script src="js/profile.js"></script>
    <script src="js/profile1.js"></script>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
