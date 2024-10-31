<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.service.impl.ProductService" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/assets/user/css/thuvien/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/thuvien/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/assets/user/css/cart/cart.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
          sizes="192x192"/>
    <title>Giỏ hàng</title>
    <style>
        .input-number {
            text-align: center;
            width: 10px;
            margin: 0 5px;
            padding: 6px;
        }
        .btn-increase, .btn-decrease {
            cursor: pointer;
            padding: 5px 10px;
            font-size: 16px;
            background-color: #f2f2f2;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>
<div class="website-wrapper">
    <%@include file="/WEB-INF/user/include/header.jsp" %>
    <div class="page-title" style="background-image: url(https://tienthangvet.vn/wp-content/uploads/title-tag-tien-thang-vet-tsd1.jpg);">
        <div class="container">
            <h1 class="title">Giỏ hàng</h1>
        </div>
    </div>
    <section class="shoping-cart spad">
    <%
        if (cart.isEmpty()) {
    %>
        <h1 style="text-align: center">Vui lòng mua sắm</h1>
    <%
        } else {
            double result = (double) session.getAttribute("result");
            if(result==0.0) {
    %>
        <h1 id="please" style="text-align: center">Vui lòng mua sắm</h1>
        <%
            }
        %>
        <h1 id="please" style="text-align: center"></h1>
        <div id="container1" class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                            <tr>
                                <th class="shoping__product">Sản phẩm</th>
                                <th>Giá bán</th>
                                <th>Số lượng</th>
                                <th>Tổng</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                String ip = request.getHeader("X-FORWARDED-FOR");
                                if (ip == null) ip = request.getRemoteAddr();

                                for (CartItem item : cart) {
                                    Product p = new Product(item.getProduct().getId());
                                    Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(p, ip, "/user/cart.jsp");
                                    for (Map.Entry<Product, List<String>> entry : products.entrySet()) {
                                        int total = item.getQuantity()*entry.getKey().getPrice();
                            %>
                            <tr id="tr<%=entry.getKey().getId()%>">
                                <td class="shoping__cart__item">
                                    <img src="${pageContext.request.contextPath}<%=entry.getValue().get(0)%>" alt="">
                                    <h5><%=entry.getKey().getProductName()%>
                                    </h5>
                                </td>
                                <c:set var="unit" value=" VND"/>
                                <td id="pr<%=entry.getKey().getId()%>" class="shoping__cart__price">
                                    <fmt:formatNumber value="<%=entry.getKey().getPrice()%>" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}
                                </td>
                                <td class="shoping__cart__quantity">
                                    <div class="quantity" style="align-items: center;display: flex;justify-content: center;">
                                        <div class="pro-qty" style="display: flex;justify-content: center;align-items: center;">
                                            <button id="decrease" class="btn-decrease">-</button>
                                            <input type="number" id="p<%=entry.getKey().getId()%>" class="input-number"
                                                   value="<%=item.getQuantity()%>" min="0" max="<%=entry.getKey().getQuantity()%>">
                                            <button id="increase" class="btn-increase">+</button>
                                        </div>
                                    </div>
                                </td>
                                <td id="t<%=entry.getKey().getId()%>" class="shoping__cart__total">
                                    <fmt:formatNumber value="<%=total%>" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}
                                </td>
                                <td class="shoping__cart__item__close">
                                    <button style="font-size: 18px;background-color: white"
                                       onClick="changeStatus('<%=entry.getKey().getId()%>', 0, 'delete')">X</button>
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
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="${pageContext.request.contextPath}/user/products" class="primary-btn cart-btn">TIẾP TỤC MUA SẮM</a>
                    </div>
                </div>
                <div class="custom-row">
                    <div class="custom-col">
                        <div class="shoping__continue">
                            <div class="shoping__discount">
                                <h5>Mã giảm giá</h5>
                                <span id="errorDiscount" style="color: red;"></span>
                                <form>
                                    <input type="text" id="discount" name="discount" placeholder="Nhập mã giãm giá mua hàng" value="${sessionScope.discount.code}">
                                    <button id="btnDiscount" class="site-btn">SỬ DỤNG MÃ</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="custom-col">
                        <div class="shoping__checkout">
                            <h5>TỔNG TIỀN GIỎ HÀNG</h5>
                            <ul>
                                <li>Giảm: <span id="retain">${sessionScope.retain==null?0.0:sessionScope.retain}${unit}</span></li>
                                <li>Tổng: <span id="result">${sessionScope.result}${unit}</span></li>
                            </ul>
                            <a href="${pageContext.request.contextPath}/user/checkout" class="primary-btn">TIẾN HÀNH THANH TOÁN</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <%
        }
    %>
    </section>
    <%@include file="/WEB-INF/user/include/footer.jsp" %>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://esgoo.net/scripts/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    window.addEventListener('scroll', () => {
        var header = document.querySelector('.container')
        header.classList.toggle('sticky', window.scrollY > 100)
    })
</script>
<script>
    var context = "${pageContext.request.contextPath}";
    $(document).ready(function() {
        $('#btnDiscount').click(function (event) {
            event.preventDefault();
            var discountName = $('#discount').val();
            $.ajax({
                type: 'POST',
                data: {
                    discountName: discountName,
                    action: "check"
                },
                url: '${pageContext.request.contextPath}/user/cart',
                success: function (response) {
                    const retain = document.getElementById("retain");
                    const result = document.getElementById("result");
                    if (response.state === "notfound" || response.state === "notempty" || response.state === "outquantity") {
                        $('#errorDiscount').html(response.error);
                        result.innerHTML = response.result + " VND";
                        retain.innerHTML = response.rect + " VND"
                    } else if (response.state === "duplicate") {
                        $('#errorDiscount').html(response.error);
                    } else {
                        Swal.fire({
                            position: "center",
                            icon: "success",
                            title: "Thêm Sản Phẩm Vào Giỏ Hàng Thành Công!",
                            showConfirmButton: false,
                            timer: 1500
                        });
                        $('#errorDiscount').html("");
                        result.innerHTML = response.result + " VND";
                        retain.innerHTML = response.rect + " VND"
                    }
                }
            });
        });
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.pro-qty').forEach(function(proQty) {
            const input = proQty.querySelector('.input-number');
            const btnIncrease = proQty.querySelector('.btn-increase');
            const btnDecrease = proQty.querySelector('.btn-decrease');

            input.addEventListener('input', function() {
                const min = parseInt(input.min, 10);
                const max = parseInt(input.max, 10);
                let value = parseInt(input.value, 10);

                if (value > max) {
                    input.value = max;
                } else if (value < min) {
                    input.value = min;
                }
            });

            btnIncrease.addEventListener('click', function() {
                const max = parseInt(input.max, 10);
                let value = parseInt(input.value, 10);
                if (value < max) {
                    input.value = value + 1;
                    changeStatus(input.id.slice(1), value + 1, 'put');
                }
            });

            btnDecrease.addEventListener('click', function() {
                const min = parseInt(input.min, 10);
                let value = parseInt(input.value, 10);
                if (value > min) {
                    input.value = value - 1;
                    changeStatus(input.id.slice(1), value - 1, 'put');
                }
            });
        });
    });
</script>
<script>
    function changeStatus(pid, quantity, action) {
        // Lấy giá tiền từng sản phẩm và loại bỏ các ký tự không phải số (VND và dấu phẩy)
        const priceText = document.querySelector('#pr' + pid).textContent.replace(/[^0-9]/g, '');
        const price = parseInt(priceText, 10);
        // Tính toán tổng tiền mới
        const total = price * quantity;
        // Cập nhật DOM cho tổng tiền của sản phẩm
        document.querySelector('#t' + pid).textContent = total.toLocaleString('vi-VN') + ' VND';
        // Cập nhật số lượng trong DOM, nếu số lượng là 0, xóa hàng
        if (quantity === 0) {
            document.querySelector("#tr" + pid).remove();
        } else {
            document.querySelector('#p' + pid).textContent = quantity;
        }
        $.ajax({
            url: "${request.servletContext.contextPath}/user/cart",
            type: 'POST',
            data: {
                id: pid,
                quantity: quantity,
                action: action
            },
            success: function(response) {
                console.log(response)
                Swal.fire({
                    position: "center",
                    icon: "success",
                    title: "Thay Đổi Giỏ Hàng Thành Công!",
                    showConfirmButton: false,
                    timer: 1500
                });
                const badge = document.getElementById("badge");
                const result = document.getElementById("result");
                const please = document.getElementById("please");
                const container = document.getElementById("container1");
                const retain = document.getElementById("retain");
                badge.innerHTML = response.total;
                if (response.state === "zero") {
                    please.style.display = "block";
                    please.innerHTML = "Vui lòng mua sắm";
                    container.style.display = "none";
                } else {
                    result.innerHTML = response.result + " VND";
                    retain.innerHTML = response.rect + " VND"
                    please.style.display = "none";
                }
            }
        });
    }
</script>
</body>
</html>