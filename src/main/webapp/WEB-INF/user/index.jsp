<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.model.WishlistItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/thuvien/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="/assets/user/css/HomePage/styles.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
          integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
          integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
          sizes="192x192"/>
    <title>Thuốc Y The Pet</title>
    <style>
        .product-element-top {
            position: relative;
        }

        .product-element-top .btn-buy {
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%) translateY(100%);
            opacity: 0;
            transition: all 0.3s ease-in-out;
        }

        .product-element-top:hover .btn-buy {
            transform: translateX(-50%) translateY(0);
            opacity: 1;
        }

        .btn-buy a {
            --color: #66b840;
            font-family: inherit;
            display: inline-block;
            width: 8em;
            height: 2.6em;
            cursor: pointer;
            line-height: 2.5em;
            margin: 20px;
            position: relative;
            overflow: hidden;
            border: 2px solid var(--color);
            transition: color .5s;
            z-index: 1;
            font-size: 17px;
            border-radius: 6px;
            font-weight: 500;
            color: var(--color);
        }

        .btn-buy a:before {
            content: "";
            position: absolute;
            z-index: -1;
            background: var(--color);
            height: 150px;
            width: 200px;
            border-radius: 50%;
        }

        .btn-buy a:hover {
            color: #fff;
        }

        .btn-buy a:before {
            top: 100%;
            left: 100%;
            transition: all .7s;
        }

        .btn-buy a:hover:before {
            top: -30px;
            left: -30px;
        }

        .btn-buy a:active:before {
            background: #ffa500;
            transition: background 0s;
        }
        .fa-solid {
            color: red;!important;
        }
    </style>
</head>
<body>
<%@include file="/WEB-INF/user/include/header.jsp" %>
<div class="body">
    <section id="section1" class="container">
        <div class="wrapper-slider">
            <div class="slider banner owl-carousel owl-theme">
                <div class="item">
                    <img src="/assets/user/img/home/slider1.png" alt=""/>
                </div>
                <div class="item">
                    <img src="/assets/user/img/home/slider2.png" alt=""/>
                </div>
                <div class="item">
                    <img src="/assets/user/img/home/slider3.png" alt=""/>
                </div>
                <div class="item">
                    <img src="/assets/user/img/home/slider4.png" alt=""/>
                </div>
            </div>
            <div class="slider-nav">
            </div>
        </div>
    </section>

    <section id="section2">
        <div class="image-box-wrapper">
            <div class="container">
                <div class="image-box-content">
                    <h1 class="image-box-title">Thú Y The Pet (TSD)</h1>
                    <p>
                        Công ty TNHH Thương Mại và Dịch Vụ Phát Triển The Pet (hay
                        còn gọi là TSD) được thành lập và chính thức đi vào hoạt động
                        từ năm 2017. Các đối tác của chúng tôi là các nhà sản xuất uy
                        tín trên thế giới từ Mỹ, Canada, Bỉ, Pháp, Hàn Quốc, Thái Lan,
                        Trung Quốc…
                    </p>

                    <p>
                        Công ty Thú Y The Pet chuyên phân phối chuỗi sản phẩm chăn nuôi,
                        thuốc thú y, thủy sản nhập khẩu cho các nhà máy thức ăn, trang
                        trại chăn nuôi, đại lý thú y và hệ thống phòng khám thú cưng
                        tại Việt Nam.
                    </p>

                    <p>
                        Công ty chúng tôi có đội ngũ nhân viên giàu kinh nghiệm, có
                        kiến thức chuyên môn cao, đầy tinh thần nhiệt huyết, luôn làm
                        việc hết mình với mục tiêu giúp tối ưu chi phí đầu tư cho
                        khách hàng.
                    </p>
                </div>
                <figure class="image-box-img">
                    <img src="https://tienthangvet.vn/wp-content/uploads/banner-so-luoc-Tien-Thang-Vet.jpg"/>
                </figure>
            </div>
        </div>
    </section>

    <section id="section3">
        <div class="wrapper-container">
            <div class="container">
                <section>
                    <div class="heading">
                        <h1>TẠI SAO CHỌN CHÚNG TÔI</h1>
                        <p>
                            Chúng tôi cung cấp rất nhiều sản phẩm, vật tư, thiết bị và
                            công nghệ thú y cho hoạt động kinh doanh đang phát triển của
                            khách hàng chuyên về gia súc,<br/>
                            gia cầm, thú cưng.
                        </p>
                    </div>
                </section>

                <section>
                    <div class="display">
                        <div class="display-item">
                            <div>
                                <img src="https://tienthangvet.vn/wp-content/uploads/2020/12/icon-thuoc-cho-ga-vit.png"
                                     alt=""/>
                            </div>
                            <h3 class="label">Gia cầm</h3>
                        </div>
                        <div class="display-item">
                            <div>
                                <img src="https://tienthangvet.vn/wp-content/uploads/2020/12/icon-thuoc-cho-trau-bo.png"
                                     alt=""/>
                            </div>
                            <h3 class="label">Gia súc</h3>
                        </div>
                        <div class="display-item">
                            <div>
                                <img src="https://tienthangvet.vn/wp-content/uploads/2020/12/icon-thuoc-cho-heo.png"
                                     alt=""/>
                            </div>
                            <h3 class="label">Heo</h3>
                        </div>
                        <div class="display-item">
                            <div>
                                <img src="https://tienthangvet.vn/wp-content/uploads/2020/12/icon-thuoc-cho-cho.png"
                                     alt=""/>
                            </div>
                            <h3 class="label">Chó</h3>
                        </div>
                        <div class="display-item">
                            <div>
                                <img src="https://tienthangvet.vn/wp-content/uploads/2020/12/icon-thuoc-cho-meo.png"
                                     alt=""/>
                            </div>
                            <h3 class="label">Mèo</h3>
                        </div>
                    </div>
                </section>

                <section>
                    <div class="wrapper-services">
                        <div class="services">
                            <div class="services-introduce">
                                <div>
                                    <p>
                                        Khách hàng sẽ tiết kiệm được thời gian và quản lý được
                                        chất lượng, tiêu chuẩn sản phẩm theo một hệ thống bởi
                                        chúng tôi cung cấp đa dạng các loại sản phẩm
                                    </p>
                                </div>
                                <div>
                                    <a href="${request.servletContext.contextPath}/user/products">Tất cả sản phẩm</a>
                                </div>
                            </div>
                            <div class="service">
                                <img src="https://tienthangvet.vn/wp-content/uploads/2020/12/icon-vaccine.jpg" alt=""/>
                                <p>
                                    Vắc <br/>
                                    xin
                                </p>
                            </div>
                            <div class="service">
                                <img src="https://tienthangvet.vn/wp-content/uploads/2020/12/icon-khang-sinh.jpg"
                                     alt=""/>
                                <p>Kháng <br/>sinh</p>
                            </div>
                            <div class="service">
                                <img src="https://tienthangvet.vn/wp-content/uploads/2020/12/icon-hoocmon.jpg" alt=""/>
                                <p>
                                    Hooc<br/>
                                    môn
                                </p>
                            </div>
                            <div class="service">
                                <img src="https://tienthangvet.vn/wp-content/uploads/2020/12/icon-sat-trung.jpg"
                                     alt=""/>
                                <p>
                                    Sát<br/>
                                    trùng
                                </p>
                            </div>
                            <div class="service">
                                <img src="https://tienthangvet.vn/wp-content/uploads/2020/12/icon-dinh-duong.jpg"
                                     alt=""/>
                                <p>Dinh <br/>dưỡng</p>
                            </div>
                            <div class="service">
                                <img src="https://tienthangvet.vn/wp-content/uploads/2020/12/icon-dau-tam.jpg" alt=""/>
                                <p>
                                    Dầu<br/>
                                    tắm
                                </p>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </section>

    <section id="section4">
        <div class="wrapper-content">
            <div class="wrapper-heading">
                <div class="heading">
                    <h1>SẢN PHẨM CHO THÚ CƯNG</h1>
                </div>
            </div>
            <div class="wrapper-container">
                <div class="container">
                    <div class="display-item">
                        <div>
                            <img src="https://tienthangvet.vn/wp-content/uploads/nokodemaseb-tri-nam-dang-xit.jpg"
                                 alt=""/>
                        </div>
                        <a href="${pageContext.request.contextPath}/user/product?id=14" class="button">Xem ngay</a>
                    </div>
                    <%
                        Map<Product, List<String>> products = (Map<Product, List<String>>) request.getAttribute("products");
                        List<WishlistItem> wishlist = (List<WishlistItem>) session.getAttribute("wishlist");
                        User user = (User) session.getAttribute("auth");
                        if (products != null && !products.isEmpty()) {
                            for (Map.Entry<Product, List<String>> entry : products.entrySet()) {
                                int remain = entry.getKey().getQuantity();
                                if (user != null && cart != null && !cart.isEmpty()) {
                                    for (CartItem item : cart) {
                                        if (item.getProduct().getId().equals(entry.getKey().getId()) && item.getUser().getId().equals(user.getId())) {
                                            remain = entry.getKey().getQuantity() - item.getQuantity();
                                        }
                                    }
                                }
                                boolean favorite = false;
                                if (user != null && wishlist != null && !wishlist.isEmpty()) {
                                    for (WishlistItem w : wishlist) {
                                        if (w.getProduct().getId().equals(entry.getKey().getId()) && w.getUser().getId().equals(user.getId())) {
                                            favorite = true;
                                        }
                                    }
                                }
                    %>
                    <div class="item">
                        <div>
                            <div  class="product-element-top">
                                <a href="${pageContext.request.contextPath}/user/product?id=<%=entry.getKey().getId()%>">
                                    <img src="${pageContext.request.contextPath}<%=entry.getValue().get(0)%>" alt="">
                                </a>
                                <div class="btn-buy">
                                    <a style="display: block;text-align: center" href="${pageContext.request.contextPath}/user/checkout?id=<%=entry.getKey().getId()%>">Mua ngay</a>
                                </div>
                            </div>
                            <div style="text-align: center" class="product-element-bottom ">
                                <a href="${pageContext.request.contextPath}/user/product?id=<%=entry.getKey().getId()%>">
                                    <%=entry.getKey().getProductName()%>
                                </a>
                                <div class="price">
                                    <c:set var="unit" value="VND"/>
                                    <fmt:formatNumber value="<%=entry.getKey().getPrice()%>" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}
                                </div>
                            </div>
                        </div>
                        <div class="wd-buttons wd-pos-r-t">
                            <div class="wd-add-btn wd-action-btn wd-style-icon wd-add-cart-icon">
                                <a href="javascript:void(0)" onclick="addCart(this, '<%=entry.getKey().getId()%>', '<%=remain%>')" class="button product_type_simple add-to-cart-loop">
                                    <span><i class="fa-solid fa-cart-shopping"></i></span>
                                </a>
                            </div>
                            <div class="quick-view wd-action-btn wd-style-icon wd-quick-view-icon">
                                <a href="" class="open-quick-view quick-view-button">
                                    <span>
                                        <i class="fa-solid fa-magnifying-glass"></i>
                                    </span>
                                </a>
                            </div>
                            <div class="wd-wishlist-btn wd-action-btn wd-style-icon wd-wishlist-icon">
                                <a class="wd-tltp wd-tooltip-inited" href="javascript:void(0)" id="w<%=entry.getKey().getId()%>"
                                   data-added-text="Browse Wishlist" onclick="toggleWishlist(this, '<%=entry.getKey().getId()%>')">
                                    <span class="wd-tooltip-label">
                                        <% if(favorite) {%>
                                        <i class="fa-solid fa-heart"></i>
                                        <%} else {%>
                                        <i class="fa-regular fa-heart"></i>
                                        <%}%>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="wrapper-content">
            <div class="wrapper-heading">
                <div class="heading">
                    <h1>SẢN PHẨM CHO GIA SÚC GIA CẦM</h1>
                </div>
            </div>
            <div class="wrapper-container">
                <div class="container">
                    <div class="display-item">
                        <div class="slider">
                            <c:choose>
                                <c:when test="${not empty pro}">
                                    <c:forEach var="banner" items="${pro}">
                                        <c:set var="img_banner" value="${banner.value[0]}" />
                                        <div>
                                            <img src="${pageContext.request.contextPath}${img_banner}" alt="">
                                        </div>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                    <%
                        Map<Product, List<String>> pro = (Map<Product, List<String>>) request.getAttribute("pro");
                        if (pro != null && !pro.isEmpty()) {
                            for (Map.Entry<Product, List<String>> entry : pro.entrySet()) {
                                int remain = entry.getKey().getQuantity();
                                if (user != null && cart != null && !cart.isEmpty()) {
                                    for (CartItem item : cart) {
                                        if (item.getProduct().getId().equals(entry.getKey().getId()) && item.getUser().getId().equals(user.getId())) {
                                            remain = entry.getKey().getQuantity() - item.getQuantity();
                                        }
                                    }
                                }
                                boolean favorite = false;
                                if (user != null && wishlist != null && !wishlist.isEmpty()) {
                                    for (WishlistItem w : wishlist) {
                                        if (w.getProduct().getId().equals(entry.getKey().getId()) && w.getUser().getId().equals(user.getId())) {
                                            favorite = true;
                                        }
                                    }
                                }
                    %>
                    <div class="item">
                        <div>
                            <div class="product-element-top">
                                <a href="${pageContext.request.contextPath}/user/product?id=<%=entry.getKey().getId()%>">
                                    <img src="${pageContext.request.contextPath}<%=entry.getValue().get(0)%>" alt="">
                                </a>
                                <div  class="btn-buy">
                                    <a style="display: block;text-align: center" href="${pageContext.request.contextPath}/user/checkout?id=<%=entry.getKey().getId()%>">Mua ngay</a>
                                </div>
                            </div>
                            <div style="text-align: center" class="product-element-bottom">
                                <a href="${pageContext.request.contextPath}/user/product?id=<%=entry.getKey().getId()%>">
                                    <%=entry.getKey().getProductName()%>
                                </a>
                                <div class="price">
                                    <c:set var="unit" value="VND"/>
                                    <fmt:formatNumber value="<%=entry.getKey().getPrice()%>" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}
                                </div>
                            </div>
                        </div>
                        <div class="wd-buttons wd-pos-r-t">
                            <div class="wd-add-btn wd-action-btn wd-style-icon wd-add-cart-icon">
                                <a href="javascript:void(0)" onclick="addCart(this, '<%=entry.getKey().getId()%>', '<%=remain%>')" class="button product_type_simple add-to-cart-loop">
                                            <span>
                                                <i class="fa-solid fa-cart-shopping"></i>
                                            </span>
                                </a>
                            </div>
                            <div class="quick-view wd-action-btn wd-style-icon wd-quick-view-icon">
                                <a href="" class="open-quick-view quick-view-button">
                                                <span>
                                                    <i class="fa-solid fa-magnifying-glass"></i>
                                                </span>
                                </a>
                            </div>
                            <div class="wd-wishlist-btn wd-action-btn wd-style-icon wd-wishlist-icon">
                                <a class="wd-tltp wd-tooltip-inited" href="javascript:void(0)" id="w<%=entry.getKey().getId()%>"
                                   data-added-text="Browse Wishlist" onclick="toggleWishlist(this, '<%=entry.getKey().getId()%>')">
                                     <span class="wd-tooltip-label">
                                        <% if(favorite) {%>
                                        <i class="fa-solid fa-heart"></i>
                                        <%} else {%>
                                        <i class="fa-regular fa-heart"></i>
                                        <%}%>
                                     </span>
                                </a>
                            </div>

                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
        <div class="wrapper-content">
            <div class="wrapper-heading">
                <div class="heading">
                    <h1>CÁC SẢN PHẨM KHÁC</h1>
                </div>
            </div>
            <div class="wrapper-container">
                <div class="container">
                    <div class="display-item">
                        <div class="slider">
                            <c:choose>
                                <c:when test="${not empty pr}">
                                    <c:forEach var="other" items="${pr}">
                                        <c:set var="img_other" value="${other.value[0]}" />
                                        <div>
                                            <img src="${pageContext.request.contextPath}${img_other}" alt="">
                                        </div>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                    <%
                        Map<Product, List<String>> pr = (Map<Product, List<String>>) request.getAttribute("pr");
                        if (pr != null && !pr.isEmpty()) {
                            for (Map.Entry<Product, List<String>> entry : pr.entrySet()) {
                                int remain = entry.getKey().getQuantity();
                                if (user != null && cart != null && !cart.isEmpty()) {
                                    for (CartItem item : cart) {
                                        if (item.getProduct().getId().equals(entry.getKey().getId()) && item.getUser().getId().equals(user.getId())) {
                                            remain = entry.getKey().getQuantity() - item.getQuantity();
                                        }
                                    }
                                }
                                boolean favorite = false;
                                if (user != null && wishlist != null && !wishlist.isEmpty()) {
                                    for (WishlistItem w : wishlist) {
                                        if (w.getProduct().getId().equals(entry.getKey().getId()) && w.getUser().getId().equals(user.getId())) {
                                            favorite = true;
                                        }
                                    }
                                }
                    %>
                    <div class="item">
                        <div>
                            <div class="product-element-top">
                                <a href="${pageContext.request.contextPath}/user/product?id=<%=entry.getKey().getId()%>">
                                    <img src="${pageContext.request.contextPath}<%=entry.getValue().get(0)%>" alt="">
                                </a>
                                <div class="btn-buy">
                                    <a style="display: block;text-align: center"  href="${pageContext.request.contextPath}/user/checkout?id=<%=entry.getKey().getId()%>">Mua ngay</a>
                                </div>
                            </div>
                            <div style="text-align: center" class="product-element-bottom">
                                <a href="${pageContext.request.contextPath}/user/product?id=<%=entry.getKey().getId()%>">
                                    <%=entry.getKey().getProductName()%>
                                </a>
                                <div class="price">
                                    <c:set var="unit" value="VND"/>
                                    <fmt:formatNumber value="<%=entry.getKey().getPrice()%>" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}
                                </div>
                            </div>
                        </div>
                        <div class="wd-buttons wd-pos-r-t">
                            <div class="wd-add-btn wd-action-btn wd-style-icon wd-add-cart-icon">
                                <a href="javascript:void(0)" onclick="addCart(this, '<%=entry.getKey().getId()%>', '<%=remain%>')" class="button product_type_simple add-to-cart-loop">
                                                <span>
                                                    <i class="fa-solid fa-cart-shopping"></i>
                                                </span>
                                </a>
                            </div>
                            <div class="quick-view wd-action-btn wd-style-icon wd-quick-view-icon">
                                <a href="" class="open-quick-view quick-view-button">
                                                <span>
                                                    <i class="fa-solid fa-magnifying-glass"></i>
                                            </span>
                                </a>
                            </div>
                            <div class="wd-wishlist-btn wd-action-btn wd-style-icon wd-wishlist-icon">
                                <a class="wd-tltp wd-tooltip-inited" href="javascript:void(0)" id="w<%=entry.getKey().getId()%>"
                                   data-added-text="Browse Wishlist" onclick="toggleWishlist(this, '<%=entry.getKey().getId()%>')">
                                    <span class="wd-tooltip-label">
                                        <% if(favorite) {%>
                                        <i class="fa-solid fa-heart"></i>
                                        <%} else {%>
                                        <i class="fa-regular fa-heart"></i>
                                        <%}%>
                                    </span>
                                </a>
                            </div>

                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </section>

    <section id="section5">
        <div class="wrapper-container">
            <div class="container">
                <div class="owl-carousel owl-theme">
                    <%--                                        <c:forEach var="brand" items="${brands}">--%>
                    <%--                                            <div class="item">--%>
                    <%--                                                <img src="${brand.imageUrl}" alt="">--%>
                    <%--                                            </div>--%>
                    <%--                                        </c:forEach>--%>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-APA.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-ncc-captain-meow.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-Ceva.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/Desento-logo.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-DHN.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/Eagle-Vet.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/Empowering-Innovations.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/Foshan-Standard-Bio-Tech.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-ncc-international-pet-food.jpg"
                             alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-Kela-Group.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-korchin.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/LBS-logo.png" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-ncc-nautilus.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-Ralco-International.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/Royal-Umbrella-Rice.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/Logo-Sahathanee-Thai-Lan.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-ncc-saife-vetmed.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-Shandonsider.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-special-nutrients.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-vet-product-Vietnam.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-Vet-Superior.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-veterina.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/Yebio-Bioengineering-logo.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-JEFO-Nutrition-Inc.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="https://tienthangvet.vn/wp-content/uploads/logo-Choong-Ang-Biotech.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="/WEB-INF/user/include/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
        integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="/assets/user/js/home/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    var context = "${pageContext.request.contextPath}";
    function addCart(btn, id, remain) {
        console.log(remain)
        $.ajax({
            url: "${request.servletContext.contextPath}/user/cart",
            method: "POST",
            data: {
                id: id,
                action: "add",
                type: 0,
                contain: remain
            },
            success: function (response) {
                if (response.status === "failed") {
                    window.location.href = context + "/user/signin";
                } else if(response.status === "stock") {
                    alert(response.error)
                } else {
                    Swal.fire({
                        position: "center",
                        icon: "success",
                        title: "Thêm Sản Phẩm Vào Giỏ Hàng Thành Công!",
                        showConfirmButton: false,
                        timer: 1500
                    });
                    const badge = document.getElementById("badge");
                    badge.innerHTML = response.total;
                }
            }
        });
    }
</script>
<script>
    function toggleWishlist(element, productId) {
        var icon = element.querySelector('i');

        if (icon.classList.contains('fa-solid')) {
            icon.classList.remove('fa-solid');
            icon.classList.add('fa-regular');
            removeFromWishlist(productId);
        } else {
            icon.classList.remove('fa-regular');
            icon.classList.add('fa-solid');
            addToWishlist(productId);
        }
    }
    function addToWishlist(productId) {
        $.ajax({
            url: "${request.servletContext.contextPath}/user/wishlist",
            method: "POST",
            data: {
                productId: productId,
                action: "add"
            },
            success: function (response) {
                if (response.status === "success") {
                    Swal.fire({
                        position: "center",
                        icon: "success",
                        title: "Thêm Vào Wishlist Thành Công!",
                        showConfirmButton: false,
                        timer: 1500
                    });
                } else {
                    window.location.href = context + "/user/signin";
                }
            }
        });
    }

    function removeFromWishlist(productId) {
        $.ajax({
            url: "${request.servletContext.contextPath}/user/wishlist",
            method: "POST",
            data: {
                productId: productId,
                action: "remove"
            },
            success: function (response) {
                if (response.status === "success") {
                    Swal.fire({
                        position: "center",
                        icon: "success",
                        title: "Xoá Khỏi Wishlist Thành Công!",
                        showConfirmButton: false,
                        timer: 1500
                    });
                } else {
                    window.location.href = context + "/user/signin";
                }
            }
        });
    }
</script>
</body>
</html>