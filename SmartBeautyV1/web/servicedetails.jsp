<%-- 
    Document   : servicedetails
    Created on : Jun 18, 2024, 7:23:58 PM
    Author     : admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
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
        <link rel="stylesheet" type="text/css" href="styles/blog.css">
        <link rel="stylesheet" href="styles/service_detail.css"/>
    </head>
    <body>
        <div class="super_container" style="margin-bottom: 100px">
            <!-- Header -->
            <jsp:include page="include/header.jsp"></jsp:include>
            <jsp:include page="include/slideshow.jsp"></jsp:include>

                <div class="service-container">
                    <div class="service-image">
                        <img style="width: 500px" src="data:image/jpeg;base64,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" alt="Service Image">
                    </div>
                    <div class="service-details">
                        <p>${service.service_name}</p>
                    <p class="service-description">${service.description}</p>
                    <p class="service-price">Price: ${service.price} VND / Tháng</p>
                    <p>Sale: ${service.discount}</p>
                    <div class="buttons">
                        <button class="register-btn" data-toggle="modal" data-target="#serviceModal">Đăng kí</button>
                        <button class="contact-btn">Liên hệ</button>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="serviceModal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="serviceForm" action="registerservice" method="post" onsubmit="return validateServiceForm()">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Register for Service</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="service_id" value="${service.service_id}">
                                <input type="hidden" name="customer_id" value="${sessionScope.account.account_id}">
                                <input type="hidden" name="date" value="<%= new java.util.Date() %>">

                                <div class="form-group">
                                    <label for="duration">Duration (months)</label>
                                    <input type="number" class="form-control" id="duration" name="duration" min="1" required onchange="updateForm()">
                                    <div class="invalid-feedback">Please enter a valid duration.</div>
                                </div>
                                <div class="form-group">
                                    <label for="pt">Personal Trainer: </label>
                                    <select name="pt" id="pt" onchange="updateForm()">
                                        <option value="">No Register</option>
                                        <c:forEach items="${requestScope.list_pt}" var="pt">
                                            <option value="${pt.employee_id}" data-image="${pt.image}" data-experience="${pt.experience}">
                                                ${pt.fullName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group" id="pt_details" style="display: none;">
                                    <div class="service_title_container d-flex flex-row align-items-center justify-content-start">
                                        <div class="pt-image-container">
                                            <img style="width: 100px" id="pt_image" src="" alt="PT Image" class="service_icon">
                                        </div>
                                        <div class="pt-experience-container">
                                            <div class="experience-title">Experience:</div>
                                            <div id="pt_experience" class="service_title"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="total_price">Total Price</label>
                                    <input type="text" class="form-control" id="total_price" name="total_price" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="end_date">End Date</label>
                                    <input type="text" class="form-control" id="end_date" name="end_date" readonly>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn button-close" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn button-post">Register</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <script>
                function calculateTotalPrice() {
                    var duration = document.getElementById('duration').value;
                    var price = ${service.price};
                    var pt_price = ${service.pt_price};
                    var discount = ${service.discount} / 100;

                    var ptSelected = calculatePT();
                    var totalPrice = duration * (price + (pt_price * ptSelected)) * (1 - discount);

                    document.getElementById('total_price').value = totalPrice.toFixed(2);
                }

                function calculateEndDate() {
                    var duration = document.getElementById('duration').value;
                    var startDate = new Date();
                    var endDate = new Date(startDate.setMonth(startDate.getMonth() + parseInt(duration)));

                    var dd = String(endDate.getDate()).padStart(2, '0');
                    var mm = String(endDate.getMonth() + 1).padStart(2, '0');
                    var yyyy = endDate.getFullYear();

                    document.getElementById('end_date').value = yyyy + '-' + mm + '-' + dd;
                }

                function calculatePT() {
                    var pt = document.getElementById('pt').value.trim();
                    return pt === '' ? 0 : 1;
                }

                function updateForm() {
                    calculateTotalPrice();
                    calculateEndDate();
                    updatePTDetails();
                }

                function updatePTDetails() {
                    var ptSelect = document.getElementById('pt');
                    var selectedOption = ptSelect.options[ptSelect.selectedIndex];

                    var ptImage = selectedOption.getAttribute('data-image');
                    var ptExperience = selectedOption.getAttribute('data-experience');

                    if (ptImage && ptExperience) {
                        console.log("PT Image: " + ptImage);  // Debugging line
                        console.log("PT Experience: " + ptExperience);  // Debugging line

                        document.getElementById('pt_image').src = ptImage;
                        document.getElementById('pt_experience').innerText = ptExperience;
                        document.getElementById('pt_details').style.display = 'block';
                    } else {
                        document.getElementById('pt_details').style.display = 'none';
                    }
                }
            </script>




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
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/progressbar/progressbar.min.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="plugins/colorbox/jquery.colorbox-min.js"></script>
        <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="js/services.js"></script>
    </body>
</html>
