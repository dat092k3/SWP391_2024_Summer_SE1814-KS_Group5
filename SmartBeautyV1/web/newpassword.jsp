<%-- 
    Document   : newpassword
    Created on : Jun 6, 2024, 11:14:54 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reset Password</title>
        <link rel="icon" href="images/logo1.png"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/newpassword.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="form-panel">
                <form action="confirmpass" method="post">
                    <h2>Reset Password</h2>
                    <input name="userName" value="${requestScope.uName}" type="hidden">
                    <div class="form-group">
                        <label for="newPassword">New Password</label>
                        <input type="password" class="form-control" name="password" placeholder="${requestScope.check == null ? 'Password' : 'New password'}" required>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" class="form-control" name="cfpassword" placeholder="${requestScope.check == null ? 'Confirm Password' : 'Confirm new password'}" required>
                    </div>
                    <button id="buttonsubmit" type="submit" onclick="checkPass()" class="btn btn-primary">Update Password</button>
                    <c:if test="${not empty error}">
                        <div class="alert" style="color: red">${error}</div>
                    </c:if>
                </form>
            </div>
            <div class="info-panel">
                <h2>Welcome To Reset!</h2>
                <p>Secure your account by updating your password.</p>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
