<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.model.User" %>
<%@ page import="vn.edu.hcmuaf.fit.model.WishlistItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>

    <link rel="stylesheet" href="/assets/user/css/products/detailproduct.css"/>
    <link rel="icon" href="https://tienthangvet.vn/wp-content/uploads/cropped-favicon-Tien-Thang-Vet-192x192.png"
          sizes="192x192"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <!-- Add Slick CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css"/>
    <!-- Add Slick Theme CSS (optional) -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css"/>
    <title>Chi tiết sản phẩm</title>
    <style>
        .input-number {
            text-align: center;
            width: 60px;
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
        .add-to-cart-btn{
            background-color: orange;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 10px;
        }
        /* Tab navigation styles */
        .wd-nav-tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 1rem;
            list-style-type: none;
            padding: 0;
        }

        .wd-nav-tabs li {
            margin: 0 1rem;
        }

        .wd-nav-tabs li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            padding: 0.5rem 1rem;
            border-bottom: 2px solid transparent;
            transition: all 0.3s ease;
        }

        .wd-nav-tabs li.active a {
            border-bottom: 2px solid #000;
            color: #000;
        }

        /* Tab content styles */
        .entry-content {
            display: none;
        }

        .entry-content.wd-active {
            display: block;
        }

        /* Review tab form styles */
        #comments-section {
            margin-top: 1rem;
        }

        #comment-form {
            display: flex;
            flex-direction: column;
        }

        #comment-text {
            resize: none;
            padding: 0.5rem;
            margin-bottom: 0.5rem;
        }

        #comment-form button {
            align-self: flex-start;
            padding: 0.5rem 1rem;
        }

    </style>
</head>
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
<body>
<div class="website-wrapper">
    <%@include file="/WEB-INF/user/include/header.jsp" %>
    <div class="body">
        <div class="wrapper-content">
            <div class="content">
                <div class="single-breadcrumbs-wrapper">
                    <c:choose>
                        <c:when test="${not empty requestScope.product}">
                            <c:forEach var="entry" items="${requestScope.product}" >
                                <c:set var="prod" value="${entry.key}" />
                                <c:set var="supplier" value="${prod.supplier}" />
                                <c:set var="category" value="${prod.cate}" />
                                <c:set var="firstImage" value="${entry.value[0]}" />
                                <c:set var="listImg" value="${entry.value}" />
                            </c:forEach>
                        </c:when>
                    </c:choose>
                    <div class="container">
                        <div class="wd-breadcrumbs">
                            <nav class="woocommerce-breadcrumb">
                                <a href="${request.servletContext.contextPath}/user/home" class="breadcrumb-link">Trang chủ</a>
                                <a href="${request.servletContext.contextPath}/user/products" class="breadcrumb-link">Sản phẩm</a>
                                <span class="breadcrumb-last">
                                      <span class="breadcrumb-last"> ${prod.productName}</span>
                                </span>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="product-images">
                        <div class="product-images-inner">
                            <div class="col-12">
                                <div class="owl-stage">
                                    <div class="item" style="width: 575px; height: 575px">
                                        <div class="product-image-wrap">
                                            <img src="${pageContext.request.contextPath}${firstImage}"
                                                 class="wp-post-image wp-post-image"/>
                                        </div>
                                    </div>
                                    <div class="product-additional-galleries">
                                        <a id="see-more"
                                           href="${pageContext.request.contextPath}${firstImage}"
                                           class="woodmart-show-product-gallery">
                                            <i class="fa-solid fa-compress"></i>
                                            <span class="see-more">Click to enlarge</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="owl-stage-outer" style="margin-top: 10px">
                                    <div class="owl-stage">
                                        <c:forEach var="url" items="${listImg}">
                                            <div class="item" style="width: 145.25px">
                                                <div class="product-image-thumbnail">
                                                    <img width="150" height="150" src="${pageContext.request.contextPath}${url}"/>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="detail-product">
                        <div class="summary-inner set-mb-l reset-last-child">
                            <div class="wd-product-brands">
                                <a href="">
                                    <img src="${supplier.imageUrl}" alt="Supplier Image"/>
                                </a>
                            </div>
                            <h1 class="product_title entry-title wd-entities-title">
                                ${prod.productName}
                            </h1>
                            <div class="price-wrapper">
                                <div class="price">
                                    <c:set var="unit" value="VND"/>
                                    <fmt:formatNumber value="${prod.price}" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}
                                </div>
                            </div>
                            <div class="wd-compare-btn product-compare-button wd-action-btn wd-style-text wd-compare-icon">
                                <a href="">
                                    <i class="fa-solid fa-shuffle"></i>
                                    <span>So sánh</span>
                                </a>
                            </div>
                            <div class="wd-wishlist-btn wd-action-btn wd-style-text wd-wishlist-icon">
                                <a class="" href="">
                                    <i class="fa-regular fa-heart"></i>
                                    <span>Yêu thích</span>
                                </a>
                            </div>
                            <div class="product_meta">
                                <span class="posted_in"><span class="meta-label">Danh mục:</span>
                                <a href="${request.servletContext.contextPath}/user/products?category=${category.categoryName}" rel="tag">${category.categoryName}</a></span>
                            </div>
                            <div class="container">
                                <c:choose>
                                    <c:when test="${not empty requestScope.remain}">
                                        <div style="display: flex;align-items: center;">
                                            <div>
                                                <button id="decrease" class="btn-decrease">-</button>
                                                <input type="number" id="quantity" class="input-number" value="1" min="1" max="${requestScope.remain}">
                                                <button id="increase" class="btn-increase">+</button>
                                                <span style="color: red; margin: 10px" class="error"></span>
                                            </div>
                                            <div style="display: inline-block">
                                                <a class="add-to-cart-btn" style="display: flex;align-items: center" id="checkoutLink" href="${pageContext.request.contextPath}/user/checkout?id=${prod.id}&quantity=" >
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                         viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2"
                                                         stroke-linecap="round" stroke-linejoin="round">
                                                        <circle cx="9" cy="21" r="1"></circle>
                                                        <circle cx="20" cy="21" r="1"></circle>
                                                        <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6">
                                                        </path>
                                                    </svg>
                                                    <span class="">Mua ngay</span>
                                                </a>
                                            </div>
                                        </div>
                                         <div>
                                             <a id="add_cart" style="color: #000;display: inline-block" href="javascript:void(0)" onclick="addCart(this, '${prod.id}')">
                                                 <button class="add-to-cart-btn">
                                                     <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                          viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2"
                                                          stroke-linecap="round" stroke-linejoin="round">
                                                         <circle cx="9" cy="21" r="1"></circle>
                                                         <circle cx="20" cy="21" r="1"></circle>
                                                         <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6">
                                                         </path>
                                                     </svg>

                                                     <span class="">Thêm vào giỏ hàng</span>

                                                 </button>
                                             </a>
                                         </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div>
                                            <button id="decrease1" class="btn-decrease">-</button>
                                            <input type="number" id="quantity1" class="input-number" value="1" min="1" max="${prod.quantity}">
                                            <button id="increase1" class="btn-increase">+</button>
                                            <span style="color: red; margin: 10px" class="error"></span>
                                        </div>
                                        <span style="color: red; margin: 10px" class="error">${requestScope.error}</span>
                                        <div style="display: inline-block">
                                            <a class="add-to-cart-btn" style="display: flex;align-items: center" id="checkoutLink1" href="${pageContext.request.contextPath}/user/checkout?id=${prod.id}&quantity=" >
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="#ffffff" stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round">
                                                    <circle cx="9" cy="21" r="1"></circle>
                                                    <circle cx="20" cy="21" r="1"></circle>
                                                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6">
                                                    </path>
                                                </svg>
                                                <span class="">Mua ngay</span>
                                            </a>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="wrapper-content">
            <div class="product-tabs-wrapper">
                <div class="container">
                    <div class="product-tabs-inner">
                        <div class="woocommerce-tabs wc-tabs-wrapper tabs-layout-tabs" data-state="first" data-layout="tabs">
                            <div class="wd-nav-wrapper wd-nav-tabs-wrapper text-center">
                                <ul class="wd-nav wd-nav-tabs wd-icon-pos-left tabs wc-tabs wd-style-underline-reverse" role="tablist">
                                    <li class="description_tab active" id="tab-title-description" role="tab" aria-controls="tab-description">
                                        <a class="wd-nav-link" href="#tab-description">
                                            <span class="nav-link-text wd-tabs-title">Mô tả</span>
                                        </a>
                                    </li>
                                    <li class="reviews_tab" id="tab-title-reviews" role="tab" aria-controls="tab-reviews">
                                        <a class="wd-nav-link" href="#tab-reviews">
                                            <span class="nav-link-text wd-tabs-title">Bình luận</span>
                                        </a>
                                    </li>
                                    <li class="reviews_tab" id="tab-title-evaluate" role="tab" aria-controls="tab-evaluate">
                                        <a class="wd-nav-link" href="#tab-evaluate">
                                            <span class="nav-link-text wd-tabs-title">Đánh giá</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="wd-accordion-item">
                                <div class="entry-content woocommerce-Tabs-panel woocommerce-Tabs-panel--description wd-active panel wc-tab"
                                     id="tab-description" role="tabpanel" aria-labelledby="tab-title-description"
                                     data-accordion-index="description" style="display: block">
                                    <div class="wc-tab-inner">
                                        <div data-elementor-type="product-post" data-elementor-id="37778"
                                             class="elementor elementor-37778">
                                            <section
                                                    class="wd-negative-gap elementor-section elementor-top-section elementor-element elementor-element-493d2218 elementor-section-boxed elementor-section-height-default elementor-section-height-default wd-section-disabled"
                                                    data-id="493d2218" data-element_type="section">
                                                <div class="elementor-container elementor-column-gap-default">
                                                    <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-56ddef75"
                                                         data-id="56ddef75" data-element_type="column">
                                                        <div class="elementor-widget-wrap elementor-element-populated">
                                                            <div class="elementor-element elementor-element-1400a071 color-scheme-inherit text-left elementor-widget elementor-widget-text-editor"
                                                                 data-id="1400a071" data-element_type="widget"
                                                                 data-widget_type="text-editor.default">
                                                                <div class="elementor-widget-container">
                                                                    <h1>Công dụng:</h1>
                                                                    <p>${prod.purpose}</p>
                                                                    <h1>Thành phần:</h1>
                                                                    <p>${prod.ingredients}</p>
                                                                    <h2>Liều lượng: ${prod.dosage} </h2>
                                                                    <h2>Hướng dẫn sử dụng:</h2>
                                                                    <p>${prod.instructions}</p>
                                                                    <h2>Đối tượng: ${prod.type.typeName} </h2>
                                                                    <h2>CHỐNG CHỈ ĐỊNH:</h2>
                                                                    <p>${prod.contraindications}<br/></p>
                                                                    <h2>BẢO QUẢN<br/> ${prod.storageCondition}<br/></h2>
                                                                    <h2>Hạn sử dụng: ${prod.warrantyPeriod}</h2>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry-content woocommerce-Tabs-panel woocommerce-Tabs-panel--reviews panel wc-tab"
                                     id="tab-reviews" role="tabpanel" aria-labelledby="tab-title-reviews"
                                     data-accordion-index="reviews" style="display: none">
                                    <div class="wc-tab-inner">
                                        <div data-elementor-type="product-post" data-elementor-id="37779"
                                             class="elementor elementor-37779">
                                            <section
                                                    class="wd-negative-gap elementor-section elementor-top-section elementor-element elementor-element-493d2219 elementor-section-boxed elementor-section-height-default elementor-section-height-default wd-section-disabled"
                                                    data-id="493d2219" data-element_type="section">
                                                <div class="elementor-container elementor-column-gap-default">
                                                    <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-56ddef76"
                                                         data-id="56ddef76" data-element_type="column">
                                                        <div class="elementor-widget-wrap elementor-element-populated">
                                                            <div class="elementor-element elementor-element-1400a072 color-scheme-inherit text-left elementor-widget elementor-widget-text-editor"
                                                                 data-id="1400a072" data-element_type="widget"
                                                                 data-widget_type="text-editor.default">
                                                                <div class="elementor-widget-container">
                                                                    <h2>Bình luận sản phẩm</h2>
                                                                    <div class="fb-comments"
                                                                         data-href="https://tienthangvet.vn/?id=<%=request.getParameter("id")%>"
                                                                         data-width="1100" data-numposts="5">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </div>
                                    </div>
                                </div>
                                <div class="entry-content woocommerce-Tabs-panel woocommerce-Tabs-panel--reviews panel wc-tab"
                                     id="tab-evaluate" role="tabpanel" aria-labelledby="tab-title-evaluate"
                                     data-accordion-index="reviews" style="display: none">
                                    <div class="wc-tab-inner">
                                        <div data-elementor-type="product-post" data-elementor-id="37779"
                                             class="elementor elementor-37779">
                                            <section
                                                    class="wd-negative-gap elementor-section elementor-top-section elementor-element elementor-element-493d2219 elementor-section-boxed elementor-section-height-default elementor-section-height-default wd-section-disabled"
                                                    data-id="493d2219" data-element_type="section">
                                                <div class="elementor-container elementor-column-gap-default">
                                                    <div class="elementor-column elementor-col-100 elementor-top-column elementor-element elementor-element-56ddef76"
                                                         data-id="56ddef76" data-element_type="column">
                                                        <div class="elementor-widget-wrap elementor-element-populated">
                                                            <div class="elementor-element elementor-element-1400a072 color-scheme-inherit text-left elementor-widget elementor-widget-text-editor"
                                                                 data-id="1400a072" data-element_type="widget"
                                                                 data-widget_type="text-editor.default">
                                                                <div class="elementor-widget-container">
                                                                    <h2>Đánh giá sản phẩm</h2>
                                                                    <c:choose>
                                                                        <c:when test="${not empty sessionScope.comment}">
                                                                            <c:forEach var="cmt" items="${sessionScope.comment}">
                                                                                <br><span id="content">#${cmt.user.id}: ${cmt.content}</span><br>
                                                                            </c:forEach>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <p id="empty">Chưa có đánh giá nào.</p>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <span id="content"></span>
                                                                    <div id="comments-section">
<%--                                                                        <p id="empty"></p>--%>
                                                                        <form id="comment-form">
                                                                            <textarea id="comment-text" rows="4" placeholder="Viết đánh giá..."></textarea>
                                                                            <button id="comment" type="submit">Gửi</button>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="wrapper-content">
            <div class="container related-and-upsells">

                <div class="related-products">
                    <h3 class="title slider-title">Sản phẩm tương tự</h3>
                    <div class="products">
                        <div class="wrapper-container">
                            <div class="container slider">
                                <%
                                    Map<Product, List<String>> products = (Map<Product, List<String>>) request.getAttribute("products");
                                    User user = (User) session.getAttribute("auth");
                                    List<WishlistItem> wishlist = (List<WishlistItem>) session.getAttribute("wishlist");
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
                                                    <fmt:formatNumber value="<%=entry.getKey().getPrice()%>" type="number" maxFractionDigits="0" pattern="#,##0"/> ${unit}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="wd-buttons wd-pos-r-t">
                                        <div class="wd-add-btn wd-action-btn wd-style-icon wd-add-cart-icon">
                                            <a href="javascript:void(0)" onclick="addCartRemain(this, '<%=entry.getKey().getId()%>', '<%=remain%>')"
                                               class="button product_type_simple add-to-cart-loop">
                                                    <span>
                                                        <i class="fa-solid fa-cart-shopping"></i> </span></a>
                                        </div>
                                        <div class="quick-view wd-action-btn wd-style-icon wd-quick-view-icon">
                                            <a href="" class="open-quick-view quick-view-button">
                                                    <span>
                                                        <i class="fa-solid fa-magnifying-glass"></i> </span></a>
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
                </div>

            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/user/include/footer.jsp" %>
</div>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
        src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v18.0&appId=1072330460766904"
        nonce="tczl9AmJ"></script>
<script src="/assets/user/js/detailProduct/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    var context = "${pageContext.request.contextPath}";
    let quantityInput = document.getElementById("quantity");
    let btnAddCart = document.getElementById("add_cart");
    let increase = document.getElementById("increase");
    let decrease = document.getElementById("decrease");
    function addCart(btn, id) {
        var quantity = $('#quantity').val();
        const input = document.getElementById('quantity');
        const max = parseInt(input.max, 10);
        $.ajax({
            url: "${request.servletContext.contextPath}/user/cart",
            method: "POST",
            data: {
                id: id,
                action: "add",
                type: 1,
                quantity: quantity,
                contain: max
            },
            success: function (response) {
                if (response.status === "failed") {
                    window.location.href = context + "/user/signin";
                } else if (response.status === "empty" || response.status === "out" || response.status === "bigger") {
                    $('.error').html(response.error);
                } else if (response.status === "stock") {
                    $('.error').html(response.error);
                    // quantityInput.style.display = "none";
                    btnAddCart.style.display = "none";
                    // increase.style.display = "none";
                    // decrease.style.display = "none";
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
                    $('#quantity').attr('max', response.prefix);
                    $('.error').html("");
                }
            }
        });
    }
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const input = document.getElementById('quantity');
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
        document.querySelector('#increase').addEventListener('click', function() {
            const max = parseInt(input.max, 10);
            let value = parseInt(input.value, 10);
            if (value < max) {
                input.value = value + 1;
            }
        });
        document.querySelector('#decrease').addEventListener('click', function() {
            const min = parseInt(input.min, 10);
            let value = parseInt(input.value, 10);
            if (value > min) {
                input.value = value - 1;
            }
        });
    });
    document.addEventListener('DOMContentLoaded', function() {
        const input = document.getElementById('quantity1');
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
        document.querySelector('#increase1').addEventListener('click', function() {
            const max = parseInt(input.max, 10);
            let value = parseInt(input.value, 10);
            if (value < max) {
                input.value = value + 1;
            }
        });
        document.querySelector('#decrease1').addEventListener('click', function() {
            const min = parseInt(input.min, 10);
            let value = parseInt(input.value, 10);
            if (value > min) {
                input.value = value - 1;
            }
        });
    });
    document.addEventListener('DOMContentLoaded', function() {
        var quantityInput = document.getElementById('quantity');
        var checkoutLink = document.getElementById('checkoutLink');

        // Hàm để cập nhật href dựa trên giá trị quantity
        function updateLink(quantity) {
            var baseHref = checkoutLink.href.split('&quantity=')[0];  // Lấy phần cơ bản của URL, không bao gồm số lượng cũ
            checkoutLink.href = baseHref + '&quantity=' + quantity;  // Cập nhật href của thẻ <a> với số lượng mới
        }

        // Sự kiện khi giá trị trong input thay đổi
        quantityInput.addEventListener('change', function() {
            var quantity = quantityInput.value;  // Lấy giá trị mới từ input
            updateLink(quantity);  // Cập nhật link
        });

        // Kiểm tra và cập nhật link khi trang tải xong
        var initialQuantity = quantityInput.value || '1';  // Nếu không có giá trị, sử dụng '1'
        updateLink(initialQuantity);  // Cập nhật link với giá trị ban đầu
    });
    document.addEventListener('DOMContentLoaded', function() {
        var quantityInput = document.getElementById('quantity1');
        var checkoutLink1 = document.getElementById('checkoutLink1');

        // Hàm để cập nhật href dựa trên giá trị quantity
        function updateLink(quantity) {
            var baseHref = checkoutLink1.href.split('&quantity=')[0];  // Lấy phần cơ bản của URL, không bao gồm số lượng cũ
            checkoutLink1.href = baseHref + '&quantity=' + quantity;  // Cập nhật href của thẻ <a> với số lượng mới
        }

        // Sự kiện khi giá trị trong input thay đổi
        quantityInput.addEventListener('change', function() {
            var quantity = quantityInput.value;  // Lấy giá trị mới từ input
            updateLink(quantity);  // Cập nhật link
        });

        // Kiểm tra và cập nhật link khi trang tải xong
        var initialQuantity = quantityInput.value || '1';  // Nếu không có giá trị, sử dụng '1'
        updateLink(initialQuantity);  // Cập nhật link với giá trị ban đầu
    });
</script>
<script>
    function addCartRemain(btn, id, remain) {
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
    document.addEventListener('DOMContentLoaded', function() {
        const tabs = document.querySelectorAll('.wd-nav-tabs li');
        const tabContents = document.querySelectorAll('.entry-content');

        tabs.forEach(tab => {
            tab.addEventListener('click', function(e) {
                e.preventDefault();
                const target = this.querySelector('a').getAttribute('href').substring(1);

                // Remove active class from all tabs
                tabs.forEach(item => item.classList.remove('active'));

                // Hide all tab contents
                tabContents.forEach(content => content.style.display = 'none');

                // Add active class to the clicked tab
                this.classList.add('active');

                // Show the corresponding tab content
                document.getElementById(target).style.display = 'block';
            });
        });

        // Show the first tab by default
        document.querySelector('.wd-nav-tabs li.active a').click();
    });
</script>
<script type="text/javascript">
    $(document).ready(function(){
        $('.slider').slick({
            infinite: true,
            slidesToShow: 4,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 1000,
            arrows: true,
            responsive: [
                {
                    breakpoint: 1024,
                    settings: {
                        slidesToShow: 2
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 1
                    }
                }
            ]
        });
    });
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
<script type="text/javascript">
    var context = "${pageContext.request.contextPath}";
    $(document).ready(function() {
        $('#comment').click(function (event) {
            event.preventDefault();
            var content = $('#comment-text').val();

            $.ajax({
                type: 'POST',
                data: {
                    content: content,
                    productId: '${prod.id}'
                },
                url: "${request.servletContext.contextPath}/user/product",
                success: function (result) {
                   if (result.status === "failed") {
                       window.location.href = context + "/user/signin";
                   } else if(result.status === "empty") {
                       alert(result.message);
                   } else {
                      document.getElementById('content').innerHTML += "<br>" + result.message + "<br>";
                      $('#empty').html("");
                   }
                },
            });
        });
    });
</script>
<!-- Add jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Add Slick JS -->
<script src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>
</body>
</html>