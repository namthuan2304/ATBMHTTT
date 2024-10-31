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
                                <c:when test="${param.type eq 'add'}">Thêm mã giảm giá</c:when>
                                <c:when test="${param.type eq 'edit'}">Sửa mã giảm giá</c:when>
                                <c:otherwise>Mã giảm giá</c:otherwise>
                            </c:choose>
                        </h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="coupon-code">Mã giảm giá</a></li>
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
                        <div class="d-flex align-items-center">
                            <div class="col-auto text-right">
                                <button id="exportBtn" class="btn btn-primary">
                                    <i class="fas fa-file-export"></i>
                                </button>
                            </div>
                            <div class="col-auto text-right">
                                <a href="coupon-code?type=add" class="btn btn-primary add-button">
                                    <i class="fas fa-plus"></i>
                                </a>
                            </div>
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
                                            <th>Tên</th>
                                            <th>% Giảm giá</th>
                                            <th>Số lượng</th>
                                            <th>Ngày bắt đầu</th>
                                            <th>Ngày hết hạn</th>
                                            <th class="text-right">Chỉnh sửa</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${coupons}" var="cp">
                                            <tr class="coupon-item" data-id="${cp.id}">
                                                <td>${cp.id}</td>
                                                <td>${cp.discountName}</td>
                                                <td>${cp.salePercent}%</td>
                                                <td>${cp.quantity}</td>
                                                <td>${cp.startDate}</td>
                                                <td>${cp.expirationDate}</td>
                                                <td class="text-right">
                                                    <a href="coupon-code?type=edit&id=${cp.id}"
                                                       class="btn btn-sm bg-success-light mr-2">
                                                        <i class="far fa-edit mr-1"></i>
                                                        Sửa
                                                    </a>
                                                    <button data-id="${cp.id}" class="btn btn-outline-danger btn-sm text-danger delete-coupon">
                                                        <i class="fa fa-trash-o"></i>
                                                        Xóa
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
                                    <label class="col-form-label col-md-2">Tên</label>
                                    <div class="col-md-10">
                                        <input id="add-name" type="text" class="form-control" name="name" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Phần trăm khuyến mãi</label>
                                    <div class="col-md-10">
                                        <input id="add-sale" type="number" class="form-control" min="0" max="100"
                                               name="percent"
                                               required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Số lượng</label>
                                    <div class="col-md-10">
                                        <input id="add-quantity" type="number" class="form-control" name="quantity"
                                               required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Ngày bắt đầu</label>
                                    <div class="col-md-10">
                                        <input id="add-dateStart" type="date" class="form-control" name="date_start"
                                               required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Ngày hết hạn</label>
                                    <div class="col-md-10">
                                        <input id="add-dateEnd" type="date" class="form-control" name="date_end"
                                               required>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <button class="btn btn-primary add-coupon">Lưu</button>
                                    <a href="coupon-code" class="btn btn-link">Hủy</a>
                                </div>
                            </c:if>
                            <!-- /Form -->

                            <!-- Form edit -->
                            <c:if test="${type.equals('edit')}">
                                <div class="form-group" style="display: none">
                                    <input class="form-control" type="text" value="add" name="type" required>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Tên</label>
                                    <div class="col-md-10">
                                        <input id="edit-name" type="text" class="form-control" name="name"
                                               value="${coupon.discountName}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Phần trăm khuyến mãi</label>
                                    <div class="col-md-10">
                                        <input id="edit-sale" type="number" class="form-control" name="percent" min="0"
                                               max="100"
                                               value="${coupon.salePercent}" required>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Số lượng</label>
                                    <div class="col-md-10">
                                        <input id="edit-quantity" type="number" class="form-control" name="quantity"
                                               value="${coupon.quantity}" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Ngày bắt đầu</label>
                                    <div class="col-md-10">
                                        <c:choose>
                                            <c:when test="${not empty coupon and not empty coupon.startDate}">
                                                <input id="edit-dateStart" type="date" class="form-control"
                                                       value="${coupon.startDate}" required>
                                            </c:when>
                                            <c:otherwise>
                                                <input id="edit-dateStart" type="date" class="form-control"
                                                       required>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Ngày hết hạn</label>
                                    <div class="col-md-10">
                                        <c:choose>
                                            <c:when test="${not empty coupon and not empty coupon.expirationDate}">
                                                <input id="edit-dateEnd" type="date" class="form-control"
                                                       value="${coupon.expirationDate}" required>
                                            </c:when>
                                            <c:otherwise>
                                                <input id="edit-dateEnd" type="date" class="form-control"
                                                       required>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <button class="btn btn-primary edit-coupon">Lưu</button>
                                    <a href="coupon-code" class="btn btn-link">Hủy</a>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.9/xlsx.full.min.js"></script>

<script>
    var context = "${pageContext.request.contextPath}";

    $(document).ready(function () {
        $('.edit-coupon').click(function (event) {
            var id = '${param.id}';
            var name = $('#edit-name').val();
            var sale = $('#edit-sale').val();
            var quantity = $('#edit-quantity').val();
            var dateStart = $('#edit-dateStart').val();
            var dateEnd = $('#edit-dateEnd').val();
            $.ajax({
                type: 'POST',
                url: context + '/admin/coupon-code',
                data: {
                    action: "edit",
                    id: id,
                    name: name,
                    sale: sale,
                    quantity: quantity,
                    dateStart: dateStart,
                    dateEnd: dateEnd
                },
                success: function (response) {
                    if (response.status !== "success") {
                        $('#error').html(response.error.replace(/\n/g, '<br>'));
                    } else {
                        window.location.href = context + "/admin/coupon-code";
                    }
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            });
        });
        $('.add-coupon').click(function (event) {
            var name = $('#add-name').val();
            var sale = $('#add-sale').val();
            var quantity = $('#add-quantity').val();
            var dateStart = $('#add-dateStart').val();
            var dateEnd = $('#add-dateEnd').val();

            console.log(name, sale, quantity, dateStart, dateEnd)
            $.ajax({
                type: 'POST',
                url: context + '/admin/coupon-code',
                data: {
                    action: "add",
                    name: name,
                    sale: sale,
                    quantity: quantity,
                    dateStart: dateStart,
                    dateEnd: dateEnd
                },
                success: function (response) {
                    if (response.status !== "success") {
                        $('#error').html(response.error.replace(/\n/g, '<br>'));
                    } else {
                        window.location.href = context + "/admin/coupon-code";
                    }
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            });
        });

        $('.delete-coupon').click(function (event) {
            var id = $(this).data('id');
            var $couponItem = $(this).closest('.coupon-item');
            if (confirm("Bạn có chắc chắn muốn xóa mã này không?")) {
                $.ajax({
                    type: 'POST',
                    url: context + '/admin/coupon-code',
                    data: {
                        action: "delete",
                        id: id
                    },
                    success: function (response) {
                        $couponItem.remove()
                        // window.location.href = context + "/admin/coupon-code";
                    },
                    error: function (xhr, status, error) {
                    }
                });
            }
        });

        $('#exportBtn').click(function() {
            $.ajax({
                type: 'POST',
                url: context + '/admin/coupon-code',
                data: { action: 'listAll' },
                dataType: 'json',
                success: function(response) {
                    var tableData = [];

                    tableData.push(["ID", "Tên", "% Giảm giá", "Số lượng", "Ngày bắt đầu", "Ngày hết hạn"]);

                    response.coupons.forEach(function(cp) {
                        tableData.push([cp.id, cp.name, cp.salePercent, cp.quantity, cp.startDate, cp.expirationDate]);
                    });

                    var wb = XLSX.utils.book_new();
                    var ws = XLSX.utils.aoa_to_sheet(tableData);
                    XLSX.utils.book_append_sheet(wb, ws, "Coupons");

                    XLSX.writeFile(wb, "coupons.xlsx");
                },
                error: function(xhr, status, error) {
                    console.error("Failed to fetch coupon data:", status, error);
                }
            });
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
