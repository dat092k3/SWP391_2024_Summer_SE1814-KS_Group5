<%-- 
    Document   : editaccountemployee
    Created on : Jun 25, 2024, 12:15:14 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body{
                font-family: 'Poppins', sans-serif;
                background-color: aliceblue;
            }

            .wrapper{
                padding: 30px 50px;
                border: 1px solid #ddd;
                border-radius: 15px;
                margin: 10px auto;
                max-width: 600px;
            }
            h4{
                letter-spacing: -1px;
                font-weight: 400;
            }
            .img{
                width: 70px;
                height: 70px;
                border-radius: 6px;
                object-fit: cover;
            }
            #img-section p,#deactivate p{
                font-size: 12px;
                color: #777;
                margin-bottom: 10px;
                text-align: justify;
            }
            #img-section b,#img-section button,#deactivate b{
                font-size: 14px;
            }

            label{
                margin-bottom: 0;
                font-size: 14px;
                font-weight: 500;
                color: #777;
                padding-left: 3px;
            }

            .form-control{
                border-radius: 10px;
            }

            input[placeholder]{
                font-weight: 500;
            }
            .form-control:focus{
                box-shadow: none;
                border: 1.5px solid #0779e4;
            }
            select{
                display: block;
                width: 100%;
                border: 1px solid #ddd;
                border-radius: 10px;
                height: 40px;
                padding: 5px 10px;
                /* -webkit-appearance: none; */
            }

            select:focus{
                outline: none;
            }
            .button{
                background-color: #fff;
                color: #0779e4;
            }
            .button:hover{
                background-color: #0779e4;
                color: #fff;
            }
            .btn-primary{
                background-color: #0779e4;
            }
            .danger{
                background-color: #fff;
                color: #e20404;
                border: 1px solid #ddd;
            }
            .danger:hover{
                background-color: #e20404;
                color: #fff;
            }
            @media(max-width:576px){
                .wrapper{
                    padding: 25px 20px;
                }
                #deactivate{
                    line-height: 18px;
                }
            }
        </style>
    </head>
    <body> 

        <div class="wrapper bg-white mt-sm-5">
            <h4 class="pb-4 border-bottom">Account Employee settings</h4>
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
                            <input type="text" class="bg-light form-control"  value="${accountbyid.username}" name="username">
                        </div>
                        <div class="col-md-6 pt-md-0 pt-3">
                            <label>PassWord</label>
                            <input type="text" class="bg-light form-control"  value="${accountbyid.password}" name="password">
                        </div>
                    </div>
                    <div class="row py-2">
                        <div class="col-md-6">
                            <label>Email</label>
                            <input type="email" class="bg-light form-control"  value="${accountbyid.email}" name="email">
                        </div>
                        <div class="col-md-6 pt-md-0 pt-3">
                            <label>Phone Number</label>
                            <input type="text" class="bg-light form-control"  value="${accountbyid.phoneNumber}" name="phonenumber">
                        </div>
                    </div>
                    <div class="row py-2">
                        <div class="col-md-6">
                            <label>Role</label>
                            <select class="form-control" name="role"> 
                                <option value="PT" ${accountbyid.role == 'PT' ? 'selected' : ''} >PT</option>
                                <option value="Takecare" ${accountbyid.role == 'Takecare' ? 'selected' : ''}>Takecare</option>
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
