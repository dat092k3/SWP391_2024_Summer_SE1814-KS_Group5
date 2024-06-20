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
        <script>
            function deleteBlog(blogId){
                    if (confirm("Bạn có chắc muốn xóa blog này không?")) {
                        // Gửi yêu cầu xóa đến servlet thông qua XMLHttpRequest
                        var xhttp = new XMLHttpRequest();
                        xhttp.onreadystatechange = function () {
                            if (this.readyState == 4 && this.status == 200) {
                                // Xử lý kết quả từ servlet
                                var response = this.responseText;
                                if (response === "true") {
                                    alert("Blog đã được xóa thành công.");
                                    // Chuyển hướng về trang search (ví dụ)
                                    window.location.href = "search?txt=";
                                } else {
                                    alert("Không thể xóa blog này. Vui lòng thử lại sau.");
                                }
                            }
                        };
                        xhttp.open("GET", "deleteblog?blog_id=" + blogId, true);
                        xhttp.send();
                    }
                }
        </script>

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
                            <button class="btn button-post" data-toggle="modal" data-target="#Infor">
                                <p>Blogs same author</p>
                            </button>
                            <br>
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

            <!-- Floating Button -->
            <c:if test="${sessionScope.role == 'Takecare'}">
                <button class="floating-btn floating-btn-edit" data-toggle="modal" data-target="#Edit">
                    <i class="fa fa-pencil"></i>
                </button>
                <br>
                <button class="floating-btn floating-btn-delete" onclick="deleteBlog(${blog.blog_id})">
                    <i class="fa fa-trash"></i>
                </button>
            </c:if>

            <div class="modal fade" id="Edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form id="blogForm" action="editblog" method="get">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Edit Blog</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="number" class="form-control" id="blog_id" name="blog_id" type="hidden" value="${blog.blog_id}">
                                </div>
                                <div class="form-group">
                                    <label for="blog_name">Blog Name</label>
                                    <input type="text" class="form-control" id="blog_name" name="blog_name" value="${blog.blog_name}">
                                </div>
                                <div class="form-group">
                                    <label for="image">Image URL</label>
                                    <input type="text" class="form-control" id="image" name="image" value="${blog.image}">
                                </div>
                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <input type="text" class="form-control" id="description" name="description" value="${blog.description}">
                                </div>
                                <div class="form-group">
                                    <label for="content">Content</label>
                                    <textarea class="form-control" id="content" name="content">${blog.content}</textarea>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" name="account_id" type="hidden" required="" value="${sessionScope.account.account_id}"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn button-close" data-dismiss="modal">Close</button>
                                <button type="button submit" class="btn button-post" >Save blog</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- HTML -->
            <div class="modal fade" id="Infor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Blog Same Author</h5>
                        </div>
                        <div class="modal-body">
                            <table id="Blog" class="table table-bordered table-responsive">
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Title</th>
                                        <th>Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.listb}" var="b">
                                        <tr>
                                            <td>
                                                <div class="blog_post_image">
                                                    <img src="${b.image}" alt="" class="blog-image">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="blog_post_title">
                                                    <a href="blogdetails?id=${b.blog_id}">${b.blog_name}</a>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="blog_post_date">${b.description}</div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn button-close" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- CSS -->
            <style>
                .modal-dialog {
                    max-width: 800px;
                    margin: 1.75rem auto;
                }

                .table-responsive {
                    width: 100%;
                    margin-bottom: 1rem;
                    overflow-x: auto;
                    -webkit-overflow-scrolling: touch;
                    -ms-overflow-style: -ms-autohiding-scrollbar;
                }

                .table {
                    width: 100%;
                    margin-bottom: 1rem;
                    background-color: transparent;
                }

                .table th, .table td {
                    padding: 1.5rem;
                    vertical-align: top;
                    border-top: 1px solid #dee2e6;
                }

                .table thead th {
                    vertical-align: bottom;
                    border-bottom: 2px solid #dee2e6;
                }

                .table tbody + tbody {
                    border-top: 2px solid #dee2e6;
                }

                .blog-image {
                    width: 100px;
                    height: auto;
                }

                .blog_post_title a {
                    color: #007bff;
                    text-decoration: none;
                }

                .blog_post_title a:hover {
                    text-decoration: underline;
                }
            </style>


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
