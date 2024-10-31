<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<%@ page import="vn.edu.hcmuaf.fit.model.WishlistItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/assets/user/css/products/styles.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
          sizes="192x192"/>
    <title>Sản phẩm</title>
    <style>
        span.page-link.ellipsis {
            text-decoration: none;
            border: 1px solid #dee2e6;
            padding: 6px 12px;
        }
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
    </style>
</head>
<body>
<div class="website-wrapper">
    <%@include file="/WEB-INF/user/include/header.jsp" %>
    <div class="body">
        <div class="page-title" style="background-image: url(https://tienthangvet.vn/wp-content/uploads/title-tag-tien-thang-vet-tsd1.jpg);">
            <div class="container">
                <h1 class="title">
<%--                    <c:choose>--%>
<%--                        <c:when test="${not empty requestScope.searchTerm}">--%>
<%--                            Kết quả tìm kiếm cho: ${requestScope.searchTerm}--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            Sản phẩm--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
                    Sản phẩm
                </h1>
            </div>
        </div>
        <div class="container">
            <div class="columns">
                <aside class="sidebar">
                    <div class="widget-area">
                        <div id="categories-1" class="widget">
                            <span class="widget-title">Danh mục sản phẩm</span>
                            <ul class="wd-swatches-filter wd-filter-list wd-labels-on wd-size-normal wd-layout-list wd-text-style-1 wd-bg-style-4 wd-shape-round wd-scroll-content">
                            <c:choose>
                                <c:when test="${not empty requestScope.groups}">
                                    <c:forEach var="group" items="${requestScope.groups}">
                                        <li class="wc-layered-nav-term wd-swatch-wrap">
                                            <a class="layered-nav-link" href="javascript:void(0);" onclick="searchByName(null, '${group.key}', null, null, null)">
                                                <span class="wd-swatch wd-bg"></span>
                                                <span class="wd-filter-lable layer-term-lable">${group.key}</span>
                                            </a>
                                            <span class="count">${group.value}</span>
                                        </li>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                            </ul>
                        </div>
                        <div id="categories-2" class="widget">
                            <span class="widget-title">Nhóm sản phẩm</span>
                            <div class="wd-scroll" style="max-height: 280px;overflow: auto;">
                                <ul class="wd-swatches-filter wd-filter-list wd-labels-on wd-size-normal wd-layout-list wd-text-style-1 wd-bg-style-4 wd-shape-round wd-scroll-content">
                                <c:choose>
                                    <c:when test="${not empty requestScope.objects}">
                                        <c:forEach var="object" items="${requestScope.objects}">
                                            <li class="wc-layered-nav-term">
                                                <a rel="nofollow noopener" href="javascript:void(0);"
                                                   class="layered-nav-link" onclick="searchByName(null, null, '${object.key}', null, null)">
                                                    <span class="wd-filter-lable layer-term-lable">${object.key}</span>
                                                </a>
                                                <span class="count">${object.value}</span>
                                            </li>
                                            <!--href="${request.servletContext.contextPath}/user/products?category=${object.key}"-->
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                                </ul>
                            </div>
                        </div>
                        <div id="categories-3" class="widget">
                            <span class="widget-title">Lọc theo đối tượng</span>
                            <div class="wd-scroll" style="max-height: 280px;overflow: auto;">
                                <ul class="wd-swatches-filter wd-filter-list wd-labels-on wd-size-normal wd-layout-list wd-text-style-1 wd-bg-style-4 wd-shape-round wd-scroll-content">
                                <c:choose>
                                    <c:when test="${not empty requestScope.proTypes}">
                                        <c:forEach var="protype" items="${requestScope.proTypes}">
                                            <li class="wc-layered-nav-term">
                                                <a rel="nofollow noopener" href="javascript:void(0);"
                                                   class="layered-nav-link" onclick="searchByName(null, null, null, '${protype.key}', null)">
                                                    <span class="wd-filter-lable layer-term-lable">${protype.key}</span>
                                                </a>
                                                <span class="count">${protype.value}</span>
                                            </li>
                                            <%--href="${request.servletContext.contextPath}/user/products?type=${protype.key}"--%>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                                </ul>
                            </div>
                        </div>
                    </div>
                </aside>
                <!-- Content -->
                <div id="content" class="content">
                    <!-- Breadcrumbs -->
                    <div class="shop-loop-head">
                        <div class="wd-shop-tools">
                            <div class="wd-breadcrumbs">
                                <nav class="woocommerce-breadcrumb">
                                    <a href="${request.servletContext.contextPath}/user/home" class="breadcrumb-link">Trang chủ</a>
                                    <a href="${request.servletContext.contextPath}/user/products" class="breadcrumb-link">Sản phẩm</a>
                                    <c:choose>
                                        <c:when test="${not empty requestScope.selectedGroup}">
                                            <a href="" class="breadcrumb-link">${requestScope.selectedGroup}</a>
                                        </c:when>
                                        <c:when test="${not empty requestScope.selectedType}">
                                            <a href="" class="breadcrumb-link">${requestScope.selectedType}</a>
                                        </c:when>
                                        <c:when test="${not empty requestScope.selectedCategory}">
                                            <a href="" class="breadcrumb-link"> ${requestScope.selectedCategory}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${not empty requestScope.url}">
                                                    <a href="" class="breadcrumb-link">Kết quả tìm kiếm cho: ${requestScope.url}</a>
                                                </c:when>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!-- Danh sách sản phẩm -->
                    <div class="wrapper-container">
                        <div class="container">
                            <c:choose>
                                <c:when test="${empty requestScope.product or requestScope.product.size() == 0}">
                                    <div class="no-products-found">
                                        <p>Xin lỗi, không tìm thấy sản phẩm nào có tên này.</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <%
                                        Map<Product, List<String>> products = (Map<Product, List<String>>) request.getAttribute("product");
                                        List<WishlistItem> wishlist = (List<WishlistItem>) session.getAttribute("wishlist");
                                        User user = (User) session.getAttribute("auth");
                                        if (products != null && !products.isEmpty()) {
                                            for (Map.Entry<Product, List<String>> entry : products.entrySet()) {
                                                int remain = entry.getKey().getQuantity();
                                                if (user != null && cart != null && !cart.isEmpty()) {
                                                    for (CartItem item : cart) {
                                                        if (item.getProduct().getId()==entry.getKey().getId() && item.getUser().getId()==user.getId()) {
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
                                            <div class="product-element-bottom">
                                                <a href="${pageContext.request.contextPath}/user/product?id=<%=entry.getKey().getId()%>">
                                                    <%=entry.getKey().getProductName()%>
                                                </a>
                                            </div>
                                            <div class="product-element">
                                                <div class="price-wrap">
                                                    <div class="price">
                                                        <c:set var="unit" value="VND"/>
                                                        <fmt:formatNumber value="<%=entry.getKey().getPrice()%>" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wd-buttons wd-pos-r-t">
                                            <div class="wd-add-btn wd-action-btn wd-style-icon wd-add-cart-icon">
                                                <a href="javascript:void(0)" onclick="addCart(this, '<%=entry.getKey().getId()%>', '<%=remain%>')"
                                                   class="button product_type_simple add-to-cart-loop" aria-label="">
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
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <!-- Phân trang -->
                    <div class="pagination">
                        <ul class="pagination-wrapper">
                            <c:if test="${requestScope.currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/user/products?page=${requestScope.currentPage - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${requestScope.currentPage >= 4 && requestScope.totalPages > 15}">
                                <li class="page-item disabled">
                                    <span class="page-link ellipsis" >...</span>
                                </li>
                            </c:if>
                            <!-- Hiển thị các trang -->
                            <c:forEach begin="${requestScope.currentPage - 2 > 0 ? requestScope.currentPage - 2 : 1}" end="${requestScope.currentPage + 2 <= requestScope.totalPages ? requestScope.currentPage + 2 : requestScope.totalPages}" var="page">
                                <li class="page-item ${page == requestScope.currentPage ? 'active' : ''}">
                                    <a class="page-link" href="${pageContext.request.contextPath}/user/products?page=${page}">${page}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${requestScope.currentPage + 2 < requestScope.totalPages && requestScope.totalPages > 15}">
                                <li class="page-item disabled">
                                    <span class="page-link ellipsis">...</span>
                                </li>
                            </c:if>
                            <c:if test="${requestScope.currentPage < requestScope.totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="${pageContext.request.contextPath}/user/products?page=${requestScope.currentPage + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/WEB-INF/user/include/footer.jsp" %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type="text/javascript">
        window.addEventListener("scroll", () => {
            var header = document.querySelector(".container");
            header.classList.toggle("sticky", window.scrollY > 100);
        })
        function searchByName(search, group, object, type, page) {
            var txtSearch = search ? search : null;
            var txtGroup = group!=null && group.length!==0 ? group : null;
            var txtObject = object!=null && object.length!==0 ? object : null;
            var txtType = type!=null && type.length!==0 ? type : null;
            var pagination = page ? page : 1;
            console.log(txtSearch, txtGroup, txtObject, txtType, pagination)
            $.ajax({
                url: "${pageContext.request.contextPath}/user/products",
                type: "POST",
                data: {
                    searchTerm: txtSearch,
                    group: txtGroup,
                    category: txtObject,
                    type: txtType,
                    page: pagination
                },
                success: function (data) {
                    var row = document.getElementById("content");
                    row.innerHTML = data;
                    window.scrollTo(0, 0);
                },
                error: function (xhr) {
                }
            });
        }
    </script>
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