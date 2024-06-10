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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="styles/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 150px;
                height: 120px;
            }
        </style>
        <script type="text/javascript">
            function doDelete(equipment_id) {
                if (confirm("Are you sure to delete equipment")) {
                    window.location = "manageequipment?action=delete&equipmentId=" + equipment_id;
                }
            }
        </script>
    <body>
        <div class="page-wrapper">
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <a style="color: red" href="index.jsp">Home</a>
                                <h2>Manage <b>Equipment</b></h2>
                                <c:if test="${message != null}">
                                    <p style="color: #5cb85c;">
                                        ${message}
                                    </p>
                                </c:if>
                            </div>
                            <div class="col-sm-6">
                                <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Equipment</span></a>
                                <div class="search-box">
                                    <form action="manageequipment" method="get">
                                        <input type="text" name="search" placeholder="Search equipment...">
                                        <button type="submit">Search</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Supplier_ID</th>
                                <th>Supplier_name</th>
                                <th>Price</th>
                                <th>Image</th>
                                <th>Quantity</th>
                                <th>Description</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listEquipment}" var="equipment">
                                <tr>
                                    <td>${equipment.equipment_id}</td>
                                    <td>${equipment.equipment_name}</td>
                                    <td>${equipment.price}</td>
                                    <td>
                                        <img src=".${equipment.image}">
                                    </td>
                                    <td>${equipment.quantity}</td>
                                    <td>${equipment.description}</td>
                                    <td>
                                        <a href="manageequipment?equipmentId=${equipment.equipment_id}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="###" onclick="doDelete('${equipment.equipment_id}')" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Edit Modal HTML -->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="manageequipment" method="post" enctype="multipart/form-data">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Equipment</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="name" type="text" class="form-control" required >
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="price" type="number" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input name="img" type="file" accept="image/*"  class="form-control" required>
                                </div> 
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input name="quantity" type="number" class="form-control" required />
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required ></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Type of Equipment</label>
                                    <select name="typeofequipment" class="form-select form-control" aria-label="Default select example">
                                        <c:forEach items="${allTypeofEquipment}" var="typeofequipment">
                                            <option value="${typeofequipment.type_id}">${typeofequipment.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Supplier</label>
                                    <select name="supplier" class="form-select form-control" aria-label="Default select example">
                                        <c:forEach items="${listSupplier}" var="supplier">
                                            <option value="${supplier.supplier_id}">${supplier.supplier_name}</option>
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
                        <form action="manageequipment" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Supplier</h4>
                                <c:if test="${message != null}">
                                    <p style="color: #5cb85c;">
                                        ${message}
                                    </p>
                                </c:if>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <input name="supplierId" type="hidden" class="form-control" required value="${equipment.equipment_id}">
                            <div class="modal-body">	
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="nameequipment" type="text" class="form-control" required="" value="${equipment_equipment_name}">
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="price" type="number" class="form-control" required value="${equipment.price}">
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input name="img" type="file" accept="image/*"  class="form-control" value="${equipment.image}" required>
                                </div> 
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input name="quantity" type="number" class="form-control" value="${equipment.quantity}" required />
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required >${equipment.description}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Type of Equipment</label>
                                    <select name="typeofequipment" class="form-select form-control" aria-label="Default select example">
                                        <c:forEach items="${allTypeofEquipment}" var="typeofequipment">
                                            <option value="${typeofequipment.type_id}" <c:if test="${typeofequipment.type_id == equipment.type_id}">selected</c:if>>${typeofequipment.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Supplier</label>
                                    <select name="supplier" class="form-select form-control" aria-label="Default select example">
                                        <c:forEach items="${listSupplier}" var="supplier">
                                            <option value="${supplier.supplier_id}" <c:if test="${supplier.supplier_id == equipment.supplier_id}">selected</c:if>>${supplier.supplier_name}</option>
                                        </c:forEach>
                                    </select>
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
                $("#editEmployeeModal").modal('show');
            </script>
        </c:if>
    </div>
    <script src="js/manager.js" type="text/javascript"></script>        
</body>
</html>