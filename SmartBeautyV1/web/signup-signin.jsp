<%-- 
    Document   : signup-signin
    Created on : Jun 1, 2024, 7:39:03 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Signup-Signin</title>
        <link rel="stylesheet" type="text/css" href="styles/signup-signin.css">
    </head>
    <body>

        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="register" method="post">
                    <h1>Create Account</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <span>or use your email for registration</span>
                    <input name="username" type="text" placeholder="Username" required=""/>
                    <input name="email" type="email" placeholder="Email" required="" />
                    <input name="password" type="password" placeholder="Password"  required=""/>
                    <input name="repassword" type="password" placeholder="Confirm Password"  required=""/>
                    <input name="phone" type="text" placeholder="Phone" required="">
                    <button>Sign Up</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1>Sign in</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <span>or use your account</span>
                    <input name="username" type="text" placeholder="Username" required="" value="${cookie.cusername != null ? cookie.cusername.value : ''}" />
                    <input name="password" type="password" placeholder="Password" required="" value="${cookie.cpassword != null ? cookie.cpassword.value : ''}" />
                           <div class="form-group form-check">
                    <input name="remember" value="1" type="checkbox"class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Remember me</label>
            </div>
            <a href="#">Forgot your password?</a>
            <button type="submit">Sign In</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Welcome Back!</h1>
                <p>To keep connected with us please login with your personal info</p> 
                <button class="ghost" id="signIn">Sign In</button>  
                <div class="back-home-button" style="border: 2px solid #ffffff; padding: 10px; display: inline-block; border-radius: 5px; margin-top: 5px">
                    <a href="index.jsp" class="btn btn-primary" style="color: #ffffff">Home</a>
                </div>

            </div>
            <div class="overlay-panel overlay-right">
                <h1>Hello, Friend!</h1>
                <p>Enter your personal details and start journey with us</p>
                <button class="ghost" id="signUp">Sign Up</button>
                <div class="back-home-button" style="border: 2px solid #ffffff; padding: 10px; display: inline-block; border-radius: 5px; margin-top: 5px;">
                    <a href="index.jsp" class="btn btn-primary" style="color: #ffffff">Home</a>
                </div>

            </div>
        </div>
    </div>
</div>
<script src="js/signup-signin.js"></script>
</body>
</html>
