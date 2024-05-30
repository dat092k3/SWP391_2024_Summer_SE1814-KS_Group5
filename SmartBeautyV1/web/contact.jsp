<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Contact</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="SportFIT template project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap-4.1.2/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/contact.css">
        <link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">
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

                <!-- Contact -->

                <div class="contact">
                    <div class="container">
                        <div class="row">

                            <!-- Contact Content -->
                            <div class="col-lg-4">
                                <div class="contact_content">
                                    <div class="contact_logo">
                                        <div class="logo d-flex flex-row align-items-center justify-content-start"><img src="images/dot.png" alt=""><div>Sport<span>fit</span></div></div>
                                    </div>
                                    <div class="contact_text">
                                        <p>Etiam nec odio vestibulum est mattis effic iturut magna. Pellentesque sit amet tellus blandit. Odio vestibulum est mattis effic iturut.</p>
                                    </div>
                                    <div class="contact_list">
                                        <ul>
                                            <li class="d-flex flex-row align-items-start justify-content-start">
                                                <div><div>A:</div></div>
                                                <div>1481 Creekside Lane Avila Beach, CA 931</div>
                                            </li>
                                            <li class="d-flex flex-row align-items-start justify-content-start">
                                                <div><div>P:</div></div>
                                                <div>+53 345 7953 32453</div>
                                            </li>
                                            <li class="d-flex flex-row align-items-start justify-content-start">
                                                <div><div>M:</div></div>
                                                <div>yourmail@gmail.com</div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <!-- Contact Form -->
                            <div class="col-lg-8 contact_col">
                                <div class="contact_title">Gettsss in touch</div>
                                <div class="contact_form_container">
                                    <form action="#" id="contact_form" class="contact_form">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="input_item"><input type="text" class="contact_input trans_200" placeholder="Name" required="required"></div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="input_item"><input type="email" class="contact_input trans_200" placeholder="E-mail" required="required"></div>
                                            </div>
                                        </div>
                                        <div class="input_item"><textarea class="contact_input contact_textarea trans_200" placeholder="Message" required="required"></textarea></div>
                                        <button class="contact_button button">Send<span></span></button>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <div class="row google_map_row">
                            <div class="col">

                                <!-- Contact Map -->

                                <div class="contact_map">

                                    <!-- Google Map -->

                                    <div class="map">
                                        <div id="google_map" class="google_map">
                                            <div class="map_container">
                                                <div id="map"></div>
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
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
        <script src="js/contact.js"></script>
    </body>
</html>