<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <title>Blog Details</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="SportFIT template project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.2/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/blog.css">
        <link rel="stylesheet" type="text/css" href="styles/blog_responsive.css">
        <style>
            .blog_detail_container {
                display: flex;
                flex-wrap: wrap;
            }
            .blog_image {
                flex: 1 0 25%; /* chiếm 25% diện tích, tức 1 ô */
                max-width: 25%;
                box-sizing: border-box;
                padding: 10px;
            }
            .blog_content {
                flex: 3 0 75%; /* chiếm 75% diện tích, tức 3 ô */
                max-width: 75%;
                box-sizing: border-box;
                padding: 10px;
            }
        </style>
    </head>
    <body>

        <div class="super_container">
            <!-- Header -->
            <jsp:include page="include/header.jsp"></jsp:include>
                <!-- Hamburger -->
            <jsp:include page="include/hamburger.jsp"></jsp:include>
                <!-- Menu -->
            <jsp:include page="include/menu.jsp"></jsp:include>
                <!-- Home -->
            <jsp:include page="include/home.jsp"></jsp:include>

                <!-- Blog -->

                <div class="blog">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="section_title_container">
                                    <div class="section_subtitle">welcome to sportfit</div>
                                    <div class="section_title">The Blog Details</div>
                                </div>
                            </div>
                        </div>
                        <div class="row blog_row blog_detail_container">

                            <!-- Blog Post -->
                            <div class="col-xl-6 col-md-6 blog_col blog_image">
                                <img src="${blog.image}" alt="Blog Image" class="img-fluid">
                        </div>
                        <div class="col-xl-6 col-md-6 blog_col blog_content">
                            <h1>${blog.blog_name}</h1>
                            <p>${blog.description}</p>
                            <p>${blog.content}</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="button blog_button ml-auto mr-auto"><a href="search">Blogs/Search</a></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <jsp:include page="include/footer.jsp"></jsp:include>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap-4.1.2/popper.js"></script>
        <script src="styles/bootstrap-4.1.2/bootstrap.min.js"></script>
        <script src="plugins/greensock/TweenMax.min.js"></script>
        <script src="plugins/greensock/TimelineMax.min.js"></script>
        <script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="plugins/greensock/animation.gsap.min.js"></script>
        <script src="plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="js/blog.js"></script>
    </body>
</html>