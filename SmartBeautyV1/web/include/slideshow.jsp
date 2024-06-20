<%-- 
    Document   : slideshow
    Created on : Jun 20, 2024, 3:16:17 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <<link rel="stylesheet" href="styles/slideshowservice.css"/>
    </head>
    <body>
        <!-- Slideshow container -->
        <div class="slideshow-container">

            <!-- Full-width images with number and caption text -->
            <div class="mySlides fade">
                <img src="images/a1.png" style="width:1000px; height: 500px">
            </div>

            <div class="mySlides fade">
                <img src="images/team_1.jpg" style="width:1000px; height: 500px">
            </div>

            <div class="mySlides fade">
                <img src="images/a2.png" style="width:1000px; height: 500px"">
            </div>


            <!-- Next and previous buttons -->
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>
        <br>

        <!-- The dots/circles -->
        <div style="text-align:center">
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
            <span class="dot" onclick="currentSlide(3)"></span>
        </div>
        <script src="js/slideshowservice.js"></script>
    </body>
</html>
