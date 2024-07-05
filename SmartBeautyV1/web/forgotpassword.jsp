<%-- 
    Document   : forgotpassword
    Created on : Jun 6, 2024, 9:32:20 AM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="container-fluid">
            <div class="form-panel">
                <form action="forgotpassword" method="post">
                    <h2>Forgot Password</h2>
                    <c:if test="${requestScope.check == null}"></c:if>
                    <c:if test="${requestScope.check != null}">
                        <c:if test="${requestScope.check == 'true' && !(requestScope.message == 'Xin lỗi, mã đặt lại không chính xác')}">
                            <p style="color: green">${requestScope.message}</p>
                        </c:if>
                        <c:if test="${requestScope.check == 'false'}">
                            <p style="color: red">${requestScope.message}</p>
                        </c:if>
                        <c:if test="${requestScope.check == 'true' && requestScope.message == 'Xin lỗi, mã đặt lại không chính xác'}">
                            <p style="color: red">${requestScope.message}</p>
                        </c:if>
                    </c:if>
                    <c:if test="${requestScope.check == null || requestScope.check == 'false'}">
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required value="${param.email}">
                        </div>
                    </c:if>
                    <c:if test="${requestScope.check == null || requestScope.check == 'false'}">
                        <button type="submit" class="btn btn-primary">Send to Mail</button>
                    </c:if>
                </form>
                <c:if test="${requestScope.check != null && requestScope.check == 'true'}">
                    <form action="confirmresetcode" method="post">
                        <input name="email" value="${requestScope.email}" type="hidden">
                        <div class="form-group">
                            <div class="fxt-transformY-50 fxt-transition-delay-1">
                                <input type="text" class="form-control" name="resetcode" placeholder="xxxxxx" required="required" value="${requestScope.code}">
                                <i class="flaticon-envelope"></i>
                            </div>
                        </div>
                        <c:if test="${requestScope.check != null && requestScope.check == 'true'}">
                            <div class="form-group">
                                <div class="fxt-transformY-50 fxt-transition-delay-2">
                                    <button type="submit" class="fxt-btn-fill">Xác nhận mã đặt lại</button>
                                </div>
                            </div>
                        </c:if>
                    </form>
                </c:if>
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
