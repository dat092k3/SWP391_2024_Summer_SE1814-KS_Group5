<%-- 
Document   : managerEquipment
Created on : June 8, 2024, 9:34:21 PM
Author     : LENOVO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Manager Manager</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="styles/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 150px;
                height: 130px;
            }
            .error-message {
                color: red;
                display: none;
            }
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
            .text-danger {
                color: red;
                margin-left: 5px; 
            }
        </style>
    </head>
    <body>
        <div class="page-wrapper">
            <div class="container" style="width: 80%; margin: auto; height: 90%">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row" >
                            <div class="col-sm-6">
                                <a style="margin-right: 35%" href="index.jsp" class="btn btn-primary">
                                    <i class="fa fa-home"></i> Home
                                </a>
                                <h2>Manage <b> Manager</b></h2>
                                <c:if test="${message != null}">
                                    <p style="color: #5cb85c;">
                                        ${message}
                                    </p>
                                </c:if>
                                <c:if test="${messageerror != null}">
                                    <p style="color: red;">
                                        ${messageerror}
                                    </p>
                                </c:if>
                            </div>
                            <div class="col-sm-6">
                                <div class="search-box" style="display: inline-block; float: right;">
                                    <form action="searchmanager">
                                        <input id="searchId" type="text" value="${requestScope.searchValue != null ? requestScope.searchValue : ""}" name="search" placeholder="Search manager" class="form-control" style="width: 200px; display: inline-block;">
                                        <button type="submit" class="btn btn-primary" style="display: inline-block;">
                                            Search
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table  class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Manager_ID</th>
                                <th>Manager_fullname</th>
                                <th>Image</th>
                                <th>Gender</th>
                                <th>Salary</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody id="content">
                            <c:forEach items="${listManager}" var="manager">
                                <tr>
                                    <td class="serial-number"></td> 
                                    <td>${manager.manager_id}</td>
                                    <td>${manager.fullName}</td>
                                    <td>
                                        <img src=".${manager.image}">
                                    </td>
                                    <td>${manager.gender}</td>
                                    <td>${manager.salary}$</td>
                                    <td>
                                        <a href="managemanager?managerId=${manager.manager_id}&accountId=${manager.account_id}" class="edit" data-toggle="modal">
                                            <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                        </a>
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
            <!-- Edit Modal HTML -->
            <div id="editManagerModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editmanager" method="post" enctype="multipart/form-data">
                            <div class="modal-header">
                                <h4 class="modal-title">Edit Manager</h4>
                                <c:if test="${message != null}">
                                    <p style="color: #5cb85c;">
                                        ${message}
                                    </p>
                                </c:if>
                                <c:if test="${messageerror != null}">
                                    <p style="color: red;">
                                        ${messageerror}
                                    </p>
                                </c:if>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <input name="accountId" type="hidden" class="form-control" required value="${manager.account_id}"/>
                            <input name="managerId" type="hidden" class="form-control" required value="${manager.manager_id}"/>
                            <div class="modal-body">  
                                <div class="form-group">
                                    <label>Salary<span class="text-danger">*</span></label>
                                    <input name="salary" value="${manager.salary}" type="number" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>New Salary<span class="text-danger">*</span></label>
                                    <input name="newsalary" type="number" class="form-control" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-info" name="action" value="Save">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <c:if test="${showEditDialog}">
                <script>
                    $("#editManagerModal").modal('show');

                    document.addEventListener('DOMContentLoaded', function () {
                        const rows = document.querySelectorAll('#content tr');
                        rows.forEach((row, index) => {
                            row.querySelector('.serial-number').textContent = index + 1;
                        });
                    });
                </script>
            </c:if>
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
