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
        <style>
            body {
                background-image: url('https://zshop.vn/blogs/wp-content/uploads/2022/08/ezgif.com-gif-maker-15-1.png');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="signup" method="post">
                    <h1>Create Account</h1>
                    <span>or use your email for registration</span>
                    <input name="username" type="text" placeholder="Username" value="${param.username}" required=""/>
                    <span style="color: red">${err_username}</span>
                    <input name="password" type="password" placeholder="Password" value="${param.password}" required=""/>
                    <span style="color: red">${re_password}</span>
                    <input name="repassword" type="password" placeholder="Confirm Password" value="${param.repassword}" required=""/>
                    <span style="color: red">${re_password}</span>
                    <input name="email" type="text" placeholder="Email" value="${param.email}" required="" />
                    <span style="color: red">${err_email}</span>
                    <input name="phonenumber" type="text" placeholder="Phone" value="${param.phonenumber}" required="">
                    <span style="color: red">${err_phone}</span>
                    <button>Sign Up</button>
                    <p style="color:red; font-weight: bold">${messen}</p>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1>Sign in</h1>
                    <span>or use your account</span>
                    <input name="username" type="text" placeholder="Username" required="" value="${cookie.cusername != null ? cookie.cusername.value : ''}" />
                    <input name="password" type="password" placeholder="Password" required="" value="${cookie.cpassword != null ? cookie.cpassword.value : ''}" />
                    <div class="form-group form-check">
                        <input name="remember" value="1" type="checkbox"class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Remember me</label>
                    </div>
                    <a href="forgotpassword.jsp">Forgot your password?</a>
                    <button type="submit">Sign In</button>
                    <c:if test="${not empty successfully}">
                        <div class="alert" style="color: green">${successfully}</div>
                    </c:if>
                    <p style="color:red; font-weight: bold">${error_login}</p>
                    <p style="color:greenyellow; font-weight: bold"> ${messen1}</p>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p> 
                        <button class="ghost" id="signIn">Sign In</button><br>
                        <button class="ghost" onclick="location.href = 'index.jsp'">Home</button>

                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Sign Up</button><br>
                        <button class="ghost" onclick="location.href = 'index.jsp'">Home</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/signup-signin.js"></script>
    </body>
</html>
