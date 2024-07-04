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
        <title>Manager Equipment</title>
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
                margin-left: 5px; /* Để tạo khoảng cách giữa label và * */
            }
        </style>
        <script type="text/javascript">
            var equipmentIdToDelete;

            function doDelete(equipment_id) {
                equipmentIdToDelete = equipment_id;
                $('#deleteConfirmModal').modal('show');
            }

            $(document).ready(function () {
                $('#confirmDelete').click(function () {
                    window.location = "deleteequippment?equipmentId=" + equipmentIdToDelete;
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
                                <h2>Manage <b>Equipment</b></h2>
                                <c:if test="${message != null}">
                                    <p style="color: #5cb85c;">
                                        ${message}
                                    </p>
                                </c:if>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
                                    <i class="material-icons">&#xE147;</i> 
                                    <span>Add New Equipment</span>
                                </a>
                                <div class="search-box" style="display: inline-block; float: right;">
                                    <form action="searchequipment" method="post">
                                        <input id="searchId" type="text" value="${requestScope.searchValue != null ? requestScope.searchValue : ""}" name="search" placeholder="Search equipment" class="form-control" style="width: 200px; display: inline-block;">
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
                                <th>Equipment_ID</th>
                                <th>Equipment_name</th>
                                <th>Price</th>
                                <th>Image</th>
                                <th>Quantity</th>
                                <th>Description</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody id="content">
                            <c:forEach items="${listEquipment}" var="equipment">
                                <tr>
                                    <td class="serial-number"></td> 
                                    <td>${equipment.equipment_id}</td>
                                    <td>${equipment.equipment_name}</td>
                                    <td>${equipment.price} $</td>
                                    <td>
                                        <img src=".${equipment.image}">
                                    </td>
                                    <td>${equipment.quantity}</td>
                                    <td>${equipment.description}</td>
                                    <td>
                                        <a href="manageequipment?equipmentId=${equipment.equipment_id}"  class="edit" data-toggle="modal">
                                            <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                        </a>
                                        <a href="###" onclick="doDelete('${equipment.equipment_id}')" class="delete" data-toggle="modal">
                                            <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
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
            <!-- Add Modal HTML -->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="addequipment" method="post" enctype="multipart/form-data">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Equipment</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Name<span class="text-danger">*</span></label>
                                    <input value="${requestScope.nameequipment}" name="nameequipment" type="text" class="form-control" maxlength="255" required>
                                </div>
                                <div class="form-group">
                                    <label>Price<span class="text-danger">*</span></label>
                                    <input name="price" value="${requestScope.price}" type="number" min="1" class="form-control" required>
                                    <div class="error-message" id="price-error">Price must be at least 1</div>
                                </div>
                                <div class="form-group">
                                    <label>Image<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <input type="file" name="img" class="form-control d-none" id="inputGroupFile04" onchange="chooseFile(this)" accept="image/gif,image/jpeg,image/png" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                        <label for="inputGroupFile04"><img src=".${equipment.image}" id="image" class="img-thumbnail rounded-5" width="100%" alt="${equipment.image}"></label>
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <label>Quantity<span class="text-danger">*</span></label>
                                    <input name="quantity" type="number" min="1" class="form-control" value="${requestScope.quantity}" required>
                                    <div class="error-message" id="quantity-error">Quantity must be at least 1</div>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required>${requestScope.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Type of Equipment<span class="text-danger">*</span></label>
                                    <select name="typeofequipment" class="form-select form-control" aria-label="Default select example">
                                        <option value="">Choose type</option>
                                        <c:forEach items="${allTypeofEquipment}" var="typeofequipment">
                                            <option value="${typeofequipment.type_id}" 
                                                    <c:if test="${typeofequipment.type_id eq selectedType}">
                                                        selected
                                                    </c:if>
                                                    >${typeofequipment.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Supplier<span class="text-danger">*</span></label>
                                    <select name="supplier" class="form-select form-control" aria-label="Default select example">
                                        <option value="">Choose supplier</option>
                                        <c:forEach items="${listSupplier}" var="supplier">
                                            <option value="${supplier.supplier_id}" 
                                                    <c:if test="${supplier.supplier_id eq selectedSupplier}">
                                                        selected
                                                    </c:if>
                                                    >${supplier.supplier_name}</option>
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
            <div id="editEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="editequipment" method="post" enctype="multipart/form-data">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Equipment</h4>
                                <c:if test="${message != null}">
                                    <p style="color: #5cb85c;">
                                        ${message}
                                    </p>
                                </c:if>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <input name="equipmentId" type="hidden" class="form-control" required value="${equipment.equipment_id}"/>
                            <div class="modal-body">	
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="nameequipment" type="text" class="form-control" required="" value="${equipment.equipment_name}"/>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="price" type="number" min="1" class="form-control" required value="${equipment.price}"/>
                                    <div class="error-message" id="price-error">Price must be at least 1</div>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <div class="input-group">
                                        <input type="file" name="img" class="form-control d-none" id="inputGroupFile04" onchange="chooseFile(this)" accept="image/gif,image/jpeg,image/png" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                        <label for="inputGroupFile04"><img src=".${equipment.image}" id="image" class="img-thumbnail rounded-5" width="100%" alt="${equipment.image}"></label>
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input name="quantity" type="number" min="1" class="form-control" value="${equipment.quantity}" required/>
                                    <div class="error-message" id="quantity-error">Quantity must be at least 1</div>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required>${equipment.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Type of Equipment</label>
                                    <select name="typeofequipment" class="form-select form-control" aria-label="Default select example">
                                        <option value="">Choose type</option>
                                        <c:forEach items="${allTypeofEquipment}" var="typeofequipment">
                                            <option value="${typeofequipment.type_id}" <c:if test="${typeofequipment.type_id == equipment.type_id}">selected</c:if>>${typeofequipment.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Supplier</label>
                                    <select name="supplier" class="form-select form-control" aria-label="Default select example">
                                        <option value="">Choose supplier</option>
                                        <c:forEach items="${listSupplier}" var="supplier">
                                            <option value="${supplier.supplier_id}" <c:if test="${supplier.supplier_id == equipment.supplier_id}">selected</c:if>>${supplier.supplier_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                    <input type="submit" class="btn btn-info" name="action" value="Save">
                                </div>
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
                            <p>Are you sure you want to erase this device?</p>
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
                </script>
            </c:if>
            <script>
                document.addEventListener('DOMContentLoaded', (event) => {
                    const priceInput = document.querySelector('input[name="price"]');
                    const quantityInput = document.querySelector('input[name="quantity"]');
                    const priceError = document.getElementById('price-error');
                    const quantityError = document.getElementById('quantity-error');

                    priceInput.addEventListener('input', () => {
                        if (priceInput.value < 1) {
                            priceError.style.display = 'block';
                        } else {
                            priceError.style.display = 'none';
                        }
                    });

                    quantityInput.addEventListener('input', () => {
                        if (quantityInput.value < 1) {
                            quantityError.style.display = 'block';
                        } else {
                            quantityError.style.display = 'none';
                        }
                    });
                });


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
