<%-- 
    Document   : schedule
    Created on : Jun 10, 2024, 8:01:24 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    </head>
    <body>

        <div class="super_container">
            <!-- Header -->
            <jsp:include page="include/header.jsp"></jsp:include>
                <!-- Menu -->
            <jsp:include page="include/menu.jsp"></jsp:include>       
                <!-- Timetable -->
                <div class="timetable">
                    <div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="images/timetable.jpg" data-speed="0.8"></div>
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="section_title_container">
                                    <div class="section_subtitle">welcome to sportfit</div>
                                    <div class="section_title">Classes Timetable</div>
                                </div>
                                <div class="timetable_filtering">
                                    <ul class="d-flex flex-row align-items-start justify-content-start flex-wrap">
                                        <li class="active item_filter_btn" data-filter="*">All Classes</li>
                                        <li class="item_filter_btn" data-filter=".weight_loss">Weight Loss</li>
                                        <li class="item_filter_btn" data-filter=".aerobics">Aerobics</li>
                                        <li class="item_filter_btn" data-filter=".crossfit">Crossfit</li>
                                        <li class="item_filter_btn" data-filter=".fitness">Fitness</li>
                                        <li class="item_filter_btn" data-filter=".yoga">Yoga</li>
                                        <li class="item_filter_btn" data-filter=".pilates">Pilates</li>
                                        <li class="item_filter_btn" data-filter=".stretching">Stretching</li>
                                    </ul>
                                </div>
                                <div class="timetable_container d-flex flex-sm-row flex-column align-items-start justify-content-sm-between justify-content-start">

                                    <!-- Monday -->
                                    <div class="tt_day">
                                        <div class="tt_title">monday</div>
                                        <div class="tt_day_content grid">

                                            <!-- Class -->
                                            <div class="tt_class grid-item weight_loss">
                                                <div class="tt_class_title">Weight Loss</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">9:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item aerobics">
                                                <div class="tt_class_title">Aerobics</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">10:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class empty grid-item">

                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item aerobics">
                                                <div class="tt_class_title">Aerobics</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">13:00</div>
                                            </div>

                                        </div>
                                    </div>

                                    <!-- Tuesday -->
                                    <div class="tt_day">
                                        <div class="tt_title">tuesday</div>
                                        <div class="tt_day_content grid">

                                            <!-- Class -->
                                            <div class="tt_class grid-item weight_loss">
                                                <div class="tt_class_title">Weight Loss</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">8:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class empty grid-item">

                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item aerobics">
                                                <div class="tt_class_title">Aerobics</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">12:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item aerobics">
                                                <div class="tt_class_title">Aerobics</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">13:00</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Wednesday -->
                                    <div class="tt_day">
                                        <div class="tt_title">wednesday</div>
                                        <div class="tt_day_content grid">

                                            <!-- Class -->
                                            <div class="tt_class grid-item crossfit">
                                                <div class="tt_class_title">Crossfit</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">9:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item aerobics">
                                                <div class="tt_class_title">Aerobics</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">10:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class empty grid-item">

                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item aerobics">
                                                <div class="tt_class_title">Aerobics</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">13:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item aerobics">
                                                <div class="tt_class_title">Aerobics</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">17:00</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Thursday -->
                                    <div class="tt_day">
                                        <div class="tt_title">thursday</div>
                                        <div class="tt_day_content grid">

                                            <!-- Class -->
                                            <div class="tt_class grid-item fitness">
                                                <div class="tt_class_title">Fitness</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">9:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item aerobics">
                                                <div class="tt_class_title">Aerobics</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">10:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item yoga">
                                                <div class="tt_class_title">Yoga</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">12:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item pilates">
                                                <div class="tt_class_title">Pilates</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">13:00</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Friday -->
                                    <div class="tt_day">
                                        <div class="tt_title">friday</div>
                                        <div class="tt_day_content grid">

                                            <!-- Class -->
                                            <div class="tt_class grid-item yoga">
                                                <div class="tt_class_title">Yoga</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">9:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item aerobics">
                                                <div class="tt_class_title">Aerobics</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">10:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class empty grid-item">

                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item aerobics">
                                                <div class="tt_class_title">Aerobics</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">13:00</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Saturday -->
                                    <div class="tt_day">
                                        <div class="tt_title">Saturday</div>
                                        <div class="tt_day_content grid">

                                            <!-- Class -->
                                            <div class="tt_class grid-item weight_loss">
                                                <div class="tt_class_title">Weight Loss</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">9:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item pilates">
                                                <div class="tt_class_title">Pilates</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">10:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class empty grid-item">

                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item aerobics">
                                                <div class="tt_class_title">Aerobics</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">13:00</div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Sunday -->
                                    <div class="tt_day">
                                        <div class="tt_title">Sunday</div>
                                        <div class="tt_day_content grid">

                                            <!-- Class -->
                                            <div class="tt_class grid-item stretching">
                                                <div class="tt_class_title">Stretching</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">9:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class grid-item aerobics">
                                                <div class="tt_class_title">Aerobics</div>
                                                <div class="tt_class_instructor">Jessica Smith</div>
                                                <div class="tt_class_time">10:00</div>
                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class empty grid-item">

                                            </div>

                                            <!-- Class -->
                                            <div class="tt_class empty grid-item">

                                            </div>
                                        </div>
                                    </div>

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