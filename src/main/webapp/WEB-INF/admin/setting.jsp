<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi-VN">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Thiết lập</title>
    <link href="/assets/admin/img/icon/icon-logo.png" rel="shortcut icon">

    <!-- Favicons -->
    <link rel="shortcut icon" href="/assets/admin/img/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/assets/admin/plugins/bootstrap/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="/assets/admin/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="/assets/admin/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="/assets/admin/css/font-awesome.min.css">

    <!-- Animate CSS -->
    <link rel="stylesheet" href="/assets/admin/css/animate.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="/assets/admin/css/admin.css">

</head>

<body>
<div class="main-wrapper">
    <jsp:include page="include/menu.jsp"></jsp:include>
    <div class="page-wrapper">
        <div class="content container-fluid">
            <!-- Page Header -->
            <div class="page-header">
                <div class="row">
                    <div class="col-12">
                        <h3 class="page-title">Thiết lập chung</h3>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <ul class="nav nav-tabs menu-tabs">
                <ul class="nav nav-tabs menu-tabs">
                    <li class="nav-item active">
                        <a class="nav-link">Thiết lập chung</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="list-address">Địa chỉ</a>
                    </li>
                </ul>
            </ul>

            <div class="row">
                <div class="col-xl-8 col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <!-- Form -->
                            <form id="socialMediaForm">
                                <input type="hidden" name="action" value="edit">
                                <div id="successMessage" class="alert alert-success" style="display:none;">
                                    Bạn đã cập nhật thành công.
                                </div>

                                <div class="form-group">
                                    <label>Facebook</label>
                                    <input type="text" class="form-control" name="facebook"
                                           value="${socialMedia.facebook}">
                                </div>
                                <div class="form-group">
                                    <label>Instagram</label>
                                    <input type="text" class="form-control" name="instagram"
                                           value="${socialMedia.instagram}">
                                </div>
                                <div class="form-group">
                                    <label>Twitter</label>
                                    <input type="text" class="form-control" name="twitter"
                                           value="${socialMedia.twitter}">
                                </div>
                                <div class="form-group">
                                    <label>Pinterest</label>
                                    <input type="text" class="form-control" name="pinterest"
                                           value="${socialMedia.pinterest}">
                                </div>
                                <div class="form-group">
                                    <label>Youtube</label>
                                    <input type="text" class="form-control" name="youtube"
                                           value="${socialMedia.youtube}">
                                </div>
                                <div class="form-group">
                                    <label>LinkedIn</label>
                                    <input type="text" class="form-control" name="linkedin"
                                           value="${socialMedia.linkedin}">
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn btn-primary" id="saveChanges">
                                        Lưu thay đổi
                                    </button>
                                </div>
                            </form>
                            <!-- /Form -->



                        </div>
                    </div>
                </div>
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
        $('#saveChanges').click(function (event) {
            event.preventDefault();

            $.ajax({
                type: 'POST',
                url: context + '/admin/setting',
                data: $('#socialMediaForm').serialize(),
                success: function (response) {
                    if (response.status !== "success") {
                        alert("Có lỗi xảy ra: " + response.error);
                    } else {
                        $('#successMessage').show();
                        setTimeout(function(){
                            $('#successMessage').hide();
                        }, 3000);
                    }
                },
                error: function (xhr, status, error) {
                    console.log(error);
                }
            });
        });
    });
</script>

<!-- Bootstrap Core JS -->
<script src="/assets/admin/js/popper.min.js"></script>
<script src="/assets/admin/plugins/bootstrap/js/bootstrap.min.js"></script>

<!-- Slimscroll JS -->
<script src="/assets/admin/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom JS -->
<script src="/assets/admin/js/admin.js"></script>

</body>

</html>
