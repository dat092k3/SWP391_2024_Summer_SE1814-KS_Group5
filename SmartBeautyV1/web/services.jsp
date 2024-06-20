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
        <link rel="stylesheet" type="text/css" href="styles/services_responsive.css">
        <style>
            .search-form-container {
                display: flex;
                justify-content: flex-end;
            }
        </style>
    </head>
    <body>
        <div class="super_container">
            <!-- Header -->
            <jsp:include page="include/header.jsp"></jsp:include>
            <jsp:include page="include/home.jsp"></jsp:include>

                <div class="search-form-container">
                    <form action="searchservice" method="get" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input value="${txtS}" name="txtservice" type="text" class="form-control" aria-label="Small"
                               aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
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
                            <div class="col-xl-4 col-md-6 service_col">
                                <div class="service">
                                    <div class="service_title_container d-flex flex-row align-items-center justify-content-start">
                                        <div><div class="service_icon"><img src="images/icon_4.png" alt=""></div></div>
                                        <div class="service_title"><a href="servicedetails?service_id=${service.service_id}">${service.service_name}</a></div>
                                    </div>
                                    <div class="service_text">
                                        <p>${service.description}</p>
                                    </div>
                                </div>
                            </div>
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