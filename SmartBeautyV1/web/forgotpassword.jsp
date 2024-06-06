<%-- 
    Document   : forgotpassword
    Created on : Jun 6, 2024, 9:32:20 AM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot PassWord</title>
        <link rel="icon" href="images/logo1.png"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/forgotpassword.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="form-panel">
                <form action="#" method="post">
                    <h2>Forgot Password</h2>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Send to Mail</button>
                </form>
            </div>
            <div class="info-panel">
                <h2>Hello, Friend!</h2>
                <p>Choose if you want</p>
                <a href="signup-signin.jsp">Login/Signup</a>
                <a href="index.jsp">Home</a>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
