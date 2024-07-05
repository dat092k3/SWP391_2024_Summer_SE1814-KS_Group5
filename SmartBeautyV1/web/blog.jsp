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
                                    <div class="blog_post_date">${blog.post_at}</div>
                                    <div class="blog_post_title"><a href="blogdetails?id=${blog.blog_id}&account_id=${sessionScope.account_id}">${blog.blog_name}</a></div>
                                    <div class="blog_post_date">${blog.description}</div>
                                    <div class="blog_post_link">
                                        <a href="blogdetails?id=${blog.blog_id}&account_id=${sessionScope.account_id}">Read More</a>
                                    </div>
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
            <c:if test="${sessionScope.role == 'Takecare'}">
                <button class="floating-btn" data-toggle="modal" data-target="#myModal">
                    <i class="fa fa-plus"></i>
                </button>
            </c:if>

            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="blogForm" action="addblog" method="get" onsubmit="return validateForm()">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add New Blog</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="blog_name">Blog Name</label>
                                    <input type="text" class="form-control" id="blog_name" name="blog_name" required maxlength="255" minlength="1">
                                    <div class="invalid-feedback">Please enter a valid blog name.</div>
                                </div>
                                <div class="form-group">
                                    <label for="image">Image URL</label>
                                    <input type="text" class="form-control" id="image" name="image" required>
                                    <div class="invalid-feedback">Please enter a valid image URL.</div>
                                </div>
                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <input type="text" class="form-control" id="description" name="description" required minlength="1" maxlength="255">
                                    <div class="invalid-feedback">Please enter a valid description.</div>
                                </div>
                                <div class="form-group">
                                    <label for="content">Content</label>
                                    <textarea class="form-control" id="content" name="content" required minlength="1"></textarea>
                                    <div class="invalid-feedback">Please enter valid content.</div>
                                </div>
                                <input class="form-control" name="account_id" type="hidden" value="${sessionScope.account.account_id}" required>
                            </div>
                            <div class="modal-footer">
                                <div>
                                    <c:if test="${err != null}">
                                        <p style="color: #5cb85c;">${err}</p>
                                    </c:if>
                                </div>
                                <button type="button" class="btn button-close" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn button-post">Post blog</button>
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
        <script>
                            function validateForm() {
                                const form = document.getElementById('blogForm');
                                const blogName = document.getElementById('blog_name');
                                const image = document.getElementById('image');
                                const description = document.getElementById('description');
                                const content = document.getElementById('content');

                                // Trim whitespace
                                blogName.value = blogName.value.trim();
                                image.value = image.value.trim();
                                description.value = description.value.trim();
                                content.value = content.value.trim();

                                let isValid = true;

                                // Check if fields are empty
                                if (!blogName.value) {
                                    blogName.classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    blogName.classList.remove('is-invalid');
                                }

                                if (!image.value || !isValidUrl(image.value)) {
                                    image.classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    image.classList.remove('is-invalid');
                                }

                                if (!description.value) {
                                    description.classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    description.classList.remove('is-invalid');
                                }

                                if (!content.value) {
                                    content.classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    content.classList.remove('is-invalid');
                                }

                                return isValid;
                            }

                            function isValidUrl(string) {
                                const urlPattern = new RegExp('^(https?:\\/\\/)?' + // validate the protocol
                                        '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.?)+[a-z]{2,}|' + // domain name
                                        '((\\d{1,3}\\.){3}\\d{1,3}))' + // OR ip (v4) address
                                        '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*' + // port and path
                                        '(\\?[;&a-z\\d%_.~+=-]*)?' + // query string
                                        '(\\#[-a-z\\d_]*)?$', 'i'); // fragment locator

                                const imagePattern = /\.(jpg|jpeg|png|gif)$/i;

                                return urlPattern.test(string) && imagePattern.test(string);
                            }

                            document.querySelectorAll('#blogForm .form-control').forEach(input => {
                                input.addEventListener('input', () => {
                                    if (input.value.trim() !== '') {
                                        input.classList.remove('is-invalid');
                                    }
                                });
                            });

        </script>
    </body>
</html>
