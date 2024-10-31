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
                <c:when test="${param.type eq 'add'}">Thêm địa chỉ</c:when>
                <c:when test="${param.type eq 'edit'}">Sửa địa chỉ</c:when>
                <c:otherwise>Quản lí Địa chỉ</c:otherwise>
              </c:choose>
            </h3>
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="list-address">Địa chỉ</a></li>
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
              <a href="list-address?type=add" class="btn btn-primary add-button ml-3">
                <i class="fas fa-plus"></i>
              </a>
            </div>
          </c:if>
        </div>
      </div>
      <!-- /Page Header -->

      <div class="row">
        <!-- Display Main Address -->
        <div class="col-md-12 form-main-address">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">Địa chỉ chính</h4>
              <c:forEach var="addr" items="${addresses}">
                <c:if test="${addr.isMain == 1}">
                  <div class="form-group row">
                    <label class="col-form-label col-md-2">Mã Địa chỉ</label>
                    <div class="col-md-10">
                      <input type="text" class="form-control" value="${addr.id}" readonly>
                    </div>
                  </div>

                  <div class="form-group row">
                    <label class="col-form-label col-md-2">Địa chỉ</label>
                    <div class="col-md-10">
                      <input type="text" class="form-control" value="${addr.address}" readonly>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-form-label col-md-2">Số điện thoại</label>
                    <div class="col-md-10">
                      <input type="text" class="form-control" value="${addr.phone}" readonly>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-form-label col-md-2">Hotline</label>
                    <div class="col-md-10">
                      <input type="text" class="form-control" value="${addr.hotline}" readonly>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-form-label col-md-2">Email</label>
                    <div class="col-md-10">
                      <input type="email" class="form-control" value="${addr.email}" readonly>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-form-label col-md-2">Thời gian hoạt động</label>
                    <div class="col-md-10">
                      <input type="text" class="form-control" value="${addr.timeOpen}" readonly>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label class="col-form-label col-md-2">Hình ảnh</label>
                    <div class="col-md-10">
                      <input type="text" class="form-control" value="${addr.map}" readonly>
                      <img src="${addr.map}" alt="Preview Image" style="max-width: 100px; margin-top: 10px;">
                    </div>
                  </div>
                </c:if>
              </c:forEach>
            </div>
          </div>
        </div>


        <!-- Display Address List -->
        <div class="col-md-12">
          <div class="card">
            <div class="card-body">
              <c:if test="${type.equals('list') || param.type == null}">
                <div class="table-responsive">
                  <table class="table table-hover table-center mb-0 datatable">
                    <thead>
                    <tr>
                      <th>ID</th>
                      <th>Địa chỉ</th>
                      <th>Số điện thoại</th>
                      <th>Hotline</th>
                      <th>Email</th>
                      <th>Thời gian hoạt động</th>
                      <th class="text-right">Hành Động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="address" items="${addresses}">
                      <tr class="address-item" data-id="${address.id}">
                        <td>${address.id}</td>
                        <td>${address.address}</td>
                        <td>${address.phone}</td>
                        <td>${address.hotline}</td>
                        <td>${address.email}</td>
                        <td>${address.timeOpen}</td>
                        <td class="text-right">
                          <a href="list-address?type=edit&id=${address.id}" class="btn btn-sm bg-success-light edit-addr">
                            <i class="far fa-edit mr-1"></i> Sửa
                          </a>
                          <button class="btn btn-outline-danger btn-sm text-danger delete-address" data-id="${address.id}">
                            <i class="fa fa-trash-o"></i> Xóa
                          </button>
                          <c:if test="${address.isMain == 0}">
                            <button class="btn btn-outline-primary btn-sm text-primary set-main-address" data-id="${address.id}">
                              <i class="fa fa-star"></i> Đặt làm chính
                            </button>
                          </c:if>

                        </td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              </c:if>
              <!-- Form add -->
              <c:if test="${type.equals('add')}" >
                <div class="form-group" style="display: none">
                  <input class="form-control" type="text" value="add" name="type" required>
                </div>

                <div class="form-group row">
                  <label class="col-form-label col-md-2">Địa chỉ</label>
                  <div class="col-md-10">
                    <input id="add-address" name="address" type="text" class="form-control" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-form-label col-md-2">Số điện thoại</label>
                  <div class="col-md-10">
                    <input id="add-phone" name="phone" type="text" class="form-control" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-form-label col-md-2">Hotline</label>
                  <div class="col-md-10">
                    <input id="add-hotline" name="hotline" type="text" class="form-control" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-form-label col-md-2">Email</label>
                  <div class="col-md-10">
                    <input id="add-email" name="email" type="email" class="form-control" required>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-form-label col-md-2">Thời gian hoạt động</label>
                  <div class="col-md-10">
                    <input id="add-timeOpen" name="timeOpen" type="text" class="form-control" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-form-label col-md-2">Bản đồ</label>
                  <div class="col-md-10">
                    <input id="add-map" name="map" type="text" class="form-control" placeholder="Nhập URL map">

                    <img id="add-previewImage" src="" alt="Preview Image" style="max-width: 100px; margin-top: 10px; display: none;">
                  </div>
                </div>



                <div class="mt-4">
                  <button class="btn btn-primary add-address">Lưu</button>
                  <a href="list-address" class="btn btn-link">Hủy</a>
                </div>



              </c:if>
              <!-- /Form  -->

              <!-- Form edit -->
              <c:if test="${type.equals('edit')}">
                <div class="form-group" style="display: none">
                  <input class="form-control" type="text" value="add" name="type" required>
                </div>

                <div class="form-group row">
                  <label class="col-form-label col-md-2">Mã Địa chỉ</label>
                  <div class="col-md-10">
                    <input type="text" class="form-control" name="address" value="${address.id}" readonly>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-form-label col-md-2">Địa chỉ</label>
                  <div class="col-md-10">
                    <input id="edit-address" name="address" type="text" class="form-control" value="${address.address}" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-form-label col-md-2">Số điện thoại</label>
                  <div class="col-md-10">
                    <input id="edit-phone" name="phone" type="text" class="form-control" value="${address.phone}" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-form-label col-md-2">Hotline</label>
                  <div class="col-md-10">
                    <input id="edit-hotline" name="hotline" type="text" class="form-control" value="${address.hotline}" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-form-label col-md-2">Email</label>
                  <div class="col-md-10">
                    <input id="edit-email" name="email" type="email" class="form-control" value="${address.email}" required>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-form-label col-md-2">Thời gian hoạt động</label>
                  <div class="col-md-10">
                    <input id="edit-timeOpen" name="timeOpen" type="text" class="form-control" value="${address.timeOpen}" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="col-form-label col-md-2">Hình ảnh</label>
                  <div class="col-md-10">
                    <input id="edit-map" name="map" type="text" class="form-control" value="${address.map}" placeholder="Nhập URL hình ảnh map">
                    <img id="edit-previewImage" src="${address.map}" alt="Preview Image" style="max-width: 100px; margin-top: 10px;">
                  </div>
                </div>



                <div class="mt-4">
                  <button class="btn btn-primary edit-addr">Lưu thay đổi</button>
                  <a href="list-address" class="btn btn-link">Hủy</a>
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
    $('.edit-addr').click(function (event) {
      var id = '${param.id}';
      var address = $('#edit-address').val();
      var phone = $('#edit-phone').val();
      var hotline = $('#edit-hotline').val();
      var email = $('#edit-email').val();
      var timeOpen = $('#edit-timeOpen').val();
      var map = $('#edit-map').val();


      $.ajax({
        type: 'POST',
        url: context + '/admin/list-address',
        data: {
          action: "edit",
          id: id,
          address: address,
          phone:phone,
          hotline: hotline,
          email: email,
          timeOpen: timeOpen,
          map: map

        },

        success: function (response) {
          if (response.status !== "success") {
            $('#error').html(response.error.replace(/\n/g, '<br>'));
          } else {
            window.location.href = context + "/admin/list-address";
          }
        },
        error: function (xhr, status, error) {
          console.log(error);
        }
      });
    });
    $('.add-address').click(function (event) {

      var address = $('#add-address').val();
      var phone = $('#add-phone').val();
      var hotline = $('#add-hotline').val();
      var email = $('#add-email').val();
      var timeOpen = $('#add-timeOpen').val();
      var map = $('#add-map').val();

      $.ajax({
        type: 'POST',
        url: context + '/admin/list-address',
        data: {
          action: "add",
          address: address,
          phone:phone,
          hotline: hotline,
          email: email,
          timeOpen: timeOpen,
          map: map
        },
        success: function (response) {
          if (response.status !== "success") {
            $('#error').html(response.error.replace(/\n/g, '<br>'));
          } else {
            window.location.href = context + "/admin/list-address";
          }
        },
        error: function (xhr, status, error) {
          console.log(error);
        }
      });
    });
    $(document).on('click', '.delete-address', function (event) {
      var id = $(this).data('id');
      var $addressItem = $(this).closest('.address-item');
      if (confirm('Bạn có chắc chắn muốn xóa nhà cung cấp này không?')) {
        $.ajax({
          type: 'POST',
          url: context + '/admin/list-address',
          data: {
            action: "delete",
            id: id,
          },
          success: function (response) {
            if (response.status !== "success") {
              alert(response.error);
            } else {
              $addressItem.remove();
            }
          },
          error: function (xhr, status, error) {
            console.log(error);
          }
        });
      }
    });
    $(document).on('click', '.set-main-address', function (event) {
      var id = $(this).data('id');
      if (confirm('Bạn có chắc chắn muốn đặt địa chỉ này làm địa chỉ chính không?')) {
        $.ajax({
          type: 'POST',
          url: context + '/admin/list-address',
          data: {
            action: 'setMain',
            id: id
          },
          success: function (response) {
            if (response.status !== "success") {
              alert(response.error);
            } else {
              window.location.reload();
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
<script>
  $(document).ready(function () {
    // Hide form for main address if adding or editing
    const formAdd = $('#add-address');
    const formEdit = $('#edit-address');
    if (formAdd.length || formEdit.length) {
      $('.form-main-address').hide(); // Assuming form-main-address is the class or id of your main address form.
    }
  });
</script>
</body>
</html>
