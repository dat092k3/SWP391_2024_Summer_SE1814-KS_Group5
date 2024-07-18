<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <title>SportFIT</title>
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
        <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
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

                <!-- Boxes -->

                <div class="boxes">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="boxes_container d-flex flex-lg-row flex-column align-items-start justify-content-start">

                                    <!-- Box -->
                                    <div class="box">
                                        <div class="box_icon d-flex flex-column align-items-center justify-content-center"><img src="images/icon_1.png" alt=""></div>
                                        <div class="box_title">Practice with trainer</div>
                                        <div class="box_text">
                                            <p>Be trained and guided by personal trainers with over 3 years of training experience to help you achieve your desired body shape as quickly as possible.</p>
                                        </div>
                                        <div class="box_link_container">
                                            <a href="#"><div class="box_link d-flex flex-column align-items-center justify-content-center trans_200"><div>+</div></div></a>
                                        </div>
                                    </div>

                                    <!-- Box -->
                                    <div class="box">
                                        <div class="box_icon d-flex flex-column align-items-center justify-content-center"><img src="images/icon_13.png" alt=""></div>
                                        <div class="box_title">Infrastructure</div>
                                        <div class="box_text">
                                            <p>Modern facilities, and equipment are always strictly tested for quality and regularly maintained to ensure customer safety and the best experience.</p>
                                        </div>
                                        <div class="box_link_container">
                                            <a href="#"><div class="box_link d-flex flex-column align-items-center justify-content-center trans_200"><div>+</div></div></a>
                                        </div>
                                    </div>

                                    <!-- Box -->
                                    <div class="box">
                                        <div class="box_icon d-flex flex-column align-items-center justify-content-center"><img src="images/icon_3.png" alt=""></div>
                                        <div class="box_title">The blog</div>
                                        <div class="box_text">
                                            <p>Blogs are always updated daily so that customers can have the best healthy lifestyle for their bodies, ensuring their health and shape.</p>
                                        </div>
                                        <div class="box_link_container">
                                            <a href="#"><div class="box_link d-flex flex-column align-items-center justify-content-center trans_200"><div>+</div></div></a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- About -->

                <div class="about">
                    <div class="container about_container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="about_content">
                                    <div class="section_title_container">
                                        <div class="section_subtitle">welcome to sportfit</div>
                                        <div class="section_title">About <span>Sportfit</span></div>
                                    </div>
                                    <div class="text_highlight">Your satisfaction is our happiness.</div>
                                    <div class="about_text">
                                        <p>Our facility provides the best service for you with affordable prices, modern facilities and constantly improving quality, ensuring customers will be satisfied with the amenities you can receive.</p>
                                    </div>
                                    <div class="button about_button"><a href="#">Join Now</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="about_background">
                        <div class="container fill_height">
                            <div class="row fill_height">
                                <div class="col-lg-6 offset-lg-6 fill_height">
                                    <div class="about_image"><img src="images/a1.png" alt=""></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Testimonials -->

                <div class="testimonials">
                    <div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="images/testimonials.jpg" data-speed="0.8"></div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="section_title_container">
                                    <div class="section_subtitle">welcome to sportfit</div>
                                    <div class="section_title">Testimonials</div>
                                </div>

                                <!-- Testimonial -->
                                <div class="test test_1 d-flex flex-row align-items-start justify-content-start">
                                    <div><div class="test_image"><img src="images/test_1.jpg" alt=""></div></div>
                                    <div class="test_content">
                                        <div class="test_name"><a href="#">Diane Smith</a></div>
                                        <div class="test_title">client</div>
                                        <div class="test_text">
                                            <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit am et tellus blandit. Etiam nec odio vestibul. Etiam nec odio vestibulum est mat tis effic iturut magna.</p>
                                        </div>
                                        <div class="rating rating_4 test_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">

                                <!-- Testimonial -->
                                <div class="test d-flex flex-row align-items-start justify-content-start">
                                    <div><div class="test_image"><img src="images/test_2.jpg" alt=""></div></div>
                                    <div class="test_content">
                                        <div class="test_name"><a href="#">Diane Smith</a></div>
                                        <div class="test_title">client</div>
                                        <div class="test_text">
                                            <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit am et tellus blandit. Etiam nec odio vestibul. Etiam nec odio vestibulum est mat tis effic iturut magna.</p>
                                        </div>
                                        <div class="rating rating_4 test_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                    </div>
                                </div>

                                <!-- Testimonial -->
                                <div class="test d-flex flex-row align-items-start justify-content-start">
                                    <div><div class="test_image"><img src="images/test_3.jpg" alt=""></div></div>
                                    <div class="test_content">
                                        <div class="test_name"><a href="#">Diane Smith</a></div>
                                        <div class="test_title">client</div>
                                        <div class="test_text">
                                            <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit am et tellus blandit. Etiam nec odio vestibul. Etiam nec odio vestibulum est mat tis effic iturut magna.</p>
                                        </div>
                                        <div class="rating rating_4 test_rating"><i></i><i></i><i></i><i></i><i></i></div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row test_button_row">
                            <div class="col text-center">
                                <div class="button test_button"><a href="#">Join Now</a></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Gallery -->

                <div class="gallery">

                    <!-- Gallery Slider -->
                    <div class="gallery_slider_container">
                        <div class="owl-carousel owl-theme gallery_slider">

                            <!-- Slide -->
                            <div class="owl-item"><img src="images/gallery_3.jpg" alt=""></div>

                            <!-- Slide -->
                            <div class="owl-item"><img src="images/gallery_4.jpg" alt=""></div>

                            <!-- Slide -->
                            <div class="owl-item"><img src="images/gallery_5.jpg" alt=""></div>

                            <!-- Slide -->
                            <div class="owl-item"><img src="images/gallery_1.jpg" alt=""></div>

                            <!-- Slide -->
                            <div class="owl-item"><img src="images/gallery_2.jpg" alt=""></div>

                        </div>
                    </div>
                </div>

                <!-- Services -->

                <div class="services">
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
                            <div class="col-xl-4 col-md-6 service_col">
                                <div class="service">
                                    <div class="service_title_container d-flex flex-row align-items-center justify-content-start">
                                        <div><div class="service_icon"><img src="images/icon_4.png" alt=""></div></div>
                                        <div class="service_title">Weight Loss Class</div>
                                    </div>
                                    <div class="service_text">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris scelerisque, at rutrum.</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Service -->
                            <div class="col-xl-4 col-md-6 service_col">
                                <div class="service">
                                    <div class="service_title_container d-flex flex-row align-items-center justify-content-start">
                                        <div><div class="service_icon"><img src="images/icon_5.png" alt=""></div></div>
                                        <div class="service_title">Yoga Classes</div>
                                    </div>
                                    <div class="service_text">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris scelerisque, at rutrum.</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Service -->
                            <div class="col-xl-4 col-md-6 service_col">
                                <div class="service">
                                    <div class="service_title_container d-flex flex-row align-items-center justify-content-start">
                                        <div><div class="service_icon"><img src="images/icon_6.png" alt=""></div></div>
                                        <div class="service_title">Spinning Class</div>
                                    </div>
                                    <div class="service_text">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris scelerisque, at rutrum.</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Service -->
                            <div class="col-xl-4 col-md-6 service_col">
                                <div class="service">
                                    <div class="service_title_container d-flex flex-row align-items-center justify-content-start">
                                        <div><div class="service_icon"><img src="images/icon_7.png" alt=""></div></div>
                                        <div class="service_title">Private Fit Class</div>
                                    </div>
                                    <div class="service_text">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris scelerisque, at rutrum.</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Service -->
                            <div class="col-xl-4 col-md-6 service_col">
                                <div class="service">
                                    <div class="service_title_container d-flex flex-row align-items-center justify-content-start">
                                        <div><div class="service_icon"><img src="images/icon_8.png" alt=""></div></div>
                                        <div class="service_title">Nutrition Classes</div>
                                    </div>
                                    <div class="service_text">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris scelerisque, at rutrum.</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Service -->
                            <div class="col-xl-4 col-md-6 service_col">
                                <div class="service">
                                    <div class="service_title_container d-flex flex-row align-items-center justify-content-start">
                                        <div><div class="service_icon"><img src="images/icon_9.png" alt=""></div></div>
                                        <div class="service_title">Pillates Class</div>
                                    </div>
                                    <div class="service_text">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada lorem maximus mauris scelerisque, at rutrum.</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Blog -->

                <div class="blog">
                    <div class="blog_overlay"></div>
                    <div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="images/blog.jpg" data-speed="0.8"></div>
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class=" d-flex flex-row align-items-start justify-content-start">
                                    <div class="section_title_container">
                                        <div class="section_subtitle">welcome to sportfit</div>
                                        <div class="section_title">The Blog</div>
                                    </div>
                                    <div class="all_posts_link ml-auto"><a href="#">View all blog posts</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="row blog_row">

                            <!-- Blog Post -->
                            <div class="col-lg-4 blog_col">
                                <div class="blog_post">
                                    <div class="blog_post_image"><img src="images/blog_1.jpg" alt=""></div>
                                    <div class="blog_post_title"><a href="#">Tips for the perfect body</a></div>
                                    <div class="blog_post_date"><a href="#">june 29, 2018</a></div>
                                    <div class="blog_post_text">
                                        <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Odio vestibulum est mattis effic iturut.</p>
                                    </div>
                                    <div class="blog_post_link"><a href="#">Read More</a></div>
                                </div>
                            </div>

                            <!-- Blog Post -->
                            <div class="col-lg-4 blog_col">
                                <div class="blog_post">
                                    <div class="blog_post_image"><img src="images/blog_2.jpg" alt=""></div>
                                    <div class="blog_post_title"><a href="#">Tips for the perfect body</a></div>
                                    <div class="blog_post_date"><a href="#">june 29, 2018</a></div>
                                    <div class="blog_post_text">
                                        <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Odio vestibulum est mattis effic iturut.</p>
                                    </div>
                                    <div class="blog_post_link"><a href="#">Read More</a></div>
                                </div>
                            </div>

                            <!-- Blog Post -->
                            <div class="col-lg-4 blog_col">
                                <div class="blog_post">
                                    <div class="blog_post_image"><img src="images/blog_3.jpg" alt=""></div>
                                    <div class="blog_post_title"><a href="#">Video: Pilates 4 Begginers</a></div>
                                    <div class="blog_post_date"><a href="#">june 29, 2018</a></div>
                                    <div class="blog_post_text">
                                        <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Odio vestibulum est mattis effic iturut.</p>
                                    </div>
                                    <div class="blog_post_link"><a href="#">Read More</a></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Footer -->
            <jsp:include page="include/footer.jsp"></jsp:include>
            </div>        
            <div id="reportModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="addreport" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Report</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <input name="accountId" value="${sessionScope.account.account_id}" type="hidden" class="form-control"readonly=""/>
                        <c:if test="${messageerror != null}">
                            <p style="color: red;">
                                ${messageerror}
                            </p>
                        </c:if>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Report Name <span class="text-danger">*</span></label>
                                <input name="namereport" value="${requestScope.reportname}" type="text" class="form-control" maxlength="255" required=""/>
                            </div>
                            <div class="form-group">
                                <label>Description <span class="text-danger">*</span></label>
                                <textarea name="description" class="form-control" required>${requestScope.description}</textarea>
                            </div>
                            <div class="form-group">
                                <label class="labels">Date <span class="text-danger">*</span></label>
                                <input name="date" value="${requestScope.currentDate}" type="date" class="form-control" readonly=""/>
                            </div>
                            <div class="form-group">
                                <label class="labels">Status <span class="text-danger">*</span></label>
                                <input name="status" value="${requestScope.status}" type="text" class="form-control"readonly=""/>
                            </div>
                            <div class="alert alert-warning mt-3">
                                <strong>Note:</strong> Please check carefully because you cannot edit the report.
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" name="action" value="Send">
                        </div>
                    </form>
                </div>
            </div>
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
        <script src="js/custom.js"></script>
        <c:if test="${showEditDialog}">
            <script>
                $("#reportModal").modal('show');

                document.addEventListener('DOMContentLoaded', function () {
                    const rows = document.querySelectorAll('#content tr');
                    rows.forEach((row, index) => {
                        row.querySelector('.serial-number').textContent = index + 1;
                    });
                });
            </script>
        </c:if>
    </body>
</html>