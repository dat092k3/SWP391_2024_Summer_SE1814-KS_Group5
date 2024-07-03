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
            var managerIdToDelete;
            var accountIdToDelete;

            function doDelete(manager_id, account_id) {
                managerIdToDelete = manager_id;
                accountIdToDelete = account_id;
                $('#deleteConfirmModal').modal('show');
            }

            $(document).ready(function () {
                $('#confirmDelete').click(function () {
                    window.location = "deletemanager?managerId=" + managerIdToDelete + "&accountId=" + accountIdToDelete;
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
                    };
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
                                <h2>Manage <b> Manager</b></h2>
                                <c:if test="${message != null}">
                                    <p style="color: #5cb85c;">
                                        ${message}
                                    </p>
                                </c:if>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addManagerModal" class="btn btn-success" data-toggle="modal">
                                    <i class="material-icons">&#xE147;</i> 
                                    <span>Add New Manager</span>
                                </a>
                                <div class="search-box" style="display: inline-block; float: right;">
                                    <form action="searchmanager" method="post">
                                        <input id="searchId" type="text" value="${requestScope.searchValue != null ? requestScope.searchValue : ""}" name="search" placeholder="Search manager" class="form-control" style="width: 200px; display: inline-block;">
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
                                <th>Manager_ID</th>
                                <th>Manager_fullname</th>
                                <th>Image</th>
                                <th>Gender</th>
                                <th>Email</th>
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
                                    <td>${manager.email}</td>
                                    <td>${manager.salary}</td>
                                    <td>
                                        <a href="managemanager?managerId=${manager.manager_id}&accountId=${manager.account_id}" class="edit" data-toggle="modal">
                                            <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                        </a>
                                        <a href="###" onclick="doDelete('${manager.manager_id}', '${manager.account_id}')" class="delete" data-toggle="modal">
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
            <div id="addManagerModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="addmanager" method="post" enctype="multipart/form-data">
                            <div class="modal-header">
                                <h4 class="modal-title">Add Manager</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Username<span class="text-danger">*</span></label>
                                    <input name="username" type="text" class="form-control" minlength="1" maxlength="255" required value="${requestScope.name}">
                                </div>
                                <div class="form-group">
                                    <label>Password<span class="text-danger">*</span></label>
                                    <input name="password" type="password" class="form-control" minlength="3" maxlength="50" required value="${requestScope.password}">
                                </div>
                                <div class="form-group">
                                    <label>Name<span class="text-danger">*</span></label>
                                    <input value="${requestScope.namemanager}" name="namemanager" type="text" class="form-control" maxlength="255" required>
                                </div>
                                <div class="form-group">
                                    <label>Image<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <input type="file" name="img" class="form-control d-none" id="inputGroupFile04" onchange="chooseFile(this)" accept="image/gif,image/jpeg,image/png" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                        <label for="inputGroupFile04"><img src=".${manager.image}" id="image" class="img-thumbnail rounded-5" width="100%" alt="${manager.image}"></label>
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <label>Gender<span class="text-danger">*</span></label>
                                    <select name="gender" class="form-select form-control" aria-label="Default select example">
                                        <option value="">Choose gender</option>
                                        <option value="Nam" 
                                                <c:if test="${selectedGender eq 'Nam'}">selected</c:if>
                                                    >Nam</option>
                                                <option value="Nữ" 
                                                <c:if test="${selectedGender eq 'Nữ'}">selected</c:if>
                                                    >Nữ</option>
                                        </select>
                                    </div>  
                                    <div class="form-group">
                                        <label>Email<span class="text-danger">*</span></label>
                                        <input name="email" value="${requestScope.email}"  type="text" class="form-control" maxlength="255" required>
                                </div>
                                <div class="form-group">
                                    <label>Date of Birth<span class="text-danger">*</span></label>
                                    <input name="dateofbirth" type="date"  pattern="^\S.*$" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Phone number<span class="text-danger">*</span></label>
                                    <input name="phonenumber" value="${requestScope.phonenumber}" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Address<span class="text-danger">*</span></label>
                                    <input name="address" type="text" class="form-control"  maxlength="255" required>
                                </div>
                                <div class="form-group">
                                    <label>Hire Date<span class="text-danger">*</span></label>
                                    <input name="hiredate" value="${requestScope.hiredate}" type="date" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Salary<span class="text-danger">*</span></label>
                                    <input name="salary" value="${requestScope.salary}" type="number" step="0.01" class="form-control" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-info" name="action" value="Create manager">
                            </div>
                        </form>
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
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <input name="accountId" type="hidden" class="form-control" required value="${manager.account_id}"/>
                            <input name="managerId" type="hidden" class="form-control" required value="${manager.manager_id}"/>
                            <div class="modal-body">                               
                                <div class="form-group">
                                    <label>Name<span class="text-danger">*</span></label>
                                    <input value="${manager.fullName}" name="namemanager" type="text" class="form-control" maxlength="255" required>
                                </div>
                                <div class="form-group">
                                    <label>Image<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <input type="file" name="img" class="form-control d-none" id="inputGroupFile04" onchange="chooseFile(this)" accept="image/gif,image/jpeg,image/png" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                        <label for="inputGroupFile04"><img src=".${manager.image}" id="image" class="img-thumbnail rounded-5" width="100%" alt="${manager.image}"></label>
                                    </div>
                                </div> 
                                <div class="form-group">
                                    <label>Gender<span class="text-danger">*</span></label>
                                    <select name="gender" class="form-select form-control" aria-label="Default select example">
                                        <option value="">Choose gender</option>
                                        <option value="Nam" 
                                                <c:if test="${manager.gender eq 'Nam'}">selected</c:if>
                                                    >Nam</option>
                                                <option value="Nữ" 
                                                <c:if test="${manager.gender eq 'Nữ'}">selected</c:if>
                                                    >Nữ</option>
                                        </select>
                                    </div>  
                                    <div class="form-group">
                                        <label>Email<span class="text-danger">*</span></label>
                                        <input name="email" value="${manager.email}"  type="text" class="form-control" maxlength="255" required>
                                </div>
                                <div class="form-group">
                                    <label>Date of Birth<span class="text-danger">*</span></label>
                                    <input name="dateofbirth" value="${manager.dateOfBirth}"  type="date"  pattern="^\S.*$" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Phone number<span class="text-danger">*</span></label>
                                    <input name="phonenumber" value="${manager.phoneNumber}" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Address<span class="text-danger">*</span></label>
                                    <input name="address" value="${manager.address}" type="text" class="form-control"  maxlength="255" required>
                                </div>
                                <div class="form-group">
                                    <label>Hire Date<span class="text-danger">*</span></label>
                                    <input name="hiredate" value="${manager.hireDate}" type="date" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Salary<span class="text-danger">*</span></label>
                                    <input name="salary" value="${manager.salary}" type="number" step="0.01" class="form-control" required>
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
                            <p>Are you sure you want to erase this manager?</p>
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
                    $("#editManagerModal").modal('show');
                </script>
            </c:if>
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    const rows = document.querySelectorAll('#content tr');
                    rows.forEach((row, index) => {
                        row.querySelector('.serial-number').textContent = index + 1;
                    });
                });

                document.addEventListener('DOMContentLoaded', function () {
                    const rows = document.querySelectorAll('#content tr');
                    const rowsPerPage = 5;
                    let currentPage = 1;

                    function displayPage(page) {
                        const start = (page - 1) * rowsPerPage;
                        const end = start + rowsPerPage;

                        rows.forEach((row, index) => {
                            if (index >= start && index < end) {
                                row.style.display = '';
                            } else {
                                row.style.display = 'none';
                            }
                        });

                        updatePagination();
                    }

                    function updatePagination() {
                        const totalPages = Math.ceil(rows.length / rowsPerPage);
                        const pagination = document.getElementById('pagination');
                        pagination.innerHTML = '';

                        for (let i = 1; i <= totalPages; i++) {
                            const button = document.createElement('button');
                            button.innerText = i;
                            button.classList.add('btn', 'btn-primary', 'pagination-btn');
                            if (i === currentPage) {
                                button.classList.add('active');
                            }
                            button.addEventListener('click', function () {
                                currentPage = i;
                                displayPage(i);
                            });
                            pagination.appendChild(button);
                        }
                    }

                    displayPage(currentPage);

                    // Updating serial numbers
                    rows.forEach((row, index) => {
                        row.querySelector('.serial-number').textContent = index + 1;
                    });
                });
            </script>    

        </div>
        <script src="js/manager.js" type="text/javascript"></script>        
    </body>
</html>
