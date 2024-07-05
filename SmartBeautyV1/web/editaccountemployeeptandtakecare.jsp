<%-- 
    Document   : editaccountemployeeptandtakecare
    Created on : Jul 4, 2024, 2:52:36 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="styles/editaccountemployee.css" rel="stylesheet">
    </head>
    <body> 

        <div class="wrapper bg-white mt-sm-5">
            <h4 class="pb-4 border-bottom">Account Employee settings</h4>
             <span style="color: red">${error4}</span>
            <div class="d-flex align-items-start py-3 border-bottom">
                <img src="https://images.pexels.com/photos/1037995/pexels-photo-1037995.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                     class="img" alt="">
                <div class="pl-sm-4 pl-2" id="img-section">
                    <b>Profile of ${accountbyid.username}</b>
                </div>
            </div>
            <form action="editaccount" method="get">
                <div class="py-2">
                    <div class="row py-2">
                        <div class="col-md-12 pt-md-0 pt-3">
                            <label>AccountId</label>
                            <input type="text" class="bg-light form-control"  value="${accountbyid.account_id}" name="account_id" readonly="">
                        </div>
                    </div>
                    <div class="row py-2">
                        <div class="col-md-6">
                            <label>UserName</label>
                            <input type="text" class="bg-light form-control"  value="${accountbyid.username}" name="username" minlength="3" maxlength="255"  pattern="^\S.*$"  title="cannot contain any spaces." required="">
                            <span style="color: red">${error1}</span>
                        </div>
                        <div class="col-md-6 pt-md-0 pt-3">
                            <label>PassWord</label>
                            <input type="text" class="bg-light form-control"  value="${accountbyid.password}" name="password" minlength="3" maxlength="50"   pattern="^\S.*$"  title="cannot contain any spaces." required="">
                        </div>
                    </div>
                    <div class="row py-2">
                        <div class="col-md-6">
                            <label>Email</label>
                            <input type="email" class="bg-light form-control"  value="${accountbyid.email}" name="email" maxlength="255" pattern="^\S.*$"  title="cannot contain any spaces." required="">
                             <span style="color: red">${error2}</span>
                        </div>
                        <div class="col-md-6 pt-md-0 pt-3">
                            <label>Phone Number</label>
                            <input type="text" class="bg-light form-control"  value="${accountbyid.phoneNumber}" name="phonenumber" pattern="^\S.*$"  title="cannot contain any spaces." required="">
                             <span style="color: red">${error3}</span>
                        </div>
                    </div>
                    <div class="row py-2">
                        <div class="col-md-6">
                            <label>Role</label>
                            <select class="form-control" name="role"> 
                                <option value="Takecare" ${accountbyid.role == 'Takecare' ? 'selected' : ''} >Takecare</option>
                                 <option value="PT" ${accountbyid.role == 'PT' ? 'selected' : ''} >PT</option>
                            </select>
                        </div>
                        <div class="col-md-6 pt-md-0 pt-3" id="lang">
                            <label>Status</label>
                            <div class="arrow">
                                <select name="status" class="bg-light">
                                    <option value="1" ${accountbyid.status == 'Active' ? 'selected' : ''}>Active</option>
                                    <option value="0" ${accountbyid.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="py-3 pb-4 border-bottom">
                        <button type="submit" class="btn btn-primary mr-3">Save Changes</button>
                    </div>
                    <div class="d-sm-flex align-items-center pt-3" id="deactivate">
                        <div>
                            <b>Account of  Employee</b>
                            <p>Details about Account</p>
                        </div>
                    </div>
                    <div class="pt-3">
                        <button class="btn border button"><a href="viewaccount">Back</a></button>
                    </div>
                </div>
            </form>
        </div>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
