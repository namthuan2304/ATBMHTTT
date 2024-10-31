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

                                <c:when test="${param.type eq 'edit'}">Sửa người dùng</c:when>
                                <c:otherwise>Quản lí Người dùng</c:otherwise>
                            </c:choose>
                        </h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="user">Người dùng</a></li>
                            <li class="breadcrumb-item active">
                                <c:choose>

                                    <c:when test="${param.type eq 'edit'}">Chỉnh sửa</c:when>
                                    <c:otherwise>Danh sách</c:otherwise>
                                </c:choose>
                            </li>
                        </ul>
                        <span style="color: red;margin-bottom: 10px" id="error"></span>
                    </div>

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
                                            <th>User name</th>
                                            <th>Ảnh đại diện</th>
                                            <th>Email</th>
                                            <th>Password</th>
                                            <th>Tình trạng xác thực</th>
                                            <th>Ngày tạo tài khoản</th>
                                            <th class="text-right">Hành Động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="user" items="${users}">
                                            <tr class="user-item" data-id="${user.id}">
                                                <td>${user.id}</td>
                                                <td>${user.username}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty user.avatar}">
                                                            <img class="rounded service-img mr-1"
                                                                 src="${pageContext.request.contextPath}${user.avatar}"
                                                                 alt="Hình ảnh sản phẩm">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img class="rounded service-img mr-1"
                                                                 src="${pageContext.request.contextPath}/default-image-url"
                                                                 alt="Hình ảnh mặc định">
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                                <td>${user.email}</td>
                                                <td>${user.password}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${user.verified}">
                                                            Đã xác thực
                                                        </c:when>
                                                        <c:otherwise>
                                                            Chưa xác thực
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>

                                                <td>${user.dateCreated}</td>

                                                <td class="text-right">
                                                    <a href="user?type=edit&id=${user.id}"
                                                       class="btn btn-sm bg-success-light edit-user ">
                                                        <i class="far fa-edit mr-1"></i> Sửa
                                                    </a>
                                                    <button class="btn btn-outline-danger btn-sm text-danger delete-user"
                                                            data-id="${user.id}">
                                                        <i class="fa fa-trash-o"></i> Xóa
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>


                            <!-- Form edit -->
                            <c:if test="${type.equals('edit')}">
                                <div class="form-group" style="display: none">
                                    <input class="form-control" type="text" value="edit" name="type" required>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Mã người dùng</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="id" value="${user.id}" readonly>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Tên người dùng</label>
                                    <div class="col-md-10">
                                        <input id="edit-username" name="username" type="text" class="form-control"
                                               value="${user.username}" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Email</label>
                                    <div class="col-md-10">
                                        <input id="edit-email" name="email" type="email" class="form-control"
                                               value="${user.email}" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Password</label>
                                    <div class="col-md-10">
                                        <input id="edit-password" name="password" type="password" class="form-control"
                                               value="*****" readonly>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Họ và tên</label>
                                    <div class="col-md-10">
                                        <input id="edit-fullName" name="fullName" type="text" class="form-control"
                                               value="${user.fullName}" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Ngày tháng năm sinh</label>
                                    <div class="col-md-10">
                                        <input id="edit-dateOfBirth" name="dateOfBirth" type="date" class="form-control"
                                               value="${user.dateOfBirth}" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Tỉnh</label>
                                    <div class="col-md-10">
                                        <input id="edit-city" name="city" type="text" class="form-control"
                                               value="${user.city}" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Huyện</label>
                                    <div class="col-md-10">
                                        <input id="edit-district" name="district" type="text" class="form-control"
                                               value="${user.district}" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Khu</label>
                                    <div class="col-md-10">
                                        <input id="edit-ward" name="ward" type="text" class="form-control"
                                               value="${user.ward}" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Địa chỉ chi tiết</label>
                                    <div class="col-md-10">
                                        <input id="edit-detail_address" name="detail_address" type="text"
                                               class="form-control" value="${user.detail_address}" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Số điện thoại</label>
                                    <div class="col-md-10">
                                        <input id="edit-phone" name="phone" type="text" class="form-control"
                                               value="${user.phone}" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Ảnh đại diện</label>
                                    <div class="col-md-10">
                                        <input id="edit-avatar" name="avatar" type="text" class="form-control"
                                               value="${user.avatar}" placeholder="Nhập URL hình ảnh">
                                        <img id="edit-previewImage" src="${user.avatar}" alt="Preview Image"
                                             style="max-width: 100px; margin-top: 10px;">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Tình trạng xác thực</label>
                                    <div class="col-md-10">
                                        <select class="form-control" id="edit-verified" name="active" disabled>
                                            <option value="true" ${user.verified ? 'selected' : ''} >Đã xác thực</option>
                                            <option value="false" ${!user.verified ? 'selected' : ''}>Chưa xác thực</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Vai trò</label>
                                    <div class="col-md-10">
                                        <select class="form-control" id="edit-role" name="role" required>
                                            <option value="0" ${user.role.id == 0 ? 'selected' : ''}>Nhân viên</option>
                                            <option value="1" ${user.role.id == 1 ? 'selected' : ''}>Người dùng</option>
                                            <option value="2" ${user.role.id == 2 ? 'selected' : ''}>Admin</option>
                                            <option value="3" ${user.role.id == 3 ? 'selected' : ''}>Mod</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-form-label col-md-2">Ngày tạo tài khoản</label>
                                    <div class="col-md-10">
                                        <input id="edit-dateCreated" name="dateCreated" type="datetime-local"
                                               class="form-control" value="${user.dateCreated}" required>
                                    </div>
                                </div>

                                <div class="mt-4">
                                    <button class="btn btn-primary edit-user">Lưu thay đổi</button>
                                    <a href="user" class="btn btn-link">Hủy</a>
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
        $('.edit-user').click(function (event) {
            var id = '${param.id}';
            var username = $('#edit-username').val();
            var password = $('#edit-password').val();
            var email = $('#edit-email').val();
            var fullName = $('#edit-fullName').val();
            var dateOfBirth = $('#edit-dateOfBirth').val();
            var city = $('#edit-city').val();
            var district = $('#edit-district').val();
            var ward = $('#edit-ward').val();
            var detail_address = $('#edit-detail_address').val();
            var phone = $('#edit-phone').val();
            var avatar = $('#edit-avatar').val();
            var verified = $('#edit-verified').val();
            var role = $('#edit-role').val();
            var dateCreated = $('#edit-dateCreated').val();

            console.log("cant edit", id);
            console.log("cant edit", email);
            console.log("cant edit", dateOfBirth);

            $.ajax({
                type: 'POST',
                url: context + '/admin/user',
                data: {
                    action: "edit",
                    id: id,
                    username: username,
                    email: email,
                    password: password,
                    fullName: fullName,
                    dateOfBirth: dateOfBirth,
                    city: city,
                    district: district,
                    ward: ward,
                    detail_address: detail_address,
                    phone: phone,
                    avatar: avatar,
                    verified: verified,
                    role: role,
                    dateCreated: dateCreated

                },
                success: function (response) {
                    if (response.status !== "success") {
                        $('#error').html(response.error.replace(/\n/g, '<br>'))
                        console.log("That bai roi")
                    } else {
                        window.location.href = context + "/admin/user";
                    }
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            });
        });

        $(document).on('click', '.delete-user', function (event) {
            var id = $(this).data('id');
            var $userItem = $(this).closest('.user-item');
            if (confirm('Bạn có chắc chắn muốn xóa người dùng này không?')) {
                $.ajax({
                    type: 'POST',
                    url: context + '/admin/user',
                    data: {
                        action: "delete",
                        id: id,
                    },
                    success: function (response) {
                        if (response.status !== "success") {
                            alert(response.error);
                        } else {
                            $userItem.remove();
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
