<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <title>Blog</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="SportFIT template project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.2/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/blog.css">
        <link rel="stylesheet" type="text/css" href="styles/blog_responsive.css">
        <style>
            /* Additional CSS for aligning the form to the right */
            .search-form-container {
                display: flex;
                justify-content: flex-end;
            }

            /* Floating Button Styles */
            .floating-btn {
                position: fixed;
                bottom: 20px;
                right: 20px;
                background-color: #f98c00; /* Background color of the button */
                color: white;
                border: none;
                border-radius: 50%; /* Make the button circular */
                width: 45px; /* Adjust width as needed */
                height: 45px; /* Adjust height as needed */
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 15px 15px;
                font-size: 20px; /* Font size of the plus icon */
                cursor: pointer;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Add a shadow effect */
                padding: 0; /* Remove default padding */
                transition: transform 0.2s ease; /* Add transition for smooth effect */
            }

            .floating-btn .fa-plus {
                margin: 0; /* Ensure there is no extra margin around the icon */
            }

            .floating-btn:hover {
                transform: scale(1.1); /* Enlarge the button on hover */
            }

            /* button */
            .button-post {
                background-color: #f98c00;
                border-color: #ff4757;
                font-weight: bold;
                padding: 10px 20px;
                border-radius: 20px;
                color: white;
                font-size: 16px;
                text-decoration: none;
            }
            .button-close {
                color:#fff;
                background-color:#6c757d;
                border-color:#6c757d
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
                    <div class="search-form-container">
                        <form action="search" method="get" class="form-inline my-2 my-lg-0">
                            <div class="input-group input-group-sm">
                                <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small"
                                   aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="section_title_container">
                                <div class="section_subtitle">welcome to sportfit</div>
                                <div class="section_title">The Blog</div>
                            </div>
                        </div>
                    </div>
                    <div class="row blog_row">

                        <!-- Blog Post -->
                        <c:forEach items="${requestScope.list}" var="blog">
                            <div class="col-xl-4 col-md-6 blog_col">
                                <div class="blog_post">
                                    <div class="blog_post_image"><img src="${blog.image}" alt="" width="100%"></div>
                                    <div class="blog_post_title"><a href="blogdetails?id=${blog.blog_id}">${blog.blog_name}</a>
                                    </div>
                                    <div class="blog_post_date"></a>${blog.description}</div>
                                    <div class="blog_post_link"><a href="blogdetails?id=${blog.blog_id}">Read More</a></div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="button blog_button ml-auto mr-auto"><a href="#">Load More</a></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Floating Button -->
            <c:if test="${sessionScope.role == 'EMP'}">
                <button class="floating-btn" data-toggle="modal" data-target="#myModal">
                    <i class="fa fa-plus"></i>
                </button>
            </c:if>

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form id="blogForm" action="addblog" method="get">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add New Blog</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label for="blog_name">Blog Name</label>
                                    <input type="text" class="form-control" id="blog_name" name="blog_name" required="">
                                </div>
                                <div class="form-group">
                                    <label for="image">Image URL</label>
                                    <input type="text" class="form-control" id="image" name="image" required="">
                                </div>
                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <input type="text" class="form-control" id="description" name="description" required="">
                                </div>
                                <div class="form-group">
                                    <label for="content">Content</label>
                                    <textarea class="form-control" id="content" name="content" required=""></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div>
                                    <c:if test="${err != null}">
                                        <p style="color: #5cb85c;">
                                            ${err}
                                        </p>
                                    </c:if>
                                </div>
                                <button type="button" class="btn button-close" data-dismiss="modal">Close</button>
                                <button type="button submit" class="btn button-post" >Post blog</button>
                            </div>
                        </form>
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
