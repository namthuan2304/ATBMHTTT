<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.CartItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/taglib.jsp" %>
<head>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="/assets/user/css/header&footer.css">
</head>
<header class="header">
    <div class="container">
        <div class="header-left">
            <a href="${request.servletContext.contextPath}/user/home">
                <img src="https://tienthangvet.vn/wp-content/uploads/logo-tien-thang-vet.jpg" alt=""/>
            </a>
        </div>
        <%
            Integer totalItems = (Integer) session.getAttribute("total");
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (cart != null) {
                if (cart.isEmpty()) totalItems = 0;
            } else {
                session.setAttribute("cart", new ArrayList<>());
                if(totalItems == null) totalItems = 0;
            }
        %>
        <div class="header-center">
            <div class="header-nav" role="navigation" aria-label="Main navigation">
                <ul class="menu">
                    <li class="menu-item">
                        <a href="${request.servletContext.contextPath}/user/home"><span class="nav-link-text" style="white-space: nowrap">Thuốc Y The Pet</span></a>
                    </li>
                    <li class="menu-item">
                        <a href="${request.servletContext.contextPath}/user/introduce"><span class="nav-link-text" style="white-space: nowrap">Giới thiệu</span></a>
                    </li>
                    <li class="menu-item">
                        <a href="${request.servletContext.contextPath}/user/products"><span class="nav-link-text" style="white-space: nowrap">Sản phẩm</span></a>
                        <div class="container">
                            <ul class="sub-menu">
                                <li class="menu-item">
                                    <a href="${request.servletContext.contextPath}/user/products?group=Thức%20ăn%20chăn%20nuôi">Thức ăn chăn nuôi</a>
                                </li>
                                <li class="menu-item">
                                    <a href="${request.servletContext.contextPath}/user/products?group=Chăm%20sóc%20thú%20cưng">Chăm sóc thú cưng</a>
                                </li>
                                <li class="menu-item">
                                    <a href="${request.servletContext.contextPath}/user/products?group=Thuốc%20thú%20y">Thuốc thú y<i class="fa-solid fa-angle-right"></i></a>
                                    <ul class="sub-sub-menu">
                                        <li class="menu-item">
                                            <a href="${request.servletContext.contextPath}/user/products?category=Kháng%20sinh">Thuốc kháng sinh</a>
                                        </li>
                                        <li class="menu-item">
                                            <a href="${request.servletContext.contextPath}/user/products?category=Sát%20trùng">Thuốc sát trùng</a>
                                        </li>
                                        <li class="menu-item">
                                            <a href="${request.servletContext.contextPath}/user/products?category=Vắc%20xin">Vắc xin phòng bệnh</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="menu-item">
                        <a href="${request.servletContext.contextPath}/user/feedback"><span class="nav-link-text" style="white-space: nowrap">Liên hệ</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="header-right">
            <form role="search" class="searchform" data-thumbnail="1" data-price="1" data-post_type="product" data-count="20" data-sku="0" data-symbols_count="3">
                <input type="text" id="searchTerm" name="searchTerm" class="s" placeholder="Tìm kiếm sản phẩm" value="" aria-label="Search"
                       title="Search for products" required="" oninput="searchByName(this.value, null, null, null, null)" />
                <button type="submit" class="searchsubmit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
            <div class="action">
                <div class="cart" style="margin: 0 30px 0 30px;">
                    <span id="badge" class="count"></span>
                    <a href="${request.servletContext.contextPath}/user/cart">
                        <i class="fa-solid fa-cart-shopping material-icons"></i>
                    </a>
                </div>
                <c:choose>
                    <c:when test="${empty sessionScope.auth}">
                        <a class="sign-in" href="${request.servletContext.contextPath}/user/signin">Đăng nhập</a>
                    </c:when>
                    <c:otherwise>
                        <div class="user-dropdown">
                            <i class="fas fa-user fa-2x" style="color: #66b840" id="user-icon"></i>
                            <div class="user-dropdown-content" id="user-dropdown-content">
                                <ul class="user-menu">
                                    <li class="user-menu-item">
                                        <a href="${request.servletContext.contextPath}/user/updateinfouser"><span class="nav-link-text">Quản lý thông tin cá
                                                nhân</span></a>
                                    </li>
                                    <li class="user-menu-item">
                                        <a href="${request.servletContext.contextPath}/user/signout"><span class="nav-link-text">Đăng xuất</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <script>
        const badge = document.getElementById('badge');
        if (badge.innerHTML === '') badge.innerHTML = '<%=totalItems%>';
    </script>
</header>