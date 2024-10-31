<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Utils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

    <!-- Datepicker CSS -->
    <link rel="stylesheet" href="/assets/admin/css/bootstrap-datetimepicker.min.css">

    <!-- Animate CSS -->
    <link rel="stylesheet" href="/assets/admin/css/animate.min.css">
    <!-- Select CSS -->
    <link rel="stylesheet" href="/assets/admin/css/select2.min.css">
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
                        <h3 class="page-title">${title}</h3>
                    </div>
                </div>
            </div>
            <c:if test="${requestScope.type eq 'show' || requestScope.type eq 'null'}">
                <ul class="nav nav-tabs menu-tabs">
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0);" onclick="loadOrders(0)">Tất cả</a>
                    </li>
                    <c:forEach items="${listStatus}" var="status">
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0);"
                               onclick="loadOrders(${status.id})">${status.status_name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>

            <%--Show orders--%>
            <c:if test="${param.type eq 'show' || param.type eq 'null'}">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div id="orderTable" class="table-responsive orderTable">
                                        <%--Table--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <%--Edit order--%>
            <c:if test="${param.type eq 'edit'}">
                <div class="row">
                    <div class="col-lg-12">
                        <c:forEach var="entry" items="${total_report}">
                            <c:set var="order" value="${entry.key}"/>
                            <c:set var="orderItems" value="${entry.value}"/>
                            <div class="card">
                                <div class="card-body" id="gener-info">
                                    <div class="form-group row" style="display: none">
                                        <input class="form-control" type="text" value="" name="id">
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3">Mã đơn hàng</label>
                                        <div class="col-md-9">
                                                ${order.id}
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3">Ngày tạo</label>
                                        <div class="col-md-9">
                                                ${order.dateCreated}
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3">Mã người mua</label>
                                        <div class="col-md-9">
                                                ${order.user.id}
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3">Người mua</label>
                                        <div class="col-md-9">
                                                ${order.user.username}
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3">Tổng tiền</label>
                                        <div class="col-md-9">
                                                ${total_pay[order.id]} VNĐ
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3">Tiền vận chuyển</label>
                                        <div class="col-md-9">
                                            20000 VNĐ
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3">Tổng tiền phải trả</label>
                                        <div class="col-md-9">
                                                ${total_pay[order.id] + 20000} VNĐ
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3">Phương thức thanh toán</label>
                                        <div class="col-md-9">
                                                ${order.payment.name}
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3">Trạng thái đơn hàng</label>
                                        <select class="form-control select col-md-9" name="status">
                                            <option disabled>Tình trạng đơn hàng</option>
                                            <c:forEach var="status" items="${listStatus}">
                                                <option value="${status.status_name}"
                                                        <c:if test="${order.status.status_name == status.status_name}">selected</c:if>>
                                                        ${status.status_name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <span style="color: red;margin-bottom: 10px" id="error"></span>
                                    <span style="color: #66b840;margin-bottom: 10px" id="success"></span>
                                    <div class="col-md-3">
                                        <button class="btn btn-primary edit-status">Lưu thay đổi</button>
                                    </div>

                                    </form>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" data-toggle="collapse" data-target="#customer-info"
                                     role="button"
                                     aria-expanded="false" aria-controls="customer-info">
                                    <h4 class="card-title">Địa chỉ giao hàng</h4>
                                </div>
                                <div class="card-body" id="customer-info">
                                    <form action="#">
                                        <div class="form-group row">
                                            <label class="col-md-3">Tên người nhận</label>
                                            <div class="col-md-9">
                                                    ${order.address.fullName}
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3">Số điện thoại</label>
                                            <div class="col-md-9">
                                                    ${order.address.phone}
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3">Địa chỉ</label>
                                            <div class="col-md-9">
                                                    ${order.address.detailAddress}
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="card" data-toggle="collapse" data-target="#product-info" role="button"
                                 aria-expanded="false" aria-controls="product-info">
                                <div class="card-header">
                                    <h4 class="card-title">Chi tiết đơn hàng - Đơn hàng ${order.id}</h4>
                                </div>
                                <div class="card-body" id="product-info">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0 datatable">
                                            <thead>
                                            <tr>
                                                <th>Sản phẩm</th>
                                                <th>Số lượng</th>
                                                <th>Giá</th>
                                                <th>Thành tiền</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="orderItem" items="${orderItems}">
                                                <tr>
                                                    <td>${orderItem.product.productName}</td>
                                                    <td>${orderItem.quantity}</td>
                                                    <td>${orderItem.product.price} VNĐ</td>
                                                    <td>${orderItem.orderPrice} VNĐ</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>
<!-- jQuery -->
<script src="/assets/admin/js/jquery-3.5.0.min.js"></script>

<script>
    function formatCurrency(amount) {
        return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(amount);
    }

    function getStatusBadge(statusId) {
        switch (statusId) {
            case 1:
                return '<span class="badge badge-danger">Chờ Thanh Toán</span>';
            case 2:
                return '<span class="badge badge-warning">Chờ vận chuyển</span>';
            case 3:
                return '<span class="badge badge-primary">Chờ giao hàng</span>';
            case 4:
                return '<span class="badge badge-info">Chờ đánh giá</span>';
            case 5:
                return '<span class="badge badge-secondary">Đã huỷ</span>';
            case 6:
                return '<span class="badge badge-secondary">Trả hàng/ Hoàn tiền</span>';
            default:
                return '<span class="badge badge-secondary">Không xác định</span>';
        }
    }

    var context = "${pageContext.request.contextPath}";

    function loadOrders(statusId) {

        $.ajax({
            type: "POST",
            url: context + "/admin/total-report",
            data: {type: "show", status_id: statusId},
            success: function (response) {
                $('#orderTable').empty();
                var table =
                    '<table id="orderTable" class="table table-hover table-center mb-0 datatable">' +
                    '<thead>' +
                    '<tr>' +
                    '<th>ID</th>' +
                    '<th>Ngày đặt hàng</th>' +
                    '<th>Khách hàng</th>' +
                    '<th>Tổng tiền</th>' +
                    '<th>Trạng thái</th>' +
                    '<th class="text-right">Hành Động</th>' +
                    '</tr>' +
                    '</thead>' +
                    '<tbody>';

                $.each(response.orders, function (index, order) {
                    var statusBadge = getStatusBadge(order.statusName);
                    var formattedDate = new Date(order.orderDate).toLocaleString();
                    var totalAmount = formatCurrency(order.totalAmount);

                    var row =
                        '<tr>' +
                        '<td>' + order.orderId + '</td>' +
                        '<td>' + formattedDate + '</td>' +
                        '<td>' + order.customerName + '</td>' +
                        '<td>' + totalAmount + '</td>' +
                        '<td>' + statusBadge + '</td>' +
                        '<td class="text-right">' +
                        '<a href="total-report?type=edit&id=' + order.orderId + '" class="btn btn-sm bg-info-light">' +
                        '<i class="far fa-eye mr-1"></i> Chi tiết' +
                        '</a>' +
                        '</td>' +
                        '</tr>';

                    table += row;
                });

                table += '</tbody></table>';
                $('#orderTable').append(table);
            },
            error: function (xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
    }

    function editStatus() {
        $('.edit-status').click(function () {
            <c:set var="idValue" value="${requestScope.id != null ? requestScope.id : 0}" />
            var newStatus = $('select[name="status"]').val();
            var id =${idValue};

            $.ajax({
                type: "POST",
                url: context + "/admin/total-report",
                data: {
                    action: "edit",
                    id: id,
                    newStatus: newStatus
                },
                success: function (response) {
                    console.log(response)
                    if (!response.success) {
                        $('#error').html(response.message);
                        $('#success').html('');
                    } else {
                        $('#success').html(response.message);
                        $('#error').html('');
                    }
                },
                error: function (xhr, status, error) {
                }
            });
        });
    }

    $(document).ready(function () {
        loadOrders(0);
        editStatus();
    });
</script>

<!-- Bootstrap Core JS -->
<script src="/assets/admin/js/popper.min.js"></script>
<script src="/assets/admin/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Datepicker Core JS -->
<script src="/assets/admin/js/moment.min.js"></script>
<script src="/assets/admin/js/bootstrap-datetimepicker.min.js"></script>

<!-- Datatables JS -->
<script src="/assets/admin/plugins/datatables/datatables.min.js"></script>

<!-- Select2 JS -->
<script src="/assets/admin/js/select2.min.js"></script>

<!-- Custom JS -->
<script src="/assets/admin/js/admin.js"></script>
</body>
</html>
