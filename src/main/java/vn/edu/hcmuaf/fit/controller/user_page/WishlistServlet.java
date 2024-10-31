package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.model.Wishlist;
import vn.edu.hcmuaf.fit.model.WishlistItem;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet("/user/wishlist")
public class WishlistServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            out.write("{\"status\": \"failed\"}");
            out.close();
            return;
        }
        List<WishlistItem> wishlist = (List<WishlistItem>) session.getAttribute("wishlist");
        Wishlist inventory = new Wishlist(wishlist);
        String productId = request.getParameter("productId");
        String action = request.getParameter("action");
        switch (action) {
        case "add":
            if (productId != null && !productId.isEmpty()) {
                Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(Integer.parseInt(productId)), ip, "/user/wishlist");
                for (Product product : products.keySet()) {
                    inventory.add(new WishlistItem(user, product));
                }
                session.setAttribute("wishlist", wishlist);
                out.write("{ \"status\": \"success\"}");
            }
            out.flush();
            out.close();
            break;
        case "remove":
            if (productId != null && !productId.isEmpty()) {
                Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(Integer.parseInt(productId)), ip, "/user/wishlist");
                for (Product product : products.keySet()) {
                    inventory.remove(new WishlistItem(user, product));
                }
                session.setAttribute("wishlist", wishlist);
                int size = wishlist.isEmpty() ? 0 : wishlist.size();
                if (size==0) {
                    out.write("{ \"status\": \"success\", \"size\": \""+size+"\"}");
                } else {
                    out.write("{ \"status\": \"success\"}");
                }
            }
            out.flush();
            out.close();
            break;
        case "clear":
            // Clear wishlist
            // ...
            break;
        default:
            out.write("{\"message\": \"Invalid action\"}");
            break;
        }
    }
}