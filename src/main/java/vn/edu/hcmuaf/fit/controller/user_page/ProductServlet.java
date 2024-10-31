package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/user/products"})
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int pageSize = 12;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNumber = request.getParameter("page")!= null?Integer.parseInt(request.getParameter("page")):1;
        int start = (pageNumber - 1) * pageSize;

        String searchTerm = request.getParameter("searchTerm");
        String group = request.getParameter("group");
        String object = request.getParameter("category");
        String productType = request.getParameter("type");

        Map<String, Integer> listProductType = ProductService.getInstance().getListProductType();
        Map<String, Integer> listObject = ProductService.getInstance().getListObject();
        Map<String, Integer> listGroups = ProductService.getInstance().getGroupListObject();

        Map<Product, List<String>> products;
        int totalProducts = 0;
        if (productType != null && !productType.isEmpty()) {
            products = ProductService.getInstance().getProductByType(productType, start, pageSize);
            for (Map.Entry<String, Integer> entry : listProductType.entrySet()) {
                if (entry.getKey().equalsIgnoreCase(productType)) {
                    totalProducts = entry.getValue();
                    break;
                }
            }
            request.setAttribute("selectedType", productType);
        } else if (searchTerm != null && !searchTerm.isEmpty()) {
            products = ProductService.getInstance().searchProductsLimited(searchTerm, start, pageSize);
            totalProducts = ProductService.getInstance().getTotalSearchResults(searchTerm);
            request.setAttribute("searchTerm", searchTerm);
        } else if (object != null && !object.isEmpty()) {
            products = ProductService.getInstance().getProductByCategory(object, start, pageSize);
            for (Map.Entry<String, Integer> entry : listObject.entrySet()) {
                if (entry.getKey().equalsIgnoreCase(object)) {
                    totalProducts = entry.getValue();
                    break;
                }
            }
            request.setAttribute("selectedCategory", object);
        } else if (group != null && !group.isEmpty()) {
            products = ProductService.getInstance().getProductByGroup(group, start, pageSize);
            for (Map.Entry<String, Integer> entry : listGroups.entrySet()) {
                if (entry.getKey().equalsIgnoreCase(group)) {
                    totalProducts = entry.getValue();
                    break;
                }
            }
            request.setAttribute("selectedGroup", group);
        } else {
            products = ProductService.getInstance().getAllProductsLimited(start, pageSize);
            totalProducts = ProductService.getInstance().getTotalProducts();
        }
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

        request.setAttribute("product", products);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", pageNumber);
        request.setAttribute("objects", listObject.entrySet());
        request.setAttribute("proTypes", listProductType.entrySet());
        request.setAttribute("groups", listGroups.entrySet());

        String decodedQueryString = buildQueryString(request, object, group, productType, searchTerm);
        String contextPath = request.getContextPath();
        if (decodedQueryString.startsWith(contextPath)) decodedQueryString = decodedQueryString.substring(contextPath.length());
        String url = decodedQueryString.substring(decodedQueryString.indexOf("=") + 1);
        request.setAttribute("url", url);
        request.getRequestDispatcher("/WEB-INF/user/product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        int pageNumber = request.getParameter("page")!= null?Integer.parseInt(request.getParameter("page")):1;
        int start = (pageNumber - 1) * pageSize;

        String searchTerm = request.getParameter("searchTerm");
        String group = request.getParameter("group");
        String object = request.getParameter("category");
        String productType = request.getParameter("type");

        Map<String, Integer> listProductType = ProductService.getInstance().getListProductType();
        Map<String, Integer> listObject = ProductService.getInstance().getListObject();
        Map<String, Integer> listGroups = ProductService.getInstance().getGroupListObject();

        Map<Product, List<String>> products;
        int totalProducts = 0;
        if (productType != null && !productType.isEmpty()) {
            products = ProductService.getInstance().getProductByType(productType, start, pageSize);
            for (Map.Entry<String, Integer> entry : listProductType.entrySet()) {
                if (entry.getKey().equalsIgnoreCase(productType)) {
                    totalProducts = entry.getValue();
                    break;
                }
            }
        } else if (searchTerm != null && !searchTerm.isEmpty()) {
            products = ProductService.getInstance().searchProductsLimited(searchTerm, start, pageSize);
            totalProducts = ProductService.getInstance().getTotalSearchResults(searchTerm);
        } else if (object != null && !object.isEmpty()) {
            products = ProductService.getInstance().getProductByCategory(object, start, pageSize);
            for (Map.Entry<String, Integer> entry : listObject.entrySet()) {
                if (entry.getKey().equalsIgnoreCase(object)) {
                    totalProducts = entry.getValue();
                    break;
                }
            }
        } else if (group != null && !group.isEmpty()) {
            products = ProductService.getInstance().getProductByGroup(group, start, pageSize);
            for (Map.Entry<String, Integer> entry : listGroups.entrySet()) {
                if (entry.getKey().equalsIgnoreCase(group)) {
                    totalProducts = entry.getValue();
                    break;
                }
            }
        } else {
            products = ProductService.getInstance().getAllProductsLimited(start, pageSize);
            totalProducts = ProductService.getInstance().getTotalProducts();
        }
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        PrintWriter out = response.getWriter();

        String decodedQueryString = buildQueryString(request, object, group, productType, searchTerm);
        String contextPath = request.getContextPath();
        if (decodedQueryString.startsWith(contextPath)) decodedQueryString = decodedQueryString.substring(contextPath.length());
        String url = decodedQueryString.substring(decodedQueryString.indexOf("=") + 1);

        StringBuilder linkBuilder = new StringBuilder();
        linkBuilder.append("onclick=\"searchByName(");
        if (searchTerm != null && !searchTerm.isEmpty()) {
            linkBuilder.append("'").append(searchTerm).append("'");
            System.out.println(searchTerm);
        } else {
            linkBuilder.append("null");
        }
        linkBuilder.append(", ");
        if (group != null && !group.isEmpty()) {
            linkBuilder.append("'").append(group).append("'");
        } else {
            linkBuilder.append("null");
        }
        linkBuilder.append(", ");
        if (object != null && !object.isEmpty()) {
            linkBuilder.append("'").append(object).append("'");
        } else {
            linkBuilder.append("null");
        }
        linkBuilder.append(", ");
        if (productType != null && !productType.isEmpty()) {
            linkBuilder.append("'").append(productType).append("'");
        } else {
            linkBuilder.append("null");
        }
        linkBuilder.append(", ");
        String linkHTML = linkBuilder.toString();
        String data = "";
        data += "       <div class=\"shop-loop-head\">\n" +
                "           <div class=\"wd-shop-tools\">\n" +
                "               <div class=\"wd-breadcrumbs\">\n" +
                "                   <nav class=\"woocommerce-breadcrumb\">\n" +
                "                       <a href=\""+request.getServletContext().getContextPath()+"/user/home\" class=\"breadcrumb-link\">Trang chủ</a>\n" +
                "                           <a href=\""+request.getServletContext().getContextPath()+"/user/products\" class=\"breadcrumb-link\">Sản phẩm</a>\n";
                if(group != null && !group.isEmpty()) {
                    data += "<a href=\"\" class=\"breadcrumb-link\">"+group+"</a>\n";
                } else if(productType != null && !productType.isEmpty()) {
                    data += "<a href=\"\" class=\"breadcrumb-link\">"+productType+"</a>\n";
                } else if(object != null && !object.isEmpty()) {
                    data += "<a href=\"\" class=\"breadcrumb-link\">"+object+"</a>\n";
                } else {
                    if(url != null && !url.isEmpty()) {
                        data += "<a href=\"\" class=\"breadcrumb-link\">Kết quả tìm kiếm cho: "+searchTerm+"</a>\n";
                    }
                }
                data += "           </nav>\n" +
                "               </div>\n" +
                "           </div>\n" +
                "       </div>\n" +
                "       <div class=\"wrapper-container\">\n" +
                "           <div class=\"container\">\n";
                if(products == null || products.isEmpty()) {
                    data += "   <div class=\"no-products-found\">\n" +
                            "       <p>Xin lỗi, không tìm thấy sản phẩm nào có tên này.</p>\n" +
                            "           </div>\n";
                } else {
                    HttpSession session = request.getSession(true);
                    User user = (User) session.getAttribute("auth");
                    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
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
                            data += "<div class=\"item\">\n" +
                                    "       <div>\n" +
                                    "           <div class=\"product-element-top\">\n" +
                                    "               <a href=\"" + request.getServletContext().getContextPath() + "/user/product?id=" + entry.getKey().getId() + "\">\n" +
                                    "                   <img src=\"" + request.getServletContext().getContextPath() + entry.getValue().get(0) + "\" alt=\"\">\n" +
                                    "               </a>\n" +
                                    "               <div class=\"btn-buy\">\n" +
                                    "                   <a style=\"display: block;text-align: center\"  href=\"" + request.getServletContext().getContextPath() + "/user/checkout?id=" + entry.getKey().getId() + "\">Mua ngay</a>" +
                                    "               </div>\n" +
                                    "           </div>\n" +
                                    "           <div class=\"product-element-bottom\">\n" +
                                    "               <a href=\"" + request.getServletContext().getContextPath() + "/user/product?id=" + entry.getKey().getId() + "\">\n" +
                                    entry.getKey().getProductName() +
                                    "               </a>\n" +
                                    "           </div>\n" +
                                    "           <div class=\"product-element\">\n" +
                                    "               <div class=\"price-wrap\">\n" +
                                    "                   <div class=\"price\">\n" +
                                                            Utils.formatCurrency(entry.getKey().getPrice()) + " VND\n" +
                                    "                   </div>\n" +
                                    "               </div>\n" +
                                    "           </div>\n" +
                                    "       </div>\n" +
                                    "       <div class=\"wd-buttons wd-pos-r-t\">\n" +
                                    "           <div class=\"wd-add-btn wd-action-btn wd-style-icon wd-add-cart-icon\">\n" +
                                    "               <a href=\"javascript:void(0)\" onclick=\"addCart(this, '" + entry.getKey().getId() + "', '" + remain + "')\"\n" +
                                    "                   class=\"button product_type_simple add-to-cart-loop\" aria-label=\"\">\n" +
                                    "                       <span>\n" +
                                    "                           <i class=\"fa-solid fa-cart-shopping\"></i>\n" +
                                    "                       </span>\n" +
                                    "               </a>\n" +
                                    "           </div>\n" +
                                    "           <div class=\"quick-view wd-action-btn wd-style-icon wd-quick-view-icon\">\n" +
                                    "               <a href=\"\" class=\"open-quick-view quick-view-button\">\n" +
                                    "                   <span>\n" +
                                    "                       <i class=\"fa-solid fa-magnifying-glass\"></i>\n" +
                                    "                   </span>\n" +
                                    "               </a>\n" +
                                    "           </div>\n" +
                                    "           <div class=\"wd-wishlist-btn wd-action-btn wd-style-icon wd-wishlist-icon\">\n" +
                                    "               <a class=\"wd-tltp wd-tooltip-inited\" href=\"javascript:void(0)\" id=\"w" + entry.getKey().getId() + "\"\n" +
                                    "                       data-added-text=\"Browse Wishlist\" onclick=\"toggleWishlist(this, '" + entry.getKey().getId() + "')\">\n" +
                                    "                   <span class=\"wd-tooltip-label\">\n";
                                                        if (favorite) {
                                                            data += "<i class=\"fa-solid fa-heart\"></i>\n";
                                                        } else {
                                                            data += "<i class=\"fa-regular fa-heart\"></i>\n";
                                                        }
                            data += "                   </span>\n" +
                                    "               </a>\n" +
                                    "           </div>\n" +
                                    "       </div>\n" +
                                    "   </div>";
                        }
                    }
                }
                data += "       </div>\n" +
                        "   </div>\n" +
                        "<div class=\"pagination\">\n" +
                        "   <ul class=\"pagination-wrapper\">\n";
                if (pageNumber > 1) {
                    data += "<li class=\"page-item\">\n" +
                            "   <a class=\"page-link\" href=\"javascript:void(0);\" aria-label=\"Previous\" " + linkHTML + (pageNumber-1) + ")\">\n" +
                            "       <span aria-hidden=\"true\">&laquo;</span>\n" +
                            "   </a>\n" +
                            "</li>\n";
                }
                if (pageNumber >= 4 && totalPages > 15) {
                    data += "<li class=\"page-item disabled\">\n" +
                            "   <span class=\"page-link ellipsis\" >...</span>\n" +
                            "</li>\n";
                }
                int begin = Math.max(pageNumber - 2, 1);
                int end = Math.min(pageNumber + 2, totalPages);
                for (int page = begin; page <= end; page++) {
                    data += "<li class=\"page-item " + (page==pageNumber?"active":"") + "\">\n" +
                            "   <a class=\"page-link\" href=\"javascript:void(0);\" " + linkHTML + page + ")\">" + page + "</a>\n" +
                            "</li>\n";
                }
                if(pageNumber+2<totalPages && totalPages>15) {
                    data += "<li class=\"page-item disabled\">\n" +
                            "   <span class=\"page-link ellipsis\">...</span>\n" +
                            "</li>\n";
                }
                if (pageNumber < totalPages) {
                    data += "<li class=\"page-item\">\n" +
                            "   <a class=\"page-link\" href=\"javascript:void(0);\" " + linkHTML + (pageNumber + 1) + ")\" aria-label=\"Next\">\n" +
                            "       <span aria-hidden=\"true\">&raquo;</span>\n" +
                            "   </a>\n" +
                            "</li>\n";
                }
                data += "   </ul>\n" +
                        "</div>";
        out.print(data);
        out.flush();
        out.close();
    }

    private String buildQueryString(HttpServletRequest request, String object, String group, String type, String search) {
        StringBuilder urlBuilder = new StringBuilder(request.getContextPath());
        if (object != null) urlBuilder.append("&category=").append(object);
        if (group != null) urlBuilder.append("&group=").append(group);
        if (search != null) urlBuilder.append("&searchTerm=").append(search);
        if (type != null) urlBuilder.append("&productType=").append(type);
        return urlBuilder.toString();
    }
}