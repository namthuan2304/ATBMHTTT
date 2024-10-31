package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.CartItem;
import vn.edu.hcmuaf.fit.model.Comment;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.CommentService;
import vn.edu.hcmuaf.fit.service.impl.ProductService;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet("/user/product")
public class ProductDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JSP_PATH = "http://localhost:8080/WEB-INF/user/product_detail.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);

        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            try {
                String ip = request.getHeader("X-FORWARDED-FOR");
                if (ip == null) ip = request.getRemoteAddr();

                Product p = new Product();
                p.setId(Integer.parseInt(id));
                Map<Product, List<String>> product = ProductService.getInstance().getProductByIdWithSupplierInfo(p, ip, "/user/product");
                Product prod = null;
                for (Product p1 : product.keySet()) {
                    prod = p1;
                }
                List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
                User user = (User) session.getAttribute("auth");
                int remain = prod.getQuantity();
                if (cart != null && !cart.isEmpty() && user != null) {
                    for (CartItem item : cart) {
                        if (item.getProduct().getId() == prod.getId() && item.getUser().getId() == user.getId()) {
                            remain = prod.getQuantity() - item.getQuantity();
                            break;
                        }
                    }
                }
                request.setAttribute("product", product);
                if (remain > 0) {
                    request.setAttribute("remain", remain);
                } else {
                    request.setAttribute("error", "Bạn đã thêm số lượng sản phẩm tối đa vào giỏ!");
                }
                Map<Product, List<String>> similar = ProductService.getInstance().getAllProducts();
                request.setAttribute("products", similar);
                request.setAttribute("commentURL",  JSP_PATH + "?id=" + id);
                request.getRequestDispatcher("/WEB-INF/user/product_detail.jsp").forward(request, response);
            } catch (Exception e) {
                out.println(e.getLocalizedMessage());
            }
        } else {
            out.println("Product ID is missing");
        }
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            out.write("{\"status\": \"failed\"}");
            return;
        }
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        String content = request.getParameter("content");
        String productId = request.getParameter("productId");
        if (content == null || content.isEmpty()) {
            out.write("{\"status\": \"empty\", \"message\": \"Khong dc de trong\" }");
        } else {
            Product p = new Product(Integer.parseInt(productId));
            Comment comment = new Comment();
            comment.setContent(content);
            comment.setProduct(p);
            comment.setUser(user);
            Comment success = CommentService.getInstance().addComment(comment, ip, "/user/product");
            if (success != null) {
                session.setAttribute("comment", CommentService.getInstance().getCommentsByProduct(p));
                out.write("{\"status\": \"success\", \"message\": \""+("#" + success.getUser().getId()  + ": " + success.getContent())+"\"}");
            } else {
                out.write("{\"status\": \"empty\", \"message\": \"Insert into database failed!\" }");
            }
        }
        out.flush();
        out.close();
    }
}