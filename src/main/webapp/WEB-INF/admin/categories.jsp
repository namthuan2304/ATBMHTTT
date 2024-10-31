<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <!-- Datepicker CSS -->
    <link rel="stylesheet" href="/assets/admin/css/bootstrap-datetimepicker.min.css">

    <!-- Datatables CSS -->
    <link rel="stylesheet" href="/assets/admin/plugins/datatables/datatables.min.css">

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

            <div class="page-header">
                <div class="row">
                    <div class="col">
                        <h3 class="page-title">Danh mục</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="category?action=list">Danh mục</a></li>
                            <c:choose>
                                <c:when test="${param.type == 'edit'}">
                                    <li class="breadcrumb-item active">Sửa danh mục</li>
                                </c:when>
                                <c:when test="${param.type == 'add'}">
                                    <li class="breadcrumb-item active">Thêm danh mục</li>
                                </c:when>
                            </c:choose>
                        </ul>
                        <span style="color: red;margin-bottom: 10px" id="error"></span>
                    </div>
                    <c:if test="${param.type == 'list' || param.type == null}">
                        <div class="d-flex align-items-center">
                            <div class="col-auto text-right">
                                <button id="exportBtn" class="btn btn-primary">
                                    <i class="fas fa-file-export"></i>
                                </button>
                            </div>
                            <div class="col-auto text-right">
                                <a href="category?type=add" class="btn btn-primary add-button">
                                    <i class="fas fa-plus"></i>
                                </a>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
            <!-- /Page Header -->

            <!-- Display Category List -->
            <c:if test="${param.type == 'list' || param.type == null}">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover table-center mb-0 datatable">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Danh mục</th>
                                            <th>Số Lượng</th>
                                            <th>Hiển Thị</th>
                                            <th class="text-right">Hành Động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="categoryEntry" items="${categories}">
                                            <c:set var="category" value="${categoryEntry.key}"/>
                                            <tr>
                                                <td>${category.id}</td>
                                                <td>${category.categoryName}</td>
                                                <td>${categoryEntry.value}</td>
                                                <td>
                                                    <div class="status-toggle">
                                                        <input id="${category.id}" class="check"
                                                               type="checkbox" ${category.active ? 'checked' : ''}>
                                                        <label for="${category.id}" class="checktoggle">checkbox</label>
                                                    </div>
                                                </td>
                                                <td class="text-right">
                                                    <a href="category?type=edit&id=${category.id}"
                                                       class="btn btn-sm bg-success-light mr-2">
                                                        <i class="far fa-edit mr-1"></i> Sửa
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>

            <!-- Edit Category -->
            <c:if test="${requestScope.type eq 'edit'}">
                <div class="card">
                    <div class="card-body">
                        <div class="form-group">
                            <label>Tên danh mục</label>
                            <input id="category-name" name="name" class="form-control" type="text"
                                   value="${category.categoryName}"/>
                        </div>
                        <div class="mt-4">
                            <button class="btn btn-primary text-white edit-category">Lưu</button>
                            <a href="category" class="btn btn-link">Hủy</a>
                        </div>
                    </div>
                </div>
            </c:if>

            <!-- Add Category -->
            <c:if test="${requestScope.type eq 'add'}">
                <div class="card">
                    <div class="card-body">
                        <div class="form-group row">
                            <label class="col-form-label col-md-2">Tên danh mục</label>
                            <div class="col-md-10">
                                <input name="name" id="categoryName" type="text" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row" style="margin-bottom: 0">
                            <label class="col-form-label col-md-2">ID danh mục lớn</label>
                            <div class="col-md-10">
                                <select name="id" id="product-group" class="form-control">
                                    <c:forEach var="cate" items="${groups}">
                                        <option value="${cate.id}">${cate.groupName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <ul style="margin-top: 10px; margin-bottom: 0;">
                                <c:forEach var="cate" items="${categoryParent}">
                                    <li>${cate.id} : ${cate.groupName}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="mt-4">
                            <button class="btn btn-primary add-category">Thêm</button>
                            <a href="category?action=list" class="btn btn-link">Hủy</a>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.9/xlsx.full.min.js"></script>
<script type="text/javascript">
    window.addEventListener("scroll", () => {
        var header = document.querySelector(".container");
        header.classList.toggle("sticky", window.scrollY > 100);
    })

    $(document).ready(function () {
        var context = "${pageContext.request.contextPath}";

        $('.check').change(function () {
            var categoryId = $(this).attr('id');
            var isActive = $(this).prop('checked');

            $.ajax({
                type: 'POST',
                url: context + '/admin/category',
                data: {
                    action: "set-status",
                    active: isActive,
                    id: categoryId
                },
                success: function (response) {
                    alert('Category status updated successfully.');
                },
                error: function (xhr, status, error) {
                }
            });
        });


        $('.edit-category').click(function (event) {
            event.preventDefault();
            var categoryId = '${category.id}';
            var categoryName = $('#category-name').val();

            $.ajax({
                type: 'POST',
                url: context + '/admin/category',
                data: {
                    action: "edit",
                    id: categoryId,
                    category: categoryName
                },
                success: function (response) {
                    if (response.status !== "success") {
                        $('#error').html(response.error);
                    } else {
                        window.location.href = context + "/admin/category";
                    }
                },
                error: function (xhr, status, error) {
                }
            });
        });

        $('.add-category').click(function (event) {
            event.preventDefault();
            var context = "${pageContext.request.contextPath}";
            var categoryName = $('#categoryName').val();
            var categoryGroup = $('#product-group').val();

            $.ajax({
                type: 'POST',
                url: context + '/admin/category',
                data: {
                    action: "add",
                    category: categoryName,
                    group: categoryGroup
                },
                success: function (response) {
                    try {
                        if (response.status !== "success") {
                            $('#error').html(response.error);
                        } else {
                            window.location.href = context + "/admin/category";
                        }
                    } catch (e) {
                        $('#error').html("Error loading request, please try again!");
                    }
                },
                error: function (xhr, status, error) {

                    $('#error').html(status, error);
                }
            });
        });

        $("#exportBtn").click(function() {
            $.ajax({
                type: 'POST',
                url: context + '/admin/category',
                data: { action: 'listAll' },
                dataType: 'json',
                success: function(response) {
                    var tableData = [];

                    tableData.push(["ID", "Danh mục", "Số Lượng"]);

                    response.categories.forEach(function(category) {
                        tableData.push([category.id, category.categoryName, category.quantity]);
                    });

                    var wb = XLSX.utils.book_new();
                    var ws = XLSX.utils.aoa_to_sheet(tableData);
                    XLSX.utils.book_append_sheet(wb, ws, "Categories");

                    XLSX.writeFile(wb, "categories.xlsx");
                },
                error: function(xhr, status, error) {
                    console.error("Failed to fetch category data:", status, error);
                }
            });
        });
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