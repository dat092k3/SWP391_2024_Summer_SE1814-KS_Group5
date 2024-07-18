<%-- 
    Document   : managereport
    Created on : Jul 13, 2024, 10:28:52 PM
    Author     : LENOVO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Manager Report</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="styles/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            #pagination {
                margin-top: 20px;
            }
            .pagination-btn {
                margin: 0 2px;
            }
            .pagination-btn.active {
                background-color: #fff;
                color: black;
            }
        </style>
    </head>
    <body>
        <div class="page-wrapper">
            <div class="container" style="width: 80%; margin: auto; height: 90%">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <a style="margin-right: 35%" href="index.jsp" class="btn btn-primary">
                                    <i class="fa fa-home"></i> Home
                                </a>
                                <h2>Manage <b>Report</b></h2>
                                <c:if test="${message != null}">
                                    <p style="color: #5cb85c;">
                                        ${message}
                                    </p>
                                </c:if>
                            </div>
                            <div class="col-sm-6">
                                <div class="search-box" style="display: inline-block; float: right;">
                                    <form action="searchreport" method="post">
                                        <input id="searchId" type="text" value="${requestScope.searchValue != null ? requestScope.searchValue : ""}" name="search" placeholder="Search report" class="form-control" style="width: 200px; display: inline-block;">
                                        <button type="submit" class="btn btn-primary" style="display: inline-block;">
                                            Search
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Report_ID</th>
                                <th>Report_name</th>
                                <th>Description</th>
                                <th>Date Report</th>
                                <th>Manager_name</th>
                                <th>Status</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody id="content">
                            <c:forEach items="${listReport}" var="report">
                                <tr>
                                    <td class="serial-number"></td> 
                                    <td>${report.report_id}</td>
                                    <td>${report.report_name}</td>
                                    <td>${report.description} </td>
                                    <td>${report.date}</td>
                                    <td>${report.manager_name}</td>
                                    <td>${report.status}</td>
                                    <td>
                                        <c:if test="${sessionScope.role eq 'Director'}">
                                            <a href="updatereport?reportId=${report.report_id}" class="edit" data-toggle="modal"><i class="fa fa-check" data-toggle="tooltip" title="Confirm"></i></a>
                                            <a href="refuse?reportId=${report.report_id}" class="edit" data-toggle="modal"><i class="fa fa-times" data-toggle="tooltip" title="Refuse"></i></a>
                                            </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div id="pagination" class="text-center">
                        <!-- Pagination controls will be inserted here by JavaScript -->
                    </div>
                </div>
            </div>
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    const rows = document.querySelectorAll('#content tr');
                    rows.forEach((row, index) => {
                        row.querySelector('.serial-number').textContent = index + 1;
                    });
                });
            </script>
            <script src="js/pagination.js" type="text/javascript"></script>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>  
    </body>
</html>

