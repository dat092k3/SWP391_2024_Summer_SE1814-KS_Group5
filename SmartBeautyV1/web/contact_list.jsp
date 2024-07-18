<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <style>
        .status-active {
            color: green;
            font-weight: bold;
        }

        .status-inactive {
            color: red;
            font-weight: bold;
        }
    </style>
    <body>

        <div class="super_container">
            <!-- Header -->
            <jsp:include page="include/header.jsp"></jsp:include>

                <!-- Contact -->
                <div class="contact">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="section_title_container text-center">
                                    <div class="section_title"><h1>Contact List</h1></div>
                                </div>
                            </div>
                        </div>
                        <div class="row contact_row">
                            <div class="col">
                                <form method="get" action="contactlist">
                                    <input type="text" name="search" placeholder="Search by name or email" value="${param.search}">
                                <button type="submit" class="btn btn-primary">Search</button>
                            </form>
                            <form method="get" action="contactlist">
                                <input type="hidden" name="inactive" value="Contact inactive">
                                <button type="submit" class="btn btn-primary">Contact Inactive</button>
                            </form>
                            <table class="table table-bordered mt-3">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Email</th>
                                        <th>Name</th>
                                        <th>Message</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="contact" items="${contacts}">
                                        <tr>
                                            <td>${contact.date}</td>
                                            <td class="${contact.status ? 'status-active' : 'status-inactive'}">
                                                <span id="status-label-${contact.key}">
                                                    ${contact.status ? "Active" : "Inactive"}
                                                </span>
                                            </td>
                                            <td>${contact.email}</td>
                                            <td>${contact.name}</td>
                                            <td>
                                                <button class="btn btn-info" onclick="toggleMessage(${contact.key})">
                                                    <span id="toggle-btn-${contact.key}">Show Message</span>
                                                </button>
                                                <p id="message-${contact.key}" style="display: none; white-space: pre-line;">${contact.message}</p>
                                            </td>
                                            <td>
                                                <form id="activateform-${contact.key}">
                                                    <input type="hidden" id="date-${contact.key}" name="date" value="${contact.date}"> <!-- Example value -->
                                                    <input type="hidden" id="email-${contact.key}" name="email" value="${contact.email}"> <!-- Example value -->
                                                    <button type="button" class="btn btn-success" onclick="activateContact(${contact.key})">Activate</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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
    <script>
                                                        function toggleMessage(key) {
                                                            var messageElement = document.getElementById('message-' + key);
                                                            var toggleBtn = document.getElementById('toggle-btn-' + key);

                                                            if (messageElement.style.display === 'none') {
                                                                messageElement.style.display = 'block';
                                                                toggleBtn.innerText = 'Hide Message';
                                                            } else {
                                                                messageElement.style.display = 'none';
                                                                toggleBtn.innerText = 'Show Message';
                                                            }
                                                        }

                                                        function activateContact(key) {
                                                            var date = document.getElementById("date-" + key).value;
                                                            var email = document.getElementById("email-" + key).value;

                                                            $.ajax({
                                                                url: 'contactlist',
                                                                type: 'POST',
                                                                data: {
                                                                    date: date,
                                                                    email: email
                                                                },
                                                                success: function (response) {
                                                                    console.log('Status updated successfully');
                                                                    // Optionally update UI or show success message
                                                                    var statusLabel = document.getElementById('status-label-' + key);
                                                                    statusLabel.innerText = "Active";
                                                                    var statusCell = statusLabel.parentNode;
                                                                    statusCell.classList.remove('status-inactive');
                                                                    statusCell.classList.add('status-active');
                                                                },
                                                                error: function (xhr, status, error) {
                                                                    console.error('Error updating status:', error);
                                                                    // Optionally handle error response
                                                                }
                                                            });
                                                        }
    </script>
</html>
