<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/common/taglib.jsp"%>
<head>
    <link rel="stylesheet" href="/assets/user/css/header&footer.css">
</head>
<footer class="footer-container">
    <div class="container">
        <div class="main-footer">
            <div class="elementor-column" data-id="e97658c" data-element_type="column">
                <div class="elementor-widget-wrap elementor-element-populated">
                    <div class="elementor-widget-container">
                        <p>
                  <span style="color: #ffffff"><strong>CÔNG TY TNHH THƯƠNG MẠI VÀ DỊCH VỤ PHÁT TRIỂN
                      <br/>THUỐC Y THE PET</strong></span>
                        </p>
                    </div>
                    <div class="elementor-widget-container">
                        <ul class="elementor-icon-list-items">
                            <li class="elementor-icon-list-item">
                                <a href="">
                      <span class="elementor-icon-list-icon">
                        <i aria-hidden="true" class="fas fa-map-marker-alt"></i>
                      </span>
                                    <span class="elementor-icon-list-text">
                                         ${applicationScope.address.address}
                                    </span>
                                </a>
                            </li>
                            <li class="elementor-icon-list-item">
                                <a href="${request.servletContext.contextPath}/user/tel:%200947513315">
                      <span class="elementor-icon-list-icon">
                        <i aria-hidden="true" class="fas fa-phone-volume"></i>
                      </span>
                                    <span class="elementor-icon-list-text"> NVKD SP gia súc - gia cầm: ${applicationScope.address.phone}</span>
                                </a>
                            </li>
                            <li class="elementor-icon-list-item">
                                <a href="${request.servletContext.contextPath}/user/tel:%20028%203948%203929">
                      <span class="elementor-icon-list-icon">
                        <i aria-hidden="true" class="fas fa-headphones-alt"></i>
                      </span>
                                    <span class="elementor-icon-list-text">Hotline: ${applicationScope.address.hotline}</span>
                                </a>
                            </li>
                            <li class="elementor-icon-list-item">
                                <a href="${request.servletContext.contextPath}/user/mailto:tienthangvet@gmail.com">
                      <span class="elementor-icon-list-icon">
                        <i aria-hidden="true" class="far fa-envelope"></i>
                      </span>
                                    <span class="elementor-icon-list-text"> Email: ${applicationScope.address.email}</span>
                                </a>
                            </li>
                            <li class="elementor-icon-list-item">
                                <a href="${request.servletContext.contextPath}/user/mailto:tienthangvet@gmail.com">
                      <span class="elementor-icon-list-icon">
                        <i aria-hidden="true" class="fas fa-map-marker-alt"></i>
                      </span>
                                    <span class="elementor-icon-list-text"> Time Open: ${applicationScope.address.timeOpen}</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="elementor-widget-container">
                        <div class="social-icons">
                            <a href="${applicationScope.social_media.facebook}"><i class="icon fa-brands fa-square-facebook"></i></a>
                            <a href="${applicationScope.social_media.twitter}"><i class="icon fa-brands fa-square-x-twitter"></i></a>
                            <a href="${applicationScope.social_media.instagram}"><i class="icon fa-brands fa-square-instagram"></i></a>
                            <a href="${applicationScope.social_media.youtube}"><i class="icon fa-brands fa-square-youtube"></i></a>
                            <a href="${applicationScope.social_media.pinterest}"><i class="icon fa-brands fa-square-pinterest"></i></a>
                            <a href="${applicationScope.social_media.linkedin}"><i class="icon fa-brands fa-linkedin"></i></a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="elementor-widget-wrap">
                <div class="elementor-element" data-id="4cd4ee9" data-element_type="widget"
                     data-widget_type="text-editor.default">
                    <div class="elementor-widget-container">
                        <p style="font-size: 16px; font-weight: 600;"><span
                                style="color: #ffffff;"><strong>THÔNG
                                            TIN
                                            CHUNG</strong></span></p>
                        <p><a href="${request.servletContext.contextPath}/user/introduce.jsp" rel="nofollow"><span
                                style="color: rgba(236, 236, 236, 0.4);">Giới
                                            thiệu</span></a></p>
                        <p><span style="color: rgba(236, 236, 236, 0.4);"><a
                                style="color: rgba(236, 236, 236, 0.4);"
                                href="${request.servletContext.contextPath}/user/privacyPolicy.jsp" rel="nofollow">Chính sách
                                            bảo mật</a></span></p>
                        <p><span style="color: rgba(236, 236, 236, 0.4);"><a
                                style="color: rgba(236, 236, 236, 0.4);"
                                href="${request.servletContext.contextPath}/user/partnerPolicy.jsp" rel="nofollow">Chính sách
                                            đối tác</a></span></p>
                        <p><span style="color: rgba(236, 236, 236, 0.4);"><a
                                style="color: rgba(236, 236, 236, 0.4);"
                                href="${request.servletContext.contextPath}/user/agencyPolicy.jsp" rel="nofollow">Chính sách
                                            đại lý</a></span></p>
                        <p><span style="color: rgba(236, 236, 236, 0.4);"><a
                                style="color: rgba(236, 236, 236, 0.4);"
                                href="${request.servletContext.contextPath}/user/termsPolicy.jsp"
                                rel="nofollow">Chính sách điều khoản và điều kiện</a></span></p>
                        <p><span style="color: rgba(236, 236, 236, 0.4);"><a
                                style="color: rgba(236, 236, 236, 0.4);"
                                href="${request.servletContext.contextPath}/user/contact.jsp" rel="nofollow">Thông tin liên
                                            hệ</a></span></p>
                    </div>
                </div>
            </div>
            <div class="elementor-map-wrap">
                <div class="elementor-element" data-id="960505b" data-element_type="widget"
                     data-widget_type="html.default">
                    <div class="elementor-widget-container">
                        <iframe
                                src="${applicationScope.address.map}"
                                width="100%" height="250" style="border: 0" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyrights-wrapper">
            <div class="container">
                <div class="min-footer">
                    <small><a href="${request.servletContext.contextPath}/user/home"><strong style="color: #333333">Thuốc Y The Pet</strong></a>
                        <i class="fa fa-copyright"></i> 2023 được tạo bởi
                        <strong>Nhóm 30</strong>.</small>
                </div>
            </div>
        </div>
    </div>
</footer>
