<%-- 
    Document   : managersupplier
    Created on : June 6, 2024, 9:42:21 PM
    Author     : LENOVO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Manager Supplier</title>
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
                height: 120px;
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
                margin-left: 5px; /* Để tạo khoảng cách giữa label và * */
            }
        </style>
        <script type="text/javascript">
            var supplierIdToDelete;

            function doDelete(supplier_id) {
                supplierIdToDelete = supplier_id;
                $('#deleteConfirmModal').modal('show');
            }

            $(document).ready(function () {
                $('#confirmDelete').click(function () {
                    window.location = "deletesupplier?supplierId=" + supplierIdToDelete;
                });
            });

            function chooseFile(fileInput) {
                if (fileInput.files && fileInput.files[0]) {
                    var file = fileInput.files[0];
                    var fileType = file.type;
                    var validImageTypes = ["image/gif", "image/jpeg", "image/png"];

                    if (!validImageTypes.includes(fileType)) {
                        alert("Only image files (JPG, PNG, GIF) are allowed.");
                        fileInput.value = ""; // Clear the input
                        return;
                    }

                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#image').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(file); // đọc nội dung tệp dưới dạng url
                }
            }
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
                                <h2>Manage <b>Supplier</b></h2>
                                <c:if test="${message != null}">
                                    <p style="color: #5cb85c;">
                                        ${message}
                                    </p>
                                </c:if>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal">
                                    <i class="material-icons">&#xE147;</i> 
                                    <span>Add New Supplier</span>
                                </a>
                                <div class="search-box" style="display: inline-block; float: right;">
                                    <form action="searchsupplier" method="post">
                                        <input id="searchId" type="text" value="${requestScope.searchValue != null ? requestScope.searchValue : ""}" name="search" placeholder="Search supplier" class="form-control" style="width: 200px; display: inline-block;">
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
                                <th>Supplier_ID</th>
                                <th>Supplier_name</th>
                                <th>Image</th>
                                <th>Address</th>
                                <th>Phone Number</th>
                                <th>Email</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody id="content">
                            <c:forEach items="${listSupplier}" var="supplier">
                                <tr>
                                    <td class="serial-number"></td> 
                                    <td>${supplier.supplier_id}</td>
                                    <td>${supplier.supplier_name}</td>
                                    <td>
                                        <img src=".${supplier.image}">
                                    </td>
                                    <td>${supplier.address}</td>
                                    <td>${supplier.phoneNumber}</td>
                                    <td>${supplier.email}</td>
                                    <td>
                                        <a href="managesupplier?supplierId=${supplier.supplier_id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="###" onclick="doDelete('${supplier.supplier_id}')" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
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
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="addsupplier" method="post" enctype="multipart/form-data">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Supplier</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Name<span class="text-danger">*</span></label>
                                    <input name="name" value="${requestScope.name}" type="text" class="form-control" maxlength="255" minlength="1" required>
                                </div>
                                <div class="form-group">
                                    <div class="form-group">
                                        <label>Image<span class="text-danger">*</span></label>
                                        <div class="input-group">
                                            <input type="file" name="img" class="form-control d-none" id="inputGroupFile04" onchange="chooseFile(this)" accept="image/gif,image/jpeg,image/png" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                            <label for="inputGroupFile04"><img src=".${supplier.image}" id="image" class="img-thumbnail rounded-5" width="100%" alt="${supplier.image}"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="labels">Address<span class="text-danger">*</span></label>
                                    <input name="address" value="${requestScope.address}" type="text" class="form-control" maxlength="255" minlength="1" required>
                                </div>
                                <div class="form-group">
                                    <label>Phone number<span class="text-danger">*</span></label>
                                    <input name="phonenumber" value="${requestScope.phonenumber}" type="text" class="form-control"  required />
                                </div>
                                <div class="form-group">
                                    <label>Email<span class="text-danger">*</span></label>
                                    <input name="email" type="text" ${requestScope.email} class="form-control" maxlength="255" minlength="1" required />
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
            <div id="editEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editsupplier" method="post" enctype="multipart/form-data">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Supplier</h4>
                                <c:if test="${message != null}">
                                    <p style="color: #5cb85c;">
                                        ${message}
                                    </p>
                                </c:if>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <input name="supplierId" type="hidden" class="form-control" required value="${supplier.supplier_id}">
                            <div class="modal-body">	
                                <div class="form-group">
                                    <label>Name<span class="text-danger">*</span></label>
                                    <input name="name" type="text" class="form-control" required value="${supplier.supplier_name}">
                                </div>
                                <div class="form-group">
                                    <label>Image<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <input type="file" name="img" class="form-control d-none" id="inputGroupFile04" onchange="chooseFile(this)" accept="image/gif,image/jpeg,image/png" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                        <label for="inputGroupFile04"><img src=".${supplier.image}" id="image" class="img-thumbnail rounded-5" width="100%" alt="${supplier.image}"></label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Address<span class="text-danger">*</span></label>
                                    <input name="address" type="text" class="form-control" required value="${supplier.address}">
                                </div>
                                <div class="form-group">
                                    <label>Phone number<span class="text-danger">*</span></label>
                                    <input name="phonenumber" type="text" class="form-control" required  value="${supplier.phoneNumber}"/>
                                </div>
                                <div class="form-group">
                                    <label>Email<span class="text-danger">*</span></label>
                                    <input name="email" type="text" class="form-control" required  value="${supplier.email}"/>
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
                            <p>Are you sure you want to remove this provider?</p>
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
                    $("#editEmployeeModal").modal('show');

                    document.addEventListener('DOMContentLoaded', function () {
                        const rows = document.querySelectorAll('#content tr');
                        rows.forEach((row, index) => {
                            row.querySelector('.serial-number').textContent = index + 1;
                        });
                    });
                </script>
            </c:if>
        </div>
        <script src="js/pagination.js" type="text/javascript"></script>
        <script src="js/manager.js" type="text/javascript"></script>  
    </body>
</html>
