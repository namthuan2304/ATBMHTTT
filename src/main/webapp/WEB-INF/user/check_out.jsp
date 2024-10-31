<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.service.impl.ProductService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <link rel="stylesheet" href="/assets/user/css/thuvien/bootstrap.min.css" type="text/css" />
  <link rel="stylesheet" href="/assets/user/css/thuvien/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="/assets/user/css/thuvien/elegant-icons.css" type="text/css">
  <link rel="stylesheet" href="/assets/user/css/thuvien/nice-select.css" type="text/css">
  <link rel="stylesheet" href="/assets/user/css/thuvien/jquery-ui.min.css" type="text/css">
  <link rel="stylesheet" href="/assets/user/css/thuvien/owl.carousel.min.css" type="text/css">
  <link rel="stylesheet" href="/assets/user/css/thuvien/slicknav.min.css" type="text/css">
  <link rel="stylesheet" href="/assets/user/css/cart/checkout.css" type="text/css" />
  <link rel="stylesheet" href="/assets/user/css/header&footer.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
        sizes="192x192" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <title>Checkout</title>
  <style>
    table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0 10px;
    }
    table tr {
      background-color: #f9f9f9;
    }
    table th, table td {
      padding: 8px;
      text-align: left;
    }
    table th {
      background-color: #f2f2f2;
    }
  </style>
</head>
<body>
<%@include file="/WEB-INF/user/include/header.jsp" %>
<div class="page-title" style="background-image: url(https://tienthangvet.vn/wp-content/uploads/title-tag-tien-thang-vet-tsd1.jpg);">
  <div class="container">
    <h1 class="title">Thanh toán</h1>
  </div>
</div>
<section class="checkout spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <h6>
          <span class="icon_tag_alt"></span>
          <form class="d-flex align-items-center w-50 mx-auto mt-2">
            <input type="text" id="discount" class="form-control" placeholder="Nhập mã giảm giá" value="${sessionScope.discount.code}">
            <button type="submit" id="btnDiscount" class="btn btn-success" style="white-space: nowrap">Áp dụng</button>
          </form>
          <span id="errorDiscount" style="color: red;"></span>
        </h6>
      </div>
    </div>
    <h4>Chi tiết đơn hàng</h4>
    <form>
      <div class="row">
        <div class="col-lg-5 col-md-6">
          <div class="row">
            <div class="col-lg-6">
              <div class="checkout__input">
                <p>Họ và tên<span>*</span></p>
                <input class="form-control" type="text" id="full_name" required />
              </div>
            </div>
            <div class="col-lg-6">
              <div class="checkout__input">
                <p>Điện thoại<span>*</span></p>
                <input type="text" id="phone" required />
              </div>
            </div>
          </div>
          <div class="checkout__input">
            <p>Địa chỉ<span>*</span></p>
            <input type="text" id="address" placeholder="Số nhà / Đường" class="checkout__input__add" required />
          </div>
          <div class="checkout__input">
            <p>Tỉnh / Thành phố<span>*</span></p>
            <select class="form-control" id="tinh" name="tinh" title="Chọn Tỉnh Thành" required>
              <option value="0">--Chọn Tỉnh/Thành phố--</option>
            </select>
          </div>

          <div class="checkout__input">
            <p>Huyện / Quận<span>*</span></p>
            <select class="form-control" id="quan" name="quan" title="Chọn Quận Huyện" required>
              <option value="0">--Chọn Quận/ Huyện--</option>
            </select>
          </div>

          <div class="checkout__input">
            <p>Xã / Phường / Thị trấn<span>*</span></p>
            <select class="form-control" id="phuong" name="phuong" title="Chọn Phường Xã" required>
              <option value="0">--Chọn Phường/ Xã/ Thị trấn--</option>
            </select>
          </div>

          <div class="row">
            <div class="col-lg-6">
              <div class="checkout__input">
                <p>Email<span>*</span></p>
                <input class="form-control" type="email" id="email" required />
              </div>
            </div>
            <div class="col-lg-6">
              <div class="checkout__input">
                <p>At Home?<span></span></p>
                <input class="form-control" type="checkbox" style="width: 30px;height: 30px" id="at-home" name="at-home">
              </div>
            </div>
          </div>

        </div>
        <div class="col-lg-7 col-md-6">
          <div class="checkout__order" style="background-color: #ccc">
            <div >
              <h2>Thông tin sản phẩm trong giỏ hàng:</h2>
              <c:set var="unit" value="VND"/>
              <%
                String ip = request.getHeader("X-FORWARDED-FOR");
                if (ip == null) ip = request.getRemoteAddr();
                List<CartItem> temp = (List<CartItem>) request.getAttribute("temp");
                if (temp == null || temp.isEmpty()) {
                  temp = cart;
                } else {
                  int id = temp.getFirst().getProduct().getId();
                  int quantity = temp.getFirst().getQuantity();
                }
              %>
              <table>
                <tr>
                  <th>Hình ảnh</th>
                  <th>Tên sản phẩm</th>
                  <th>Giá bán</th>
                  <th>Số lượng</th>
                </tr>
                <%
                  for (CartItem item : temp) {
                    Product p = new Product(item.getProduct().getId());
                    Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(p, ip, "/user/checkout.jsp");
                    for (Map.Entry<Product, List<String>> entry : products.entrySet()) {
                %>
                <tr sy>
                  <td>
                    <img style="width: 100px;height: 100px;object-fit: cover" src="<%=entry.getValue().get(0)%>" alt="">
                  </td>
                  <td><%=entry.getKey().getProductName()%></td>
                  <td>
                    <fmt:formatNumber value="<%=entry.getKey().getPrice()%>" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}
                  </td>
                  <td><%=item.getQuantity()%></td>
                </tr>
                <%
                    }
                  }
                %>
              </table>

              <div class="checkout__order__subtotal">
                Tổng: <br><strong id="result">${requestScope.totalNotVoucher} ${unit}</strong>
              </div>
              <div class="checkout__order__subtotal">
                Giảm: <br><strong id="retain">${sessionScope.retain==null?0.0:sessionScope.retain} ${unit}</strong>
              </div>
              <div class="checkout__order__subtotal">
                Phí vận chuyển: <br><strong><%=request.getAttribute("priceShipment")%> ${unit}</strong>
              </div>
              <div class="checkout__order__total">
                Tổng tiền thanh toán: <br><strong id="all" style="color: red;"><%=request.getAttribute("totalPrice")%> ${unit}</strong>
              </div>
            </div>
            <span style="color:red; margin-top: 10px;" id="error"></span>
            <div>
                <button type="submit" id="btn_submit" class="site-btn">Đặt hàng</button>
            </div>
            <div>
              <button type="button" id="btn_vnpay" class="site-btn">Thanh toán ngay</button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</section>
</div>
<%@include file="/WEB-INF/user/include/footer.jsp" %>
<script src="/assets/user/js/thuvien/jquery-3.3.1.min.js"></script>
<script src="/assets/user/js/thuvien/bootstrap.min.js"></script>
<script src="/assets/user/js/thuvien/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://esgoo.net/scripts/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  var context = "${pageContext.request.contextPath}";
  $(document).ready(function() {
    $('#btnDiscount').click(function (event) {
      event.preventDefault();
      var code = $('#discount').val();
      var id = '${param.id}';
      var quantity = '${param.quantity}';
      $.ajax({
        type: 'POST',
        data: {
          discountCode: code,
          action: "check",
          id: id,
          quantity: quantity
        },
        url: '${pageContext.request.contextPath}/user/checkout',
        success: function (response) {
          const retain = document.getElementById("retain");
          const result = document.getElementById("result");
          const all = document.getElementById("all");
          if (response.state === "notfound" || response.state === "notempty" || response.state === "outquantity") {
            $('#errorDiscount').html(response.error);
            all.innerHTML = response.last + " VND";
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
            all.innerHTML = response.last + " VND";
            result.innerHTML = response.result + " VND";
            retain.innerHTML = response.rect + " VND"
          }
        }
      });
    });
  });
</script>
<script>
  $(document).ready(function () {
    $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
      if (data_tinh.error == 0) {
        $.each(data_tinh.data, function (key_tinh, val_tinh) {
          $("#tinh").append('<option value="' + val_tinh.id + '" data-full-name="' + val_tinh.full_name + '">' + val_tinh.full_name + '</option>');
        });
      }
    });
    $("#tinh").change(function (e) {
      var idtinh = $(this).val();
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
      var idquan = $(this).val();
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
  function handleVnpayClick() {
    const fullName = document.getElementById("full_name").value;
    console.log(fullName)
    const phone = document.getElementById("phone").value;
    const address = document.getElementById("address").value;
    const email = document.getElementById("email").value;
    const atHome = document.getElementById("at-home").value;
    const id = '${param.id}';
    const quantity = '${param.quantity}';

    const priceElement = document.getElementById('all');
    const priceText = priceElement.innerText.split(' ')[0];
    const price = parseFloat(priceText);
    const amount = Math.round(price);

    var tinhId = document.getElementById("tinh").value;
    var quanId = document.getElementById("quan").value;
    var phuongId = document.getElementById("phuong").value;

    var tinhText = tinhId === "0" ? "" : $("#tinh option:selected").data('full-name');
    var quanText = quanId === "0" ? "" : $("#quan option:selected").data('full-name');
    var phuongText = phuongId === "0" ? "" : $("#phuong option:selected").data('full-name');

    const fields = [fullName, phone, address, email, amount, tinhText, quanText, phuongText];
    const emptyField = fields.some(field => field === "" || field === undefined || field === null);
    if (emptyField || tinhText === "0" || quanText === "0" || phuongText === "0") {
      document.getElementById('error').innerHTML = "Please fill in all information completely";
      return;
    }
    const data = {
      tinhText:tinhText, // oke
      quanText: quanText, // oke
      phuongText: phuongText, // oke
      vnp_OrderInfo: "Thanh toan don hang", // oke
      ordertype: "Sample order type", // oke
      amount: amount, // oke
      language: "vn", // oke
      txt_billing_mobile: phone, // oke
      txt_billing_email: email, // oke
      txt_billing_fullname: fullName, // oke
      txt_inv_addr1: address, // chưa test
      txt_bill_city: tinhText, // oke
      txt_bill_country: "Vietnam", // oke
      txt_bill_state: "HN", // oke
      txt_inv_mobile: phone, // oke
      txt_inv_email: email, // oke
      txt_inv_customer: fullName, // oke
      txt_inv_addr1: address, // chưa test
      txt_inv_company: "Sample Company", // oke
      txt_inv_taxcode: "123456789", // oke
      cbo_inv_type: "I", // oke
      atHome: atHome, // oke
      id: id, // oke
      quantity: quantity // oke
    };
    const formBody = Object.keys(data).map(key => encodeURIComponent(key) + '=' + encodeURIComponent(data[key])).join('&');
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "http://localhost:8080/user/vnpay", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        const response = JSON.parse(xhr.responseText);
        if (response.code === "00") {
          window.location.href = response.data;
        } else {
          alert("Error: " + response.message);
        }
      }
    };
    xhr.send(formBody);
  }
  document.getElementById("btn_vnpay").addEventListener("click", handleVnpayClick);
</script>
<script>
  $(document).ready(function() {
    $('#btn_submit').click(function (event) {
      event.preventDefault();
      var fullName = $('#full_name').val();
      var phone = $('#phone').val();
      var address = $('#address').val();
      var fullNameTinh = $("#tinh option:selected").data('full-name');
      var fullNameQuan = $("#quan option:selected").data('full-name');
      var fullNamePhuong = $("#phuong option:selected").data('full-name');
      var email = $('#email').val();
      var atHome = $('#at-home').is(':checked');
      var id = '${param.id}';
      var quantity = '${param.quantity}';
      $.ajax({
        type: 'POST',
        data: {
          fullName: fullName,
          phone: phone,
          email: email,
          tinh: fullNameTinh,
          quan: fullNameQuan,
          phuong: fullNamePhuong,
          address: address,
          atHome: atHome,
          id: id,
          quantity: quantity
        },
        url: context + '/user/checkout',
        success: handleResponse,
        error: handleError
      });
    });
    function handleResponse(response) {
      if (response.status === "success") {
        window.location.href = context + "/user/success";
      } else if(response.status === "failed") {
        window.location.href = context + "/user/signin";
      } else {
        $('#error').html(response.error);
      }
    }
    function handleError() {
      $('#error').html("Connection errors. Please check your network and try again!");
    }
  });
</script>
</body>
</html>