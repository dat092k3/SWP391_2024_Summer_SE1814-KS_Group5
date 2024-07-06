<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html lang="en">
    <head>
        <title>Services</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="SportFIT template project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.2/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link href="plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/services.css">
        <link rel="stylesheet" type="text/css" href="styles/blog.css">
        <link rel="stylesheet" type="text/css" href="styles/services_responsive.css">
        <style>
            .search-form-container {
                display: flex;
                justify-content: flex-end;
            }
        </style>
        <script>
            function deleteService(serviceId) {
                if (confirm("Bạn có chắc muốn xóa dịch vụ này không?")) {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            var response = this.responseText;
                            if (response === "true") {
                                alert("Dịch vụ đã được xóa thành công.");
                                // Refresh or update services section
                                // For example, reload the page
                                window.location.reload();
                            } else {
                                alert("Không thể xóa dịch vụ này. Vui lòng thử lại sau.");
                            }
                        }
                    };
                    xhttp.open("GET", "DeleteService?service_id=" + serviceId, true);
                    xhttp.send();
                }
            }
        </script>

    </head>
    <body>
        <div class="super_container">
            <!-- Header -->
            <jsp:include page="include/header.jsp"></jsp:include>
            <jsp:include page="include/home.jsp"></jsp:include>

                <div class="search-form-container">
                    <form action="searchservice" method="get" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input class="form-control flatpickr-input" placeholder="search" type="text" value="${txt}" name="txtservice">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-secondary btn-number">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="services" style="margin-top: 50px">
                <div class="container">

                    <div class="row">
                        <div class="col">
                            <div class="section_title_container">
                                <div class="section_subtitle">welcome to sportfit</div>
                                <div class="section_title">Our Courses</div>
                            </div>
                        </div>
                    </div>

                    <div class="row services_row">
                        <!-- Service -->
                        <c:forEach items="${requestScope.listservice}" var="service">
                            <c:if test="${service.status}">
                                <div class="col-xl-4 col-md-6 service_col">
                                    <div class="service">
                                        <div class="service_title_container d-flex flex-row align-items-center justify-content-start">
                                            <div><div class="service_icon"><img src="${service.image}" alt=""></div></div>
                                            <div class="service_title"><a href="servicedetails?service_id=${service.service_id}">${service.service_name}</a></div>
                                        </div>
                                        <div class="service_text">
                                            <p>${service.description}</p>
                                        </div>
                                        <c:if test="${sessionScope.role == 'Takecare'}">
                                            <div class="actions">
                                                <button type="button" class="btn button-post edit-comment-btn" data-toggle="modal" data-target="#Edit_${service.service_id}">
                                                    <i class="fa fa-pencil"></i> Edit
                                                </button>

                                                </button>
                                                <button type="button" class="btn button-post delete-comment-btn" onclick="deleteService(${service.service_id})">
                                                    <i class="fa fa-trash"></i> Delete
                                                </button>
                                            </div>

                                            <div class="modal fade" id="Edit_${service.service_id}" role="dialog">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <form id="editServiceForm" action="editservice" method="get" onsubmit="return validateForm()">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Edit Service</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div class="form-group">
                                                                    <label for="edit_service_name">Service Name</label>
                                                                    <input type="text" class="form-control" id="edit_service_name" name="service_name" maxlength="255" minlength="1" value="${service.service_name}">
                                                                    <div class="invalid-feedback">Please enter a valid service name.</div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="edit_image">Image URL</label>
                                                                    <input type="text" class="form-control" id="edit_image" name="image" value="${service.image}">
                                                                    <div class="invalid-feedback">Please enter a valid image URL.</div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="edit_description">Description</label>
                                                                    <input type="text" class="form-control" id="edit_description" name="description" minlength="1" maxlength="255" value="${service.description}">
                                                                    <div class="invalid-feedback">Please enter a valid description.</div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="edit_price">Price</label>
                                                                    <input type="number" class="form-control" id="edit_price" name="price" step="0.001" min="0"value="${service.price}">
                                                                    <div class="invalid-feedback">Please enter valid price.</div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="edit_pt_price">PT Price</label>
                                                                    <input type="number" class="form-control" id="edit_pt_price" name="pt_price" step="0.001" min="0"value="${service.pt_price}">
                                                                    <div class="invalid-feedback">Please enter valid pt price.</div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="edit_discount">Discount</label>
                                                                    <input type="number" class="form-control" id="edit_discount" name="discount" step="0.001" min="0" max="100" value="${service.discount}">
                                                                    <div class="invalid-feedback">Please enter valid price.</div>
                                                                </div>
                                                                <input type="hidden" id="edit_service_id" name="service_id" value="${service.service_id}">
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn button-close" data-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn button-post">Save Service</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach> 
                    </div>
                </div>
            </div>
            <!-- Extra -->
            <div class="extra d-flex flex-column align-items-center justify-content-center text-center">
                <div class="background_image" style="background-image:url(images/extra_wide.jpg)"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 offset-md-3">
                            <div class="extra_content d-flex flex-column align-items-center justify-content-center text-center">
                                <div class="extra_title">15% Discount</div>
                                <div class="extra_text">
                                    <p>Morbi sed varius risus, vitae molestie lectus. Donec id hendrerit velit, eu fringilla neque. Etiam id finibus sapien. Donec sollicitudin luctus ex non pharetra.llus.</p>
                                </div>
                                <div class="button extra_button"><a href="#">Join Now</a></div>
                            </div>
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
                        <form id="serviceForm" action="addservice" method="get" onsubmit="return validateAddServiceForm()">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add New Service</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="service_name">Service Name</label>
                                    <input type="text" class="form-control" id="service_name" name="service_name" maxlength="255" minlength="1">
                                    <div class="invalid-feedback">Please enter a valid service name.</div>
                                </div>
                                <div class="form-group">
                                    <label for="image">Image URL</label>
                                    <input type="text" class="form-control" id="image" name="image">
                                    <div class="invalid-feedback">Please enter a valid image URL.</div>
                                </div>
                                <div class="form-group">
                                    <label for="description">Description</label>
                                    <input type="text" class="form-control" id="description" name="description" minlength="1" maxlength="255">
                                    <div class="invalid-feedback">Please enter a valid description.</div>
                                </div>
                                <div class="form-group">
                                    <label for="price">Price</label>
                                    <input type="number" class="form-control" id="price" name="price" step="0.001" min="0">
                                    <div class="invalid-feedback">Please enter valid price.</div>
                                </div>
                                <div class="form-group">
                                    <label for="pt_price">Price</label>
                                    <input type="number" class="form-control" id="pt_price" name="pt_price" step="0.001" min="0">
                                    <div class="invalid-feedback">Please enter valid price.</div>
                                </div>
                                <div class="form-group">
                                    <label for="discount">Discount</label>
                                    <input type="number" class="form-control" id="discount" name="discount" step="0.001" min="0" max="100">
                                    <div class="invalid-feedback">Please enter valid discount.</div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn button-close" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn button-post">Save Service</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="include/footer.jsp"></jsp:include>
    </body>

    <!-- Scripts -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="styles/bootstrap-4.1.2/popper.js"></script>
    <script src="styles/bootstrap-4.1.2/bootstrap.min.js"></script>
    <script src="plugins/greensock/TweenMax.min.js"></script>
    <script src="plugins/greensock/TimelineMax.min.js"></script>
    <script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
    <script src="plugins/greensock/animation.gsap.min.js"></script>
    <script src="plugins/greensock/ScrollToPlugin.min.js"></script>
    <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
    <script src="plugins/easing/easing.js"></script>
    <script src="plugins/progressbar/progressbar.min.js"></script>
    <script src="plugins/colorbox/jquery.colorbox-min.js"></script>
    <script src="plugins/parallax-js-master/parallax.min.js"></script>
    <script src="js/custom.js"></script>
    <script>
                            function validateForm() {
                                var serviceName = document.getElementById('edit_service_name').value.trim();
                                var imageUrl = document.getElementById('edit_image').value.trim();
                                var description = document.getElementById('edit_description').value.trim();
                                var price = document.getElementById('edit_price').value.trim();
                                var pt_price = document.getElementById('edit_pt_price').value.trim();
                                var discount = document.getElementById('edit_discount').value.trim();

                                var isValid = true;

                                if (serviceName === '') {
                                    document.getElementById('edit_service_name').classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    document.getElementById('edit_service_name').classList.remove('is-invalid');
                                }

                                if (imageUrl === '' || !isValidImageURL(imageUrl)) {
                                    document.getElementById('edit_image').classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    document.getElementById('edit_image').classList.remove('is-invalid');
                                }

                                if (description === '') {
                                    document.getElementById('edit_description').classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    document.getElementById('edit_description').classList.remove('is-invalid');
                                }

                                if (price === '' || isNaN(price) || parseFloat(price) < 0) {
                                    document.getElementById('edit_price').classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    document.getElementById('edit_price').classList.remove('is-invalid');
                                }
                                
                                if (pt_price === '' || isNaN(pt_price) || parseFloat(pt_price) < 0) {
                                    document.getElementById('edit_pt_price').classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    document.getElementById('edit_pt_price').classList.remove('is-invalid');
                                }

                                if (discount === '' || isNaN(discount) || parseFloat(discount) < 0 || parseFloat(discount) > 100) {
                                    document.getElementById('edit_discount').classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    document.getElementById('edit_discount').classList.remove('is-invalid');
                                }

                                return isValid;
                            }

                            function validateAddServiceForm() {
                                var serviceName = document.getElementById('service_name').value.trim();
                                var imageUrl = document.getElementById('image').value.trim();
                                var description = document.getElementById('description').value.trim();
                                var price = document.getElementById('price').value.trim();
                                var pt_price = document.getElementById('pt_price').value.trim();
                                var discount = document.getElementById('discount').value.trim();

                                var isValid = true;

                                if (serviceName === '') {
                                    document.getElementById('service_name').classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    document.getElementById('service_name').classList.remove('is-invalid');
                                }

                                if (imageUrl === '' || !isValidImageURL(imageUrl)) {
                                    document.getElementById('image').classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    document.getElementById('image').classList.remove('is-invalid');
                                }

                                if (description === '') {
                                    document.getElementById('description').classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    document.getElementById('description').classList.remove('is-invalid');
                                }

                                if (price === '' || isNaN(price) || parseFloat(price) < 0) {
                                    document.getElementById('price').classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    document.getElementById('price').classList.remove('is-invalid');
                                }
                                
                                if (pt_price === '' || isNaN(pt_price) || parseFloat(pt_price) < 0) {
                                    document.getElementById('pt_price').classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    document.getElementById('pt_price').classList.remove('is-invalid');
                                }

                                if (discount === '' || isNaN(discount) || parseFloat(discount) < 0 || parseFloat(discount) > 100) {
                                    document.getElementById('discount').classList.add('is-invalid');
                                    isValid = false;
                                } else {
                                    document.getElementById('discount').classList.remove('is-invalid');
                                }

                                return isValid;
                            }

                            function isValidImageURL(url) {
                                return new Promise((resolve) => {
                                    const pattern = /\.(jpeg|jpg|gif|png|webp|svg)$/i; // Added case insensitivity

                                    // Check if the URL has a valid image file extension
                                    if (!pattern.test(url)) {
                                        resolve(false);
                                        return; // Exit the function if the pattern does not match
                                    }

                                    const img = new Image();
                                    img.src = url;

                                    // Resolve to true if the image loads successfully
                                    img.onload = function () {
                                        resolve(true);
                                    };

                                    // Resolve to false if the image fails to load
                                    img.onerror = function () {
                                        resolve(false);
                                    };
                                });
                            }


    </script>
</html>
