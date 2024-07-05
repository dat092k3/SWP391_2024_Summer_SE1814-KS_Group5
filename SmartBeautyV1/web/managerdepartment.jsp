<%-- 
    Document   : managerdepartment
    Created on : Jul 2, 2024, 1:00:14 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Manager Department</title>
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
            .text-danger {
                color: red;
                margin-left: 5px; /* Để tạo khoảng cách giữa label và * */
            }
        </style>
        <script type="text/javascript">
            var departmentIdToDelete;

            function doDelete(department_id) {
                departmentIdToDelete = department_id;
                $('#deleteConfirmModal').modal('show');
            }

            $(document).ready(function () {
                $('#confirmDelete').click(function () {
                    window.location = "deletedepartment?departmentId=" + departmentIdToDelete;
                });
            });
        </script>
    </head>
    <body>
        <div class="page-wrapper">
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <a style="margin-right: 35%" href="index.jsp" class="btn btn-primary">
                                    <i class="fa fa-home"></i> Home
                                </a>
                                <h2>Manage <b>Department</b></h2>
                                <c:if test="${message != null}">
                                    <p style="color: #5cb85c;">
                                        ${message}
                                    </p>
                                </c:if>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addDepartmentModal"  class="btn btn-success" data-toggle="modal">
                                    <i class="material-icons">&#xE147;</i> 
                                    <span>Add New Department</span>
                                </a>
                                <div class="search-box" style="display: inline-block; float: right;">
                                    <form action="searchdepartment" method="post">
                                        <input id="searchId" type="text" value="${requestScope.searchValue != null ? requestScope.searchValue : ""}" name="search" placeholder="Search department" class="form-control" style="width: 200px; display: inline-block;">
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
                                <th>Department_ID</th>
                                <th>Department_name</th>
                                <th>Manager_id</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody id="content">
                            <c:forEach items="${listDepartment}" var="department">
                                <tr>
                                    <td class="serial-number"></td> 
                                    <td>${department.department_id}</td>
                                    <td>${department.department_name}</td>
                                    <td>${department.manager_id}</td>
                                    <td>
                                        <a href="managedepartment?departmentId=${department.department_id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="###" onclick="doDelete('${department.department_id}')" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
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
            <!-- Add Modal HTML -->
            <div id="addDepartmentModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="adddepartment" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Department</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Name<span class="text-danger">*</span></label>
                                    <input name="namedepartment" value="${requestScope.namedepartment}" type="text" class="form-control" maxlength="255" required>
                                </div>
                                <div class="form-group">
                                    <label>Manager<span class="text-danger">*</span></label>
                                    <select name="manager" class="form-select form-control" aria-label="Default select example">
                                        <option value="">Choose manager</option>
                                        <c:forEach items="${listManager}" var="manager">
                                            <option value="${manager.manager_id}" 
                                                    <c:if test="${manager.manager_id eq selectedManager}">
                                                        selected
                                                    </c:if>
                                                    >${manager.fullName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-success" name="action" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="editDepartmentModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editdepartment" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Department</h4>
                                <c:if test="${message != null}">
                                    <p style="color: #5cb85c;">
                                        ${message}
                                    </p>
                                </c:if>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <input name="departmentId" type="hidden" class="form-control" required value="${department.department_id}">
                            <div class="modal-body">	
                                <div class="form-group">
                                    <label>Name<span class="text-danger">*</span></label>
                                    <input name="namedepartment" value="${department.department_name}" type="text" class="form-control" maxlength="255" required>
                                </div>
                                <div class="form-group">
                                    <label>Manager<span class="text-danger">*</span></label>
                                    <select name="manager" class="form-select form-control" aria-label="Default select example">
                                        <option value="">Choose manager</option>
                                        <c:forEach items="${listManager}" var="manager">
                                            <option value="${manager.manager_id}" <c:if test="${manager.manager_id == department.manager_id}">selected</c:if>>${manager.fullName}</option>
                                        </c:forEach>
                                    </select>
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
            <!-- Delete Modal HTML -->
            <div id="deleteConfirmModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">						
                            <h4 class="modal-title">Confirm Deletion</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to remove this department?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-danger" id="confirmDelete">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
            <c:if test="${showEditDialog}">
                <script>
                    $("#editDepartmentModal").modal('show');
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
        </div>
        <script src="js/pagination.js" type="text/javascript"></script>
        <script src="js/manager.js" type="text/javascript"></script>        
    </body>
</html>
