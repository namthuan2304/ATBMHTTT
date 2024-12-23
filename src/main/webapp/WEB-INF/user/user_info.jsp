<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.service.impl.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/assets/user/css/thuvien/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="/assets/user/css/thuvien/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/user/user.css" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
          sizes="192x192"/>
    <title>Trang cá nhân</title>
</head>
<style>
    .row .power-container {
        background-color: gainsboro;
        width: 80%;
        height: 5px;
        border-radius: 3px;
    }

    .power-container #power-point {
        background-color: #D73F40;
        width: 1%;
        height: 100%;
        border-radius: 3px;
        transition: 0.2s;
    }
    /* From Uiverse.io by Pradeepsaranbishnoi */
    .voltage-button {
        position: relative;
    }

    .voltage-button button {
        color: white;
        background: #0D1127;
        padding: 1rem 3rem 1rem 3rem;
        border-radius: 5rem;
        border: 5px solid #5978F3;
        font-size: 1.2rem;
        line-height: 1em;
        letter-spacing: 0.075em;
        transition: background 0.3s;
    }

    .voltage-button button:hover {
        cursor: pointer;
        background: #0F1C53;
    }

    .voltage-button button:hover + svg, .voltage-button button:hover + svg + .dots {
        opacity: 1;
    }

    .voltage-button svg {
        display: block;
        position: absolute;
        top: -0.75em;
        left: -0.25em;
        width: calc(100% + 0.5em);
        height: calc(100% + 1.5em);
        pointer-events: none;
        opacity: 0;
        transition: opacity 0.4s;
        transition-delay: 0.1s;
    }

    .voltage-button svg path {
        stroke-dasharray: 100;
        filter: url("#glow");
    }

    .voltage-button svg path.line-1 {
        stroke: #f6de8d;
        stroke-dashoffset: 0;
        animation: spark-1 3s linear infinite;
    }

    .voltage-button svg path.line-2 {
        stroke: #6bfeff;
        stroke-dashoffset: 500;
        animation: spark-2 3s linear infinite;
    }

    .voltage-button .dots {
        opacity: 0;
        transition: opacity 0.3s;
        transition-delay: 0.4s;
    }

    .voltage-button .dots .dot {
        width: 1rem;
        height: 1rem;
        background: white;
        border-radius: 100%;
        position: absolute;
        opacity: 0;
    }

    .voltage-button .dots .dot-1 {
        top: 0;
        left: 20%;
        animation: fly-up 3s linear infinite;
    }

    .voltage-button .dots .dot-2 {
        top: 0;
        left: 55%;
        animation: fly-up 3s linear infinite;
        animation-delay: 0.5s;
    }

    .voltage-button .dots .dot-3 {
        top: 0;
        left: 80%;
        animation: fly-up 3s linear infinite;
        animation-delay: 1s;
    }

    .voltage-button .dots .dot-4 {
        bottom: 0;
        left: 30%;
        animation: fly-down 3s linear infinite;
        animation-delay: 2.5s;
    }

    .voltage-button .dots .dot-5 {
        bottom: 0;
        left: 65%;
        animation: fly-down 3s linear infinite;
        animation-delay: 1.5s;
    }

    @keyframes spark-1 {
        to {
            stroke-dashoffset: -1000;
        }
    }

    @keyframes spark-2 {
        to {
            stroke-dashoffset: -500;
        }
    }

    @keyframes fly-up {
        0% {
            opacity: 0;
            transform: translateY(0) scale(0.2);
        }

        5% {
            opacity: 1;
            transform: translateY(-1.5rem) scale(0.4);
        }

        10%, 100% {
            opacity: 0;
            transform: translateY(-3rem) scale(0.2);
        }
    }

    @keyframes fly-down {
        0% {
            opacity: 0;
            transform: translateY(0) scale(0.2);
        }

        5% {
            opacity: 1;
            transform: translateY(1.5rem) scale(0.4);
        }

        10%, 100% {
            opacity: 0;
            transform: translateY(3rem) scale(0.2);
        }
    }

</style>
<body>
<div class="website-wrapper">
    <%@include file="/WEB-INF/user/include/header.jsp" %>
    <div class="page-title" style="
            background-image: url(https://tienthangvet.vn/wp-content/uploads/title-tag-tien-thang-vet-tsd1.jpg);
          ">
        <div class="container">
            <h1 class="title">Trang cá nhân</h1>
        </div>
    </div>
    <div class="container">
        <div class="row my-2 user__border">
            <div class="col-lg-8 order-lg-2">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="" data-target="#profile" data-toggle="tab" class="nav-link active nav-link-2">Tài
                            Khoản</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#messages" data-toggle="tab" class="nav-link nav-link-2">Đổi Mật
                            Khẩu</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#edit" data-toggle="tab" class="nav-link nav-link-2">Đơn Hàng</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#favourite" data-toggle="tab" class="nav-link nav-link-2">Sản phẩm yêu thích</a>
                    </li>
                    <li class="nav-item">
                        <a href="" data-target="#createKeyPair" data-toggle="tab" class="nav-link nav-link-2">Tạo cặp khóa mới</a>
                    </li>

                </ul>
                <div class="tab-content py-4">

                    <div class="tab-pane active" id="profile">
                        <!-- <h5 class="mb-3">Thông Tin Tài Khoản</h5> -->
                        <div class="row">
                            <div class="col-md-12">
                                <header>
                                    <h1>HỒ SƠ CỦA TÔI</h1>
                                    <div class="content">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>
                                </header>
                                <form class="formAcount validate clearfix">
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label"> Họ tên: <span></span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" id="fullName" name="fullName"
                                                       value="${sessionScope.auth.fullName}"
                                                       placeholder="Họ tên"
                                                       class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Ngày sinh: <span></span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="date" id="birthday" name="birthday"
                                                       value="${sessionScope.auth.dateOfBirth}"
                                                       placeholder="Ngày sinh"
                                                       class="validate[required] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Điện thoại: <span>(*)</span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" id="mobile" name="phone"
                                                       value="${sessionScope.auth.phone}"
                                                       placeholder="Điện thoại"
                                                       class="validate[required,custom[phone]] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Email: <span>(*)</span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" name="email" id="email"
                                                       value="${sessionScope.auth.email}"
                                                       placeholder="Email"
                                                       class="validate[required,custom[email]] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Tỉnh/Thành phố<span>(*)</span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" name="city" id="city" value="${sessionScope.auth.city}"
                                                    placeholder="Thành phố" class="validate[required,custom[email]] form-control input-sm">
                                                <select class="validate[required] form-control input-sm" id="tinh" name="tinh" title="Chọn Tỉnh Thành">
                                                    <option value="0">--Chọn Tỉnh/Thành phố--</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Quận/ Huyện: <span>(*)</span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" id="district" name="district" value="${sessionScope.auth.district}"
                                                    placeholder="Quận/ Huyện" class="validate[required,custom[email]] form-control input-sm">
                                                <select class="validate[required] form-control input-sm" id="quan" name="quan" title="Chọn Quận Huyện">
                                                    <option value="0">--Chọn Quận/ Huyện--</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Xã/ Phường/ Thị trấn: <span>(*)</span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" id="ward" name="ward" value="${sessionScope.auth.ward}"
                                                    placeholder="Xã/ Phường/ Thị trấn" class="validate[required,custom[email]] form-control input-sm">
                                                <select class="validate[required] form-control input-sm" id="phuong" name="phuong" title="Chọn Phường Xã">
                                                    <option value="0">--Chọn Phường/ Xã/ Thị trấn--</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label">Địa chỉ chi tiết:
                                                <span>(*)</span></label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="text" id="address" name="address"
                                                       value="${sessionScope.auth.detail_address}"
                                                       placeholder="Địa chỉ chi tiết"
                                                       class="validate[required] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <span style="color: red;" id="errorUpdate"></span>
                                    <input type="hidden" id="action" name="action" value="update">
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label"></label>
                                           <div style="display: flex;align-items: center;gap: 20px;justify-content: center">
                                               <button id="btnHuy" class="btn-update" type="submit">CẬP NHẬT</button>
                                               <div>
                                                   <button id="btnUpdate" class="btn-update" type="submit">XÁC NHẬN</button>
                                               </div>
                                           </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!--/row-->
                    </div>
                    <div class="tab-pane" id="messages">
                        <!-- <h5 class="mb-3">Thông Tin Tài Khoản</h5> -->
                        <div class="row">
                            <div class="col-md-12">
                                <header>
                                    <h1>THAY ĐỔI MẬT KHẨU</h1>
                                    <div class="content">Bạn nên cập nhật mật khẩu thường xuyên vì lí do bảo mật</div>
                                </header>
                                <form id="formAcount" class="formAcount validate clearfix">
                                    <span style="color: red;" id="errorReset"></span>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label"> Mật khẩu cũ: </label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="password" id="old-pass" name="pass" class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label"> Mật khẩu mới: </label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="password" id="password" name="newpass" class="validate[required,minSize[4],maxSize[32]] form-control input-sm"
                                                oninput="getPower(this.value)">
                                                <label for="password">Power password</label>
                                                <div class="power-container">
                                                    <div id="power-point"></div>
                                                </div>
                                                <span id="color-status"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label"> Xác nhận mật khẩu: </label>
                                            <div class="col-lg-6 col-md-9">
                                                <input type="password" id="pass" name="renewpass" class="validate[required,minSize[4],maxSize[32]] form-control input-sm">
                                            </div>
                                        </div>
                                    </div>
                                    <input type="hidden" id="act-reset" name="action" value="reset">
                                    <div class="form-group clearfix">
                                        <div class="row">
                                            <label class="col-md-3 control-label"></label>
                                            <div class="col-lg-6 col-md-9">
                                                <button id="btnReset" class="btn-update" type="submit">LƯU</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!--/row-->
                    </div>
                    <div class="tab-pane myorder__style" id="edit">
                        <!-- <div class="heading">Đơn hàng của tôi</div> -->
                        <div class="inner">
                            <table>
                                <thead>
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Thời gian đặt hàng</th>
                                    <th>Thời gian thanh toán</th>
                                    <th>Hình thức thanh toán</th>
                                    <th>Trạng thái đơn hàng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    Map<Order, List<OrderItem>> orders = (Map<Order, List<OrderItem>>) request.getAttribute("order");
                                    User user = (User) session.getAttribute("auth");
                                    if (user != null && orders != null && !orders.isEmpty()) {
                                        for (Order entry : orders.keySet()) {
                                %>
                                <tr>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/user/order_detail?id=<%=entry.getId()%>"><%=entry.getId()%></a>
                                    </td>
                                    <td><%=entry.getDateCreated()%></td>
                                    <td><%=entry.getDatePayment()==null?"":entry.getDatePayment()%></td>
                                    <td>
                                        <%
                                            if (entry.getPayment().getId() == 1) {
                                        %>
                                            Tiền Mặt
                                        <%
                                            } else if (entry.getPayment().getId() == 3) {
                                        %>
                                            VNPay
                                        <%
                                            } else {
                                        %>
                                            Momo
                                        <%
                                            }
                                        %>
                                    </td>
                                    <td>
                                        <%
                                            if (entry.getStatus().getId() == 1) {
                                        %>
                                            Chờ thanh toán
                                        <%
                                        } else if (entry.getStatus().getId() == 2) {
                                        %>
                                            Chờ vận chuyển
                                        <%
                                        } else if (entry.getStatus().getId() == 3) {
                                        %>
                                            Chờ giao hàng
                                        <%
                                        } else if (entry.getStatus().getId() == 5) {
                                        %>
                                            Đã huỷ
                                        <%
                                        } else if (entry.getStatus().getId() == 6) {
                                        %>
                                            Trả hàng/ Hoàn tiền
                                        <%
                                        } else if (entry.getStatus().getId() == 7) {
                                        %>
                                            Chờ xử lý
                                        <%
                                        }
                                        %>
                                    </td>
                                </tr>
                                <%
                                    }
                                }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
<div class="tab-pane" id="favourite">
<%--    <h2 id="favorite" class="mb-4">Không co sản phẩm yêu thích</h2>--%>
    <div class="container" id="container">
        <%
            List<WishlistItem> wishlist = (List<WishlistItem>) session.getAttribute("wishlist");
            String ip = request.getHeader("X-FORWARDED-FOR");
            if (ip == null) ip = request.getRemoteAddr();
            if(user!=null && wishlist !=null && !wishlist.isEmpty()) {
        %>
        <table id="orderDetailsTable" class="table table-striped table-bordered" style="width:100%">
            <thead>
            <tr>
                <th>Ảnh</th>
                <th>Tên sản phẩm</th>
                <th>Loại sản phẩm</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
        <%}%>
        <%
            if(user!=null && wishlist !=null && !wishlist.isEmpty()) {
                for (WishlistItem item : wishlist) {
                    Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(item.getProduct().getId()), ip, "/user/cart");
                    for(Map.Entry<Product, List<String>> entry : products.entrySet()) {
        %>
            <tr id="w<%=entry.getKey().getId()%>">
                <td><img style="width: 100px; height: 100px" src="${pageContext.request.contextPath}<%=entry.getValue().getFirst()%>"/></td>
                <td><%=entry.getKey().getProductName()%></td>
                <td><%=entry.getKey().getCate().getCategoryName()%></td>
                <td><a href="javascript:void(0);" onclick="removeFromWishlist('<%=entry.getKey().getId()%>')">X</a></td>
            </tr>
        <%          }
                }
            }
            if(user!=null && wishlist !=null && !wishlist.isEmpty()) {
        %>
            </tbody>
        </table>
        <%
            }
        %>
    </div>
</div>
                    <!-- Tab "Tạo Cặp Khóa Mới" -->
                    <div class="tab-pane text-center" id="createKeyPair">
                        <header>
                            <h1>Tạo Cặp Khóa Mới</h1>
                            <div class="content">Tạo một cặp khóa mới để bảo mật tài khoản của bạn.</div>
                        </header>

                        <!-- Nút Tạo Cặp Khóa Mới -->
                        <div id="createKeyPairButton" class="voltage-button">
                            <form>
                                <input type="hidden" value="change" id="keyAction">
                                <button id="btnKey" type="button">Tạo Cặp Khóa Mới</button>
                            </form>
                            <svg width="10px" height="10px">
                                <path d="M1,5 L5,9 L9,5"></path>
                            </svg>
                        </div>

                        <!-- Văn bản "Hoặc" -->
                        <div class="separator-text" style="margin: 20px 0; font-size: 16px; font-weight: bold; color: #555;">
                            Hoặc
                        </div>

                        <!-- Nút Upload Public Key -->
                        <div id="uploadPublicKeyButton" class="voltage-button">
                            <form id="uploadKeyForm" enctype="multipart/form-data" method="POST" action="/user/uploadPublicKey">
                                <label for="publicKeyFile" style="display: block; margin-bottom: 10px; font-weight: bold;">
                                    Tải Lên Public Key
                                </label>
                                <input
                                        type="file"
                                        id="publicKeyFile"
                                        name="publicKeyFile"
                                        accept=".pem"
                                        style="display: block; margin-bottom: 10px; padding: 8px; border: 1px solid #ccc; border-radius: 4px; width: 100%; max-width: 400px;"
                                >
                                <button
                                        id="uploadButton"
                                        type="submit"
                                        style="display: inline-block; background-color: #007bff; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer;"
                                >
                                    Upload
                                </button>
                                <svg width="10px" height="10px">
                                    <path d="M1,5 L5,9 L9,5"></path>
                                </svg>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
                    <div class="col-lg-4 order-lg-1 text-center img-2">
                <div class="img-ava">
                    <img src="${empty sessionScope.auth.avatar ? '/uploads/default.png' : sessionScope.auth.avatar}" class="mx-auto img-fluid img-circle d-block" id="avatar" style="border-radius: 1px">
                    <label class="load-ava">
                        <span class="custom-file-control">Đổi Ảnh</span>
                        <input type="file" id="file" class="custom-file-input">
                    </label>
                </div>

                <h6 class="mt-2">Ảnh Đại Diện</h6>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/user/include/footer.jsp" %>
</div>
<script src="/assets/user/js/thuvien/jquery-3.3.1.min.js"></script>
<script src="/assets/user/js/thuvien/bootstrap.min.js"></script>
<script src="/assets/user/js/thuvien/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://esgoo.net/scripts/jquery.js"></script>
<script>
    window.addEventListener('scroll', () => {
        var header = document.querySelector('.container-2')
        header.classList.toggle('sticky', window.scrollY > 100)
    });
</script>
<script>
    var hidden = true;
    function toggleHidden(event) {
        hidden = !hidden;
        updateVisibility();
    }
    function handleCancel(event) {
        event.preventDefault();  // Ngăn chặn hành vi mặc định, không gửi form
        toggleHidden();          // Chạy hàm toggle để thay đổi trạng thái và cập nhật giao diện
    }

    function updateVisibility() {
        var cityI = document.getElementById("city");
        var districtI = document.getElementById("district");
        var wardI = document.getElementById("ward");
        var city = document.getElementById("tinh");
        var district = document.getElementById("quan");
        var ward = document.getElementById("phuong");
        var update = document.getElementById("btnUpdate");
        var huy = document.getElementById("btnHuy");
        if (hidden) {
            city.style.display = 'none';
            district.style.display = 'none';
            ward.style.display = 'none';
            cityI.style.display = 'block';
            districtI.style.display = 'block';
            wardI.style.display = 'block';
            update.style.display = 'none';
        } else {
            city.style.display = 'block';
            district.style.display = 'block';
            ward.style.display = 'block';
            cityI.style.display = 'none';
            districtI.style.display = 'none';
            wardI.style.display = 'none';
            update.style.display = 'block';
            huy.style.background = 'silver';
        }
    }
    // document.getElementById("btnUpdate").addEventListener("click", toggleHidden);
    document.getElementById("btnHuy").addEventListener("click", handleCancel);
    document.addEventListener("DOMContentLoaded", updateVisibility);
</script>
<script type="text/javascript">
    document.getElementById('file').onchange = function() {
        var fileInput = document.getElementById('file');
        var formData = new FormData();
        if (fileInput.files.length > 0) {
            formData.append("filename", fileInput.files[0]);
            formData.append("action", "set");
            $.ajax({
                url: "${pageContext.request.contextPath}/user/updateinfouser",
                type: "POST",
                data: formData,
                processData: false,  // Báo cho jQuery không xử lý dữ liệu
                contentType: false,  // Báo cho jQuery không thiết lập contentType
                success: function (result) {
                    $('#avatar').attr("src", "/uploads/" + result.status);
                },
                error: function() {
                }
            });
        }
    };
</script>
<script>
    $(document).ready(function () {
        // Lấy tỉnh thành
        $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
            if (data_tinh.error == 0) {
                $.each(data_tinh.data, function (key_tinh, val_tinh) {
                    $("#tinh").append('<option value="' + val_tinh.id + '" data-full-name="' + val_tinh.full_name + '">' + val_tinh.full_name + '</option>');
                });
            }
        });

        $("#tinh").change(function (e) {
            var idtinh = $(this).val(); // lấy ID của tỉnh
            var fullNameTinh = $("#tinh option:selected").data('full-name'); // lấy full name của tỉnh đã chọn
            // Lấy quận huyện
            $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function (data_quan) {
                if (data_quan.error == 0) {
                    $("#quan").empty().append('<option value="0">--Chọn Quận Huyện--</option>');
                    $("#phuong").empty().append('<option value="0">--Chọn Phường/ Xã/ Thị trấn--</option>');
                    $.each(data_quan.data, function (key_quan, val_quan) {
                        $("#quan").append('<option value="' + val_quan.id + '" data-full-name="' + val_quan.full_name + '">' + val_quan.full_name + '</option>');
                    });
                }
            });
        });

        $("#quan").change(function (e) {
            var idquan = $(this).val(); // lấy ID của quận/huyện
            var fullNameQuan = $("#quan option:selected").data('full-name'); // lấy full name của quận/huyện đã chọn
            // Lấy phường xã
            $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                if (data_phuong.error == 0) {
                    $("#phuong").empty().append('<option value="0">--Chọn Phường/ Xã/ Thị trấn--</option>');
                    $.each(data_phuong.data, function (key_phuong, val_phuong) {
                        $("#phuong").append('<option value="' + val_phuong.id + '" data-full-name="' + val_phuong.full_name + '">' + val_phuong.full_name + '</option>');
                    });
                }
            });
        });
    });
</script>
<script>
    var context = "${pageContext.request.contextPath}";
    $(document).ready(function() {
        $('#btnUpdate').click(function (event) {
            if(!hidden) {
                event.preventDefault();
                var fullName = $('#fullName').val();
                var birthday = $('#birthday').val();
                var phone = $('#mobile').val();
                var email = $('#email').val();
                var fullNameTinh = $("#tinh option:selected").data('full-name');
                var fullNameQuan = $("#quan option:selected").data('full-name');
                var fullNamePhuong = $("#phuong option:selected").data('full-name');
                var address = $('#address').val();
                var action = $('#action').val();
                $.ajax({
                    type: 'POST',
                    data: {
                        fullName: fullName,
                        birthday: birthday,
                        phone: phone,
                        email: email,
                        tinh: fullNameTinh,
                        quan: fullNameQuan,
                        phuong: fullNamePhuong,
                        address: address,
                        action: action
                    },
                    url: 'updateinfouser',
                    success: function (result) {
                        try {
                            if (result.status !== "success") {
                                $('#errorUpdate').html(result.error);
                            } else {
                                window.location.href = context + "/user/updateinfouser";
                            }
                        } catch (e) {
                            $('#errorUpdate').html("Error loading request, please try again!");
                        }
                    },
                    error: function() {
                        $('#errorUpdate').html("Connection errors. Please check your network and try again!");
                    }
                });
            }
        });
    });
</script>
<script>
    function getPower(password) {
        let point = 0;
        let colorPower = ['#D73F40', '#DC6551', '#F2B84F', '#BDE952', '#30CEC7'];
        let stringColor = ['', 'weak', 'medium', 'strong', 'very strong'];
        let power = document.getElementById('power-point');
        let widthPower = ['1%', '25%', '50%', '75%', '100%'];
        if (password.length >= 8) {
            let arrayTest = [/[0-9]/, /[a-z]/, /[A-Z]/, /[^0-9a-zA-Z]/];
            arrayTest.forEach(item => {
                if(item.test(password)) {
                    point += 1;
                }
            });
        }
        power.style.width = widthPower[point];
        power.style.backgroundColor = colorPower[point];
        document.getElementById('color-status').innerHTML = stringColor[point];
    }
</script>
<script>
    var context = "${pageContext.request.contextPath}";
    $(document).ready(function() {
        $('#btnReset').click(function (event) {
            event.preventDefault();
            var oldPass = $('#old-pass').val();
            var password = $('#password').val();
            var repass = $('#pass').val();
            var action = $('#act-reset').val();
            $.ajax({
                type: 'POST',
                data: {
                    oldPass: oldPass,
                    password: password,
                    repass: repass,
                    action: action
                },
                url: 'updateinfouser',
                success: function (result) {
                    try {
                        if (result.status !== "success") {
                            $('#errorReset').html(result.error);
                        } else {
                            window.location.href = context + "/user/updateinfouser";
                        }
                    } catch (e) {
                        $('#errorReset').html("Error loading request, please try again!");
                    }
                },
                error: function() {
                    $('#errorReset').html("Connection errors. Please check your network and try again!");
                }
            });
        });
    });
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var context = "${pageContext.request.contextPath}";
    $(document).ready(function() {
        $('#btnKey').click(function (event) {
            event.preventDefault();
            var action = $('#keyAction').val();
            console.log(action)
            $.ajax({
                type: 'POST',
                data: {
                    action: action
                },
                url: 'updateinfouser',
                dataType: 'json',
                success: function (result) {
                    try {
                        if (result.status === "success") {
                            alert("Link xác thực tạo khoá mới đã được gửi về mail của bạn!")
                        } else {
                            alert("Error 1!")
                        }
                    } catch (e) {
                        alert("Error 2!")
                    }
                },
                error: function() {
                    alert("Error 3!")
                }
            });
        });
    });
</script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-2.0.5/datatables.min.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-2.0.5/datatables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    new DataTable('#orderDetailsTable', {
        layout: {
            bottomEnd: {
                paging: {
                    boundaryNumbers: false
                }
            }
        }
    });
</script>
<script>
    function removeFromWishlist(productId) {
        $.ajax({
            url: "${request.servletContext.contextPath}/user/wishlist",
            method: "POST",
            data: {
                productId: productId,
                action: "remove"
            },
            success: function (response) {
                console.log(response)
                if (response.status === "success") {
                    Swal.fire({
                        position: "center",
                        icon: "success",
                        title: "Xoá Khỏi Wishlist Thành Công!",
                        showConfirmButton: false,
                        timer: 1500
                    });
                    const wishlistItem = document.getElementById("w" + productId);
                    const container = document.getElementById("container");
                    const favorite = document.getElementById("favorite");
                    wishlistItem.style.display = "none";
                    if(response.size==="0") {
                        container.style.display = "none";
                    } else {
                        favorite.style.display = "none";
                    }
                } else {
                    window.location.href = context + "/user/signin";
                }
            }
        });
    }
</script>
<script>
    // Lắng nghe sự kiện submit trên form tải lên Public Key
    document.getElementById('uploadKeyForm').addEventListener('submit', function(event) {
        event.preventDefault();  // Ngăn form submit mặc định

        // Lấy file từ input
        const fileInput = document.getElementById('publicKeyFile');
        const file = fileInput.files[0];

        // Kiểm tra nếu có file được chọn
        if (!file) {
            alert('Vui lòng chọn một file để tải lên.');
            return;
        }

        // Đọc nội dung của file (public key)
        const reader = new FileReader();
        reader.onload = function(event) {
            // Lấy nội dung của tệp là một chuỗi
            const publicKeyContent = event.target.result.trim();  // Đảm bảo rằng không có ký tự dư thừa

            // Kiểm tra xem nội dung có phải là một public key dạng PEM không
            if (isPemFormat(publicKeyContent)) {
                // Tách public key (loại bỏ phần header và footer PEM)
                const publicKey = extractPublicKey(publicKeyContent);

                // Gửi yêu cầu AJAX với public key qua POST
                sendPublicKeyToServer(publicKey);
            } else {
                // Nếu không phải PEM, lấy dòng đầu tiên làm public key
                const firstLine = publicKeyContent.split('\n')[0].trim();

                // Gửi yêu cầu AJAX với public key qua POST
                sendPublicKeyToServer(firstLine);
            }
        };

        // Đọc nội dung của file dưới dạng văn bản (text)
        reader.readAsText(file);
    });

    // Kiểm tra xem nội dung có phải là định dạng PEM không
    function isPemFormat(content) {
        const pemHeader = "-----BEGIN PUBLIC KEY-----";
        const pemFooter = "-----END PUBLIC KEY-----";
        return content.startsWith(pemHeader) && content.endsWith(pemFooter);
    }

    // Tách public key ra khỏi phần header và footer của PEM
    function extractPublicKey(content) {
        const pemHeader = "-----BEGIN PUBLIC KEY-----";
        const pemFooter = "-----END PUBLIC KEY-----";
        // Loại bỏ phần header và footer PEM
        let publicKey = content.replace(pemHeader, '').replace(pemFooter, '').trim();
        return publicKey;
    }

    // Gửi public key lên server
    function sendPublicKeyToServer(publicKey) {
        fetch('/user/uploadPublicKey', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',  // Chỉ định kiểu dữ liệu JSON
            },
            body: JSON.stringify({ publicKey: publicKey })  // Gửi public key dưới dạng JSON
        })
            .then(response => response.json())
            .then(data => {
                if (data.status === "success") {
                    alert('Tải lên thành công!');
                } else {
                    alert('Lỗi khi tải lên: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Có lỗi xảy ra:', error);
                alert('Có lỗi xảy ra. Vui lòng thử lại.');
            });
    }
</script>


</body>
</html>