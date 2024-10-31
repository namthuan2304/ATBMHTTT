<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi-VN">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>${title}</title>
    <link href="/assets/admin/img/icon/icon-logo.png" rel="shortcut icon">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/assets/admin/plugins/bootstrap/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="/assets/admin/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="/assets/admin/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/assets/admin/css/font-awesome.min.css">


    <!-- Datatables CSS -->
    <link rel="stylesheet" href="/assets/admin/plugins/datatables/datatables.min.css">

    <!-- Animate CSS -->
    <link rel="stylesheet" href="/assets/admin/css/animate.min.css">


    <!-- Main CSS -->
    <link rel="stylesheet" href="/assets/admin/css/admin.css">

</head>

<body>
<div class="main-wrapper">
    <%@include file="/WEB-INF/admin/include/menu.jsp" %>

    <div class="page-wrapper">
        <div class="content container-fluid">

            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">
                            <c:choose>
                                <c:when test="${param.type eq 'add'}">Thêm sản phẩm</c:when>
                                <c:when test="${param.type eq 'edit'}">Sửa sản phẩm</c:when>
                                <c:otherwise>Quản lí sản phẩm</c:otherwise>
                            </c:choose>
                        </h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="product">Sản phẩm</a></li>
                            <li class="breadcrumb-item active">
                                <c:choose>
                                    <c:when test="${param.type eq 'add'}">Thêm mới</c:when>
                                    <c:when test="${param.type eq 'edit'}">Chỉnh sửa</c:when>
                                    <c:otherwise>Danh sách</c:otherwise>
                                </c:choose>
                            </li>
                        </ul>
                        <span style="color: red;margin-bottom: 10px" id="error"></span>
                    </div>
                    <c:if test="${param.type == 'add' || param.type == null}">
                        <div class="col-auto text-right">
                            <a href="product?type=add" class="btn btn-primary add-button ml-3">
                                <i class="fas fa-plus"></i>
                            </a>
                        </div>
                    </c:if>
                </div>
            </div>
            <!-- /Page Header -->

            <div class="row">
                <div class="col-md-12">
                    <div class="card">

                        <div class="card-body">
                            <!-- Form show -->
                            <c:if test="${type.equals('list') || param.type == null}">
                                <div class="table-responsive">
                                    <table class="table table-hover table-center mb-0 datatable">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Ảnh</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Giá bán</th>
                                            <th>Số lượng</th>
                                            <th>ID nhà cung cấp</th>
                                            <th class="text-right">Hành Động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="entry" items="${products}">
                                            <c:set var="product" value="${entry.key}"/>
                                            <c:set var="images" value="${entry.value}"/>
                                            <tr class="product-item" data-id="${product.id}">
                                                <td>${product.id}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty images}">
                                                            <img class="rounded service-img mr-1"
                                                                 src="${pageContext.request.contextPath}${entry.value[0]}"
                                                                 alt="Hình ảnh sản phẩm">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img class="rounded service-img mr-1"
                                                                 src="${pageContext.request.contextPath}/default-image-url"
                                                                 alt="Hình ảnh mặc định">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${product.productName}</td>
                                                <td>${product.price} VND</td>
                                                <td>${product.quantity}</td>
                                                <td>${product.supplier.getId()}</td>
                                                <td class="text-right">
                                                    <a href="product?type=edit&id=${product.id}"
                                                       class="btn btn-sm bg-success-light edit-product ">
                                                        <i class="far fa-edit mr-1"></i> Sửa
                                                    </a>
                                                    <button class="btn btn-outline-danger btn-sm text-danger delete-product"
                                                            data-id="${product.id}">
                                                        <i class="fa fa-trash-o"></i> Xóa
                                                    </button>


                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                            <!-- /Form -->

                            <!-- Form add -->
                            <c:if test="${type.equals('add')}">
                                <div class="form-group" style="display: none">
                                    <input class="form-control" type="text" value="add" name="type" required>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Tên sản phẩm</label>
                                    <div class="col-md-10">
                                        <input id="add-productName" name="productName" type="text" class="form-control"
                                               required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Giá sản phẩm</label>
                                    <div class="col-md-10">
                                        <input id="add-price" name="price" type="text" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Danh mục</label>
                                    <div class="col-md-10">
                                        <input id="add-categoryId" name="categoryId" type="text" class="form-control"
                                               required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Số lượng</label>
                                    <div class="col-md-10">
                                        <input id="add-quantity" name="quantity" type="text" class="form-control"
                                               required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Công dụng</label>
                                    <div class="col-md-10">
                                        <input id="add-purpose" name="purpose" type="text" class="form-control"
                                               required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Chỉ định</label>
                                    <div class="col-md-10">
                                        <input id="add-contraindications" name="contraindications" type="text"
                                               class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Thành phần</label>
                                    <div class="col-md-10">
                                        <input id="add-ingredients" name="ingredients" type="text" class="form-control"
                                               required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Liều lượng</label>
                                    <div class="col-md-10">
                                        <input id="add-dosage" name="dosage" type="text" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Hướng dẫn</label>
                                    <div class="col-md-10">
                                        <input id="add-instructions" name="instructions" type="text"
                                               class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Thời hạn sử dụng</label>
                                    <div class="col-md-10">
                                        <input id="add-warrantyPeriod" name="warrantyPeriod" type="text"
                                               class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Điều kiện bảo quản</label>
                                    <div class="col-md-10">
                                        <input id="add-storageCondition" name="storageCondition" type="text"
                                               class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">ID loại sản phẩm</label>
                                    <div class="col-md-10">
                                        <input id="add-typeId" name="typeId" type="text" class="form-control" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">ID nhà cung cấp</label>
                                    <div class="col-md-10">
                                        <input id="add-supplierId" name="supplierId" type="text" class="form-control"
                                               required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Hoạt động</label>
                                    <div class="col-md-10">
                                        <select class="form-control" id="add-active" name="active" required>
                                            <option value="true">Có</option>
                                            <option value="false">Không</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <button class="btn btn-primary add-product">Lưu</button>
                                    <a href="product" class="btn btn-link">Hủy</a>
                                </div>
                            </c:if>
                            <!-- /Form -->

                            <!-- Form edit -->
                            <c:if test="${type.equals('edit')}">
                                <div class="form-group" style="display: none">
                                    <input class="form-control" type="text" value="add" name="type" required>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Mã sản phẩm</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="productId" value="${product.id}"
                                               readonly>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Tên sản phẩm</label>
                                    <div class="col-md-10">
                                        <input id="edit-productName" name="productName" type="text" class="form-control"
                                               value="${product.productName}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Danh mục</label>
                                    <div class="col-md-10">
                                        <input id="edit-categoryId" name="categoryId" type="number" class="form-control"
                                               value="${product.cate.id}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Giá</label>
                                    <div class="col-md-10">
                                        <input id="edit-price" name="price" type="text" class="form-control"
                                               value="${product.price}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Số Lượng</label>
                                    <div class="col-md-10">
                                        <input id="edit-quantity" name="quantity" type="number" class="form-control"
                                               value="${product.quantity}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Công dụng</label>
                                    <div class="col-md-10">
                                        <input id="edit-purpose" name="purpose" type="text" class="form-control"
                                               value="${product.purpose}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Chỉ định</label>
                                    <div class="col-md-10">
                                        <input id="edit-contraindications" name="contraindications" type="text"
                                               class="form-control" value="${product.contraindications}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Thành phần</label>
                                    <div class="col-md-10">
                                        <input id="edit-ingredients" name="ingredients" type="text" class="form-control"
                                               value="${product.ingredients}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Liều lượng</label>
                                    <div class="col-md-10">
                                        <input id="edit-dosage" name="dosage" type="text" class="form-control"
                                               value="${product.dosage}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Hướng dẫn</label>
                                    <div class="col-md-10">
                                        <input id="edit-instructions" name="instructions" type="text"
                                               class="form-control" value="${product.instructions}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Thời hạn sử dụng</label>
                                    <div class="col-md-10">
                                        <input id="edit-warrantyPeriod" name="warrantyPeriod" type="text"
                                               class="form-control" value="${product.warrantyPeriod}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Bảo quản</label>
                                    <div class="col-md-10">
                                        <input id="edit-storageCondition" name="storageCondition" type="text"
                                               class="form-control" value="${product.storageCondition}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Loại sản phẩm</label>
                                    <div class="col-md-10">
                                        <input id="edit-typeId" name="typeId" type="number" class="form-control"
                                               value="${product.type.id}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">ID NCC</label>
                                    <div class="col-md-10">
                                        <input id="edit-supplierId" name="supplierId" type="number" class="form-control"
                                               value="${product.supplier.id}" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Hoạt động</label>
                                    <div class="col-md-10">
                                        <select class="form-control" id="edit-active" name="active" required>
                                            <option value="true" ${product.active ? 'selected' : ''}>Có</option>
                                            <option value="false" ${!product.active ? 'selected' : ''}>Không</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="mt-4">
                                    <button class="btn btn-primary edit-product">Lưu thay đổi</button>
                                    <a href="product" class="btn btn-link">Hủy</a>
                                </div>

                            </c:if>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- jQuery -->
<script src="/assets/admin/js/jquery-3.5.0.min.js"></script>

<script>
    var context = "${pageContext.request.contextPath}";

    $(document).ready(function () {
        $('.edit-product').click(function (event) {
            var id = '${param.id}';
            var productName = $('#edit-productName').val();
            var categoryId = $('#edit-categoryId').val();
            var price = $('#edit-price').val();
            var quantity = $('#edit-quantity').val();
            var purpose = $('#edit-purpose').val();
            var contraindications = $('#edit-contraindications').val();
            var ingredients = $('#edit-ingredients').val();
            var dosage = $('#edit-dosage').val();
            var instructions = $('#edit-instructionst').val();
            var warrantyPeriod = $('#edit-warrantyPeriod ').val();
            var storageCondition = $('#edit-storageCondition').val();
            var typeId = $('#edit-typeId').val();
            var supplierId = $('#edit-supplierId').val();
            var active = $('#edit-active').val();
            $.ajax({
                type: 'POST',
                url: context + '/admin/product',
                data: {
                    action: "edit",
                    id: id,
                    productName: productName,
                    categoryId: categoryId,
                    price: price,
                    quantity: quantity,
                    purpose: purpose,
                    contraindications: contraindications,
                    ingredients: ingredients,
                    dosage: dosage,
                    instructions: instructions,
                    warrantyPeriod: warrantyPeriod,
                    storageCondition: storageCondition,
                    typeId: typeId,
                    supplierId: supplierId,
                    active: active,

                },
                success: function (response) {
                    if (response.status !== "success") {
                        $('#error').html(response.error.replace(/\n/g, '<br>'));
                    } else {
                        window.location.href = context + "/admin/product";
                    }
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            });
        });
        $('.add-product').click(function (event) {
            var productName = $('#add-productName').val();
            var categoryId = $('#add-categoryId').val();
            var price = $('#add-price').val();
            var quantity = $('#add-quantity').val();
            var purpose = $('#add-purpose').val();
            var contraindications = $('#add-contraindications').val();
            var ingredients = $('#add-ingredients').val();
            var dosage = $('#add-dosage').val();
            var instructions = $('#add-instructions').val();
            var warrantyPeriod = $('#add-warrantyPeriod ').val();
            var storageCondition = $('#add-storageCondition').val();
            var typeId = $('#add-typeId').val();
            var supplierId = $('#add-supplierId').val();
            var active = $('#add-active').val();


            $.ajax({
                type: 'POST',
                url: context + '/admin/product',
                data: {
                    action: "add",
                    productName: productName,
                    categoryId: categoryId,
                    price: price,
                    quantity: quantity,
                    purpose: purpose,
                    contraindications: contraindications,
                    ingredients: ingredients,
                    dosage: dosage,
                    instructions: instructions,
                    warrantyPeriod: warrantyPeriod,
                    storageCondition: storageCondition,
                    typeId: typeId,
                    supplierId: supplierId,
                    active: active,
                },
                success: function (response) {
                    if (response.status !== "success") {
                        $('#error').html(response.error.replace(/\n/g, '<br>'));
                    } else {
                        window.location.href = context + "/admin/product";
                    }
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            });
        });
        $(document).on('click', '.delete-product', function (event) {
            var id = $(this).data('id');
            var $productItem = $(this).closest('.product-item');
            if (confirm('Bạn có chắc chắn muốn xóa san phẩm này không?')) {
                $.ajax({
                    type: 'POST',
                    url: context + '/admin/product',
                    data: {
                        action: "delete",
                        id: id,
                    },
                    success: function (response) {
                        if (response.status !== "success") {
                            alert(response.error);
                        } else {
                            $productItem.remove();
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log(error);
                    }
                });
            }
        });


    })


</script>

<!-- Bootstrap Core JS -->
<script src="/assets/admin/js/popper.min.js"></script>
<script src="/assets/admin/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Datatables JS -->
<script src="/assets/admin/plugins/datatables/datatables.min.js"></script>

<!-- Custom JS -->
<script src="/assets/admin/js/admin.js"></script>

</body>

</html>
