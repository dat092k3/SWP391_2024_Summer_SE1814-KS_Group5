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
            function deleteBlog(blogId) {
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
        <script>
            function deleteComment(commentId, blogId) {
                if (confirm("Bạn có chắc muốn xóa comment này không?")) {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            var response = this.responseText;
                            if (response === "true") {
                                alert("Comment đã được xóa thành công.");
                                // Refresh or update comments section
                                // For example, reload the page
                                window.location.reload();
                            } else {
                                alert("Không thể xóa comment này. Vui lòng thử lại sau.");
                            }
                        }
                    };
                    xhttp.open("GET", "DeleteComment?comment_id=" + commentId + "&blog_id=" + blogId, true);
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
                            <div class="blog_post_date">${blog.post_at}</div>
                            <h1>${blog.blog_name}</h1>
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

            <div class="modal fade" id="Edit" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit Blog</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form id="blogForm" action="editblog" method="get" onsubmit="return validateForm();">
                            <!-- Các trường input -->
                            <div class="form-group">
                                <label for="blog_name">Blog Name</label>
                                <input type="text" class="form-control" id="blog_name" name="blog_name" value="${blog.blog_name}" required>
                                <div class="invalid-feedback">Vui lòng nhập tên blog.</div>
                            </div>
                            <div class="form-group">
                                <label for="image">Image URL</label>
                                <input type="text" class="form-control" id="image" name="image" value="${blog.image}" required>
                                <div class="invalid-feedback">Vui lòng nhập URL hình ảnh.</div>
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <input type="text" class="form-control" id="description" name="description" value="${blog.description}" required>
                                <div class="invalid-feedback">Vui lòng nhập mô tả.</div>
                            </div>
                            <div class="form-group">
                                <label for="content">Content</label>
                                <textarea class="form-control" id="content" name="content" required>${blog.content}</textarea>
                                <div class="invalid-feedback">Vui lòng nhập nội dung.</div>
                            </div>
                            <!-- Input hidden -->
                            <div class="form-group">
                                <input type="hidden" class="form-control" name="blog_id" value="${blog.blog_id}">
                                <input type="hidden" class="form-control" name="account_id" value="${sessionScope.account.account_id}">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn button-close" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn button-post">Save blog</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>

            <!-- Comments Button -->
            <button class="floating-btn floating-btn-comments" data-toggle="modal" data-target="#CommentsModal">
                <i class="fa fa-comments"></i>
            </button>

            <div class="modal fade" id="CommentsModal" tabindex="-1" role="dialog" aria-labelledby="CommentsModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="CommentsModalLabel">Comments</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <c:forEach items="${requestScope.comments}" var="comment">
                            <div class="container comment-border">
                                <div class="blog_post_date">${comment.created_at}</div>
                                <div>
                                    <div>
                                        <span class="text1">${comment.content}</span>
                                    </div>
                                    <div class="comment-details">
                                        <div class="comment-author">
                                            <img src="${comment.customer_image}" width="30" height="30">${comment.customer_name}
                                        </div>
                                        <!-- Controls for Edit and Delete -->
                                        <c:if test="${requestScope.authorId == comment.customer_id}">
                                            <div class="actions">
                                                <button type="button" class="btn button-post edit-comment-btn" onclick="w3_open('${comment.comment_id}', '${blog.blog_id}')">
                                                    <i class="fa fa-pencil"></i> Edit
                                                </button>
                                                <button type="button" class="btn button-post delete-comment-btn" onclick="deleteComment(${comment.comment_id}, ${blog.blog_id})">
                                                    <i class="fa fa-trash"></i> Delete
                                                </button>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                                        
                            <!-- Edit Comment Form -->
                            <form id="editCommentForm_${comment.comment_id}" action="EditComment" method="post" style="display: none;" onsubmit="return validateEditCommentForm()">
                                <div class="section_subtitle">Update Comment</div>
                                <div class="modal-footer">
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" name="edit_comment_id_$" id="edit_comment_id_${comment.comment_id}" value="${comment.comment_id}">
                                        <input type="hidden" class="form-control" name="blog_id" id="add_comment_blog_id" value="${blog.blog_id}">
                                        <input type="hidden" class="form-control" name="account_id" id="add_comment_account_id" value="${sessionScope.account.account_id}">
                                        <textarea class="form-control" id="comment_content_edit_${comment.comment_id}" name="comment_content_edit" required placeholder="Write your comment here...">${comment.content}</textarea>
                                        <div class="invalid-feedback">Please enter valid content.</div>
                                    </div>
                                    <button type="button" class="btn button-close" onclick="w3_close('${comment.comment_id}', '${blog.blog_id}')">Close</button>
                                    <button type="submit" class="btn button-post" onclick="w3_close('${comment.comment_id}', '${blog.blog_id}')">Save Comment</button>
                                </div>
                            </form>

                        </c:forEach>

                        <c:if test="${sessionScope.role == 'Customer'}">
                            <!-- Form for Adding Comment -->
                            <form id="addCommentForm" action="AddComment" method="post" style="display: block;" onsubmit="return validateAddCommentForm()">
                                <div class="section_subtitle">Add Comment</div>
                                <div class="modal-footer">
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" name="blog_id" id="add_comment_blog_id" value="${blog.blog_id}">
                                        <input type="hidden" class="form-control" name="account_id" id="add_comment_account_id" value="${sessionScope.account.account_id}">
                                        <textarea class="form-control" id="comment_content_add" name="comment_content_add" required placeholder="Write your comment here..."></textarea>
                                        <div class="invalid-feedback">Please enter valid content.</div>
                                    </div>
                                    <button type="button" class="btn button-close" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn button-post">Add Comment</button>
                                </div>
                            </form>
                        </c:if>
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
        <script>
                                async function validateForm() {
                                    var blogName = document.getElementById('blog_name').value.trim();
                                    var image = document.getElementById('image').value.trim();
                                    var description = document.getElementById('description').value.trim();
                                    var content = document.getElementById('content').value.trim();
                                    if (blogName === '') {
                                        alert('Vui lòng nhập tên blog.');
                                        return false;
                                    }
                                    if (image === '') {
                                        alert('Vui lòng nhập URL hình ảnh.');
                                        return false;
                                    }
                                    if (description === '') {
                                        alert('Vui lòng nhập mô tả.');
                                        return false;
                                    }
                                    if (content === '') {
                                        alert('Vui lòng nhập nội dung.');
                                        return false;
                                    }

                                    const isValid = await isValidImageURL(image);
                                    if (!isValid) {
                                        alert('Vui lòng nhập URL hình ảnh hợp lệ.');
                                        return false;
                                    }

                                    var xhttp = new XMLHttpRequest();
                                    xhttp.onreadystatechange = function () {
                                        if (this.readyState === 4 && this.status === 200) {
                                            var response = this.responseText;
                                            if (response === "False") {
                                                alert("Không thể cập nhật blog này. Vui lòng thử lại sau.");
                                            } else {
                                                alert("Blog đã được cập nhật thành công.");
                                                window.location.href = "blogdetails?id=" + ${blog.blog_id} + "&aid=" +${sessionScope.account.account_id};
                                            }
                                        }
                                    };
                                    xhttp.open("POST", "editblog", true);
                                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                    var params = "blog_id=" + ${blog.blog_id} + "&blog_name=" + blogName + "&image=" + image + "&description=" + description + "&content=" + content + "&account_id=" + ${sessionScope.account.account_id};
                                    xhttp.send(params);
                                    return false;
                                }

                                function isValidImageURL(url) {
                                    return new Promise((resolve) => {
                                        const pattern = /\.(jpeg|jpg|gif|png|webp|svg)$/;
                                        if (!pattern.test(url)) {
                                            resolve(false);
                                        }

                                        var img = new Image();
                                        img.src = url;
                                        img.onload = function () {
                                            resolve(true);
                                        };
                                        img.onerror = function () {
                                            resolve(false);
                                        };
                                    });
                                }

                                function w3_open(commentId, blogId) {
                                    // Hide add comment form and show edit comment form
                                    document.getElementById("addCommentForm").style.display = "none";
                                    var editForm = document.getElementById("editCommentForm_" + commentId);
                                    if (editForm) {
                                        editForm.style.display = "block";
                                    }
                                }

                                function w3_close(commentId, blogId) {
                                    document.getElementById("addCommentForm").style.display = "block";
                                    var editForm = document.getElementById("editCommentForm_" + commentId);
                                    if (editForm) {
                                        editForm.style.display = "none";
                                    }
                                }
    </script>
    <script>
        function validateAddCommentForm() {
            var commentContent = document.getElementById('comment_content_add').value.trim();

            if (commentContent === '') {
                document.getElementById('comment_content_add').classList.add('is-invalid');
                return false;
            } else {
                document.getElementById('comment_content_add').classList.remove('is-invalid');
            }

            // Additional validation logic can be added here as needed

            // Proceed with form submission
            return true;
        }

        function validateEditCommentForm() {
            var commentContent = document.getElementById('comment_content_edit').value.trim();

            if (commentContent === '') {
                document.getElementById('comment_content_edit').classList.add('is-invalid');
                return false;
            } else {
                document.getElementById('comment_content_edit').classList.remove('is-invalid');
            }

            // Additional validation logic can be added here as needed

            // Proceed with form submission
            return true;
        }
    </script>



</html>
