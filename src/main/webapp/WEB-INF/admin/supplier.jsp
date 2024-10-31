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
                                <c:when test="${param.type eq 'add'}">Thêm nhà cung cấp</c:when>
                                <c:when test="${param.type eq 'edit'}">Sửa nhà cung cấp</c:when>
                                <c:otherwise>Quản lí Nhà cung cấp</c:otherwise>
                            </c:choose>
                        </h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="supplier">Nhà cung cấp</a></li>
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
                            <a href="supplier?type=add" class="btn btn-primary add-button ml-3">
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
                                            <th>Tên nhà cung cấp</th>
                                            <th>Logo</th>
                                            <th>Tên liên hệ</th>
                                            <th>Email</th>
                                            <th>Điện thoại</th>
                                            <th>Địa chỉ</th>
                                            <th class="text-right">Hành Động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="supplier" items="${suppliers}">
                                            <tr class="supplier-item" data-id="${supplier.id}">
                                                <td>${supplier.id}</td>
                                                <td>${supplier.supplierName}</td>
                                                <td >
                                                    <c:choose>
                                                        <c:when test="${not empty supplier.imageUrl}">
                                                            <img class="rounded service-img mr-1"
                                                                 src="${pageContext.request.contextPath}${supplier.imageUrl}"
                                                                 alt="Hình ảnh sản phẩm">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img class="rounded service-img mr-1"
                                                                 src="${pageContext.request.contextPath}/default-image-url"
                                                                 alt="Hình ảnh mặc định">
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                                <td>${supplier.contactName}</td>
                                                <td>${supplier.email}</td>
                                                <td>${supplier.phone}</td>
                                                <td>${supplier.detailAddress}</td>

                                                <td class="text-right">
                                                    <a href="supplier?type=edit&id=${supplier.id}"
                                                       class="btn btn-sm bg-success-light edit-supplier ">
                                                        <i class="far fa-edit mr-1"></i> Sửa
                                                    </a>
                                                    <button class="btn btn-outline-danger btn-sm text-danger delete-supplier"
                                                            data-id="${supplier.id}">
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
                                    <label class="col-form-label col-md-2">Tên nhà cung cấp</label>
                                    <div class="col-md-10">
                                        <input id="add-supplierName" name="supplierName" type="text" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Tên liên hệ</label>
                                    <div class="col-md-10">
                                        <input id="add-contactName" name="contactName" type="text" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Email</label>
                                    <div class="col-md-10">
                                        <input id="add-email" name="email" type="email" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Điện thoại</label>
                                    <div class="col-md-10">
                                        <input id="add-phone" name="phone" type="text" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Địa chỉ</label>
                                    <div class="col-md-10">
                                        <input id="add-detailAddress" name="detailAddress" type="text" class="form-control" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Hình ảnh</label>
                                    <div class="col-md-10">
                                        <input id="add-imageUrl" name="imageUrl" type="text" class="form-control" placeholder="Nhập URL hình ảnh">

                                        <img id="add-previewImage" src="" alt="Preview Image" style="max-width: 100px; margin-top: 10px; display: none;">
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
                                    <button class="btn btn-primary add-supplier">Lưu</button>
                                    <a href="supplier" class="btn btn-link">Hủy</a>
                                </div>



                            </c:if>
                            <!-- /Form -->

                            <!-- Form edit -->
                            <c:if test="${type.equals('edit')}">
                                <div class="form-group" style="display: none">
                                    <input class="form-control" type="text" value="add" name="type" required>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Mã nhà cung cấp</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="supplierId" value="${supplier.id}" readonly>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Tên nhà cung cấp</label>
                                    <div class="col-md-10">
                                        <input id="edit-supplierName" name="supplierName" type="text" class="form-control" value="${supplier.supplierName}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Tên liên hệ</label>
                                    <div class="col-md-10">
                                        <input id="edit-contactName" name="contactName" type="text" class="form-control" value="${supplier.contactName}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Email</label>
                                    <div class="col-md-10">
                                        <input id="edit-email" name="email" type="email" class="form-control" value="${supplier.email}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Điện thoại</label>
                                    <div class="col-md-10">
                                        <input id="edit-phone" name="phone" type="text" class="form-control" value="${supplier.phone}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Địa chỉ</label>
                                    <div class="col-md-10">
                                        <input id="edit-detailAddress" name="detailAddress" type="text" class="form-control" value="${supplier.detailAddress}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Hình ảnh</label>
                                    <div class="col-md-10">
                                        <input id="edit-imageUrl" name="imageUrl" type="text" class="form-control" value="${supplier.imageUrl}" placeholder="Nhập URL hình ảnh">
                                        <img id="edit-previewImage" src="${supplier.imageUrl}" alt="Preview Image" style="max-width: 100px; margin-top: 10px;">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Hoạt động</label>
                                    <div class="col-md-10">
                                        <select class="form-control" id="edit-active" name="active" required>
                                            <option value="true" ${supplier.active ? 'selected' : ''}>Có</option>
                                            <option value="false" ${!supplier.active ? 'selected' : ''}>Không</option>
                                        </select>
                                    </div>
                                </div>


                                <div class="mt-4">
                                    <button class="btn btn-primary edit-supplier">Lưu thay đổi</button>
                                    <a href="supplier" class="btn btn-link">Hủy</a>
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
        $('.edit-supplier').click(function (event) {
            var id = '${param.id}';
            var supplierName = $('#edit-supplierName').val();
            var contactName = $('#edit-contactName').val();
            var email = $('#edit-email').val();
            var phone = $('#edit-phone').val();
            var detailAddress = $('#edit-detailAddress').val();
            var imageUrl = $('#edit-imageUrl').val();
            var active = $('#edit-active').val();
            $.ajax({
                type: 'POST',
                url: context + '/admin/supplier',
                data: {
                    action: "edit",
                    id: id,
                    supplierName: supplierName,
                    contactName:contactName,
                    email: email,
                    phone: phone,
                    detailAddress: detailAddress,
                    imageUrl: imageUrl,
                    active: active,


                },
                success: function (response) {
                    if (response.status !== "success") {
                        $('#error').html(response.error.replace(/\n/g, '<br>'));
                    } else {
                        window.location.href = context + "/admin/supplier";
                    }
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            });
        });
        $('.add-supplier').click(function (event) {
            var supplierName = $('#add-supplierName').val();
            var contactName = $('#add-contactName').val();
            var email = $('#add-email').val();
            var phone = $('#add-phone').val();
            var detailAddress = $('#add-detailAddress').val();
            var imageUrl = $('#add-imageUrl').val();
            var active = $('#add-active').val();

            $.ajax({
                type: 'POST',
                url: context + '/admin/supplier',
                data: {
                    action: "add",
                    supplierName: supplierName,
                    contactName:contactName,
                    email: email,
                    phone: phone,
                    detailAddress: detailAddress,
                    imageUrl: imageUrl,
                    active: active,
                },
                success: function (response) {
                    if (response.status !== "success") {
                        $('#error').html(response.error.replace(/\n/g, '<br>'));
                    } else {
                        window.location.href = context + "/admin/supplier";
                    }
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            });
        });
        $(document).on('click', '.delete-supplier', function (event) {
            var id = $(this).data('id');
            var $supplierItem = $(this).closest('.supplier-item');
            if (confirm('Bạn có chắc chắn muốn xóa nhà cung cấp này không?')) {
                $.ajax({
                    type: 'POST',
                    url: context + '/admin/supplier',
                    data: {
                        action: "delete",
                        id: id,
                    },
                    success: function (response) {
                        if (response.status !== "success") {
                            alert(response.error);
                        } else {
                            $supplierItem.remove();
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
