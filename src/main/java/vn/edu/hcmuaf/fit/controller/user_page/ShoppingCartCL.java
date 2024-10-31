package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.impl.DiscountService;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet("/user/cart")
public class ShoppingCartCL extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user == null) request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
        else {
            String ip = request.getHeader("X-FORWARDED-FOR");
            if (ip == null) ip = request.getRemoteAddr();

            Discount discount = (Discount) session.getAttribute("discount");
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            if (!cart.isEmpty()) {
                double re = 0;
                for(CartItem i : cart) {
                    Map<Product, List<String>> products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(i.getProduct().getId()), ip, "/user/cart");
                    for (Product p: products.keySet()) {
                        re += i.getQuantity() * p.getPrice();
                    }
                }
                if (discount != null) {
                    double result = re - re * discount.getSalePercent();
                    session.setAttribute("result", result);
                    session.setAttribute("retain", (re * discount.getSalePercent()));
                } else {
                    session.setAttribute("result", re);
                }
            }
            request.getRequestDispatcher("/WEB-INF/user/cart.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            out.write("{\"status\": \"failed\"}");
            out.close();
            return;
        }

        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        ShoppingCart shoppingCart = new ShoppingCart(cart);

        Product product = null;
        CartItem cartItem = null;
        Map<Product, List<String>> products;
        int id, quantity;
        double retain, re = 0.0;

        Discount discount = (Discount) session.getAttribute("discount");
        if (discount == null) {
            discount = new Discount();
            discount.setCode("");
            discount.setSalePercent(0.0);
        }

        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();

        String action = request.getParameter("action");
        switch (action) {
        case "check":
            String code = request.getParameter("discountName");
            for(CartItem i : cart) {
                products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(i.getProduct().getId()), ip, "/user/cart");
                for (Product p: products.keySet()) {
                    re += i.getQuantity() * p.getPrice();
                }
            }
            if (code != null && !code.isEmpty()) {
                if (discount.getCode().equalsIgnoreCase(code)) {
                    out.write("{\"state\":\"duplicate\", \"error\":\"Ban da nhap ma nay truoc do!\"}");
                    out.flush();
                    out.close();
                    return;
                } else {
                    discount = DiscountService.getInstance().getCouponByCode(code);
                    if (discount == null) {
                        session.removeAttribute("discount");
                        session.removeAttribute("retain");
                        out.write("{ \"state\": \"notfound\", \"error\": \"Mã giảm giá không tồn tại!\", \"rect\": \""+0.0+"\", \"result\": \""+re+"\" }");
                        out.close();
                        return;
                    } else {
                        if (discount.getQuantity()==0) {
                            session.removeAttribute("discount");
                            session.removeAttribute("retain");
                            out.write("{ \"state\": \"outquantity\", \"error\": \"Mã giảm giá đã hết lượt!\", \"rect\": \""+0.0+"\", \"result\": \""+re+"\" }");
                            out.close();
                            return;
                        }
                    }
                }
            } else {
                out.write("{ \"state\": \"notempty\", \"error\": \"\", \"rect\": \""+ 0.0 +"\", \"result\": \""+re+"\" }");
                session.removeAttribute("discount");
                session.removeAttribute("retain");
                out.close();
                return;
            }
            session.setAttribute("discount", discount);
            retain = re - discount.getSalePercent() * re;
            session.setAttribute("result", retain);
            session.setAttribute("retain", re * discount.getSalePercent());
            out.write("{\"result\": \""+retain+"\", \"rect\": \"" + re * discount.getSalePercent() +"\"}");
            out.flush();
            out.close();
            break;
        case "delete":
            id = Integer.parseInt(request.getParameter("id"));
            products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(id), ip, "/user/cart");
            for (Product p: products.keySet()) {
                product = p;
            }
            shoppingCart.remove(user, product);
            session.setAttribute("cart", cart);

            for(CartItem i : cart) {
                products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(i.getProduct().getId()), ip, "/user/cart");
                for (Product p: products.keySet()) {
                    re += i.getQuantity() * p.getPrice();
                }
            }
            retain = re - discount.getSalePercent() * re;

            if (re==0) {
                out.write("{ \"state\": \"zero\", \"total\": \""+cart.size()+"\", \"items\": \""+cart+"\" , \"result\": \""+retain+"\" }");
            } else {
                out.write("{ \"total\": \""+cart.size()+"\", \"items\": \""+cart+"\" , \"result\": \""+retain+"\", \"rect\": \"" + re * discount.getSalePercent() +"\"}");
            }
            session.setAttribute("total", cart.size());
            session.setAttribute("result", retain);
            session.setAttribute("retain", re * discount.getSalePercent());
            out.flush();
            out.close();
            break;
        case "put":
            id = Integer.parseInt(request.getParameter("id"));
            quantity = Integer.parseInt(request.getParameter("quantity"));
            products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(id), ip, "/user/cart");
            for (Product p: products.keySet()) {
                product = p;
            }
            if (quantity > 0) {
                shoppingCart.update(new CartItem(user, product, quantity));
            } else if (quantity == 0) {
                shoppingCart.remove(user, product);
            }
            session.setAttribute("cart", cart);

            for(CartItem i: cart) {
                products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(i.getProduct().getId()), ip, "/user/cart");
                for (Product p: products.keySet()) {
                    re += i.getQuantity()*p.getPrice();
                }
            }
            retain = re - discount.getSalePercent() * re;
            if (re==0) {
                out.write("{ \"state\": \"zero\", \"total\": \""+cart.size()+"\", \"items\": \""+cart+"\" , \"result\": \""+retain+"\" }");
            } else {
                out.write("{ \"total\": \""+cart.size()+"\", \"items\": \""+cart+"\" , \"result\": \""+retain+"\", \"rect\": \"" + re * discount.getSalePercent() +"\"}");
            }
            session.setAttribute("total", cart.size());
            session.setAttribute("result", retain);
            session.setAttribute("retain", re * discount.getSalePercent());
            out.flush();
            out.close();
            break;
        case "add":
            id = Integer.parseInt(request.getParameter("id"));
            int type = Integer.parseInt(request.getParameter("type"));

            products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(id), ip, "/user/cart");
            for (Product prod : products.keySet()) {
                product = prod;
            }
            if (type == 0) {
                cartItem = new CartItem(user, product, 1);
            } else if (type == 1) {
                String input = request.getParameter("quantity");
                if (input == null || input.isEmpty()) {
                    out.write("{\"status\": \"empty\", \"error\": \"The input do not empty!\"}");
                    out.close();
                    return;
                }
                quantity = Integer.parseInt(input);
                if (quantity==0) {
                    out.write("{\"status\": \"bigger\", \"error\": \"Bạn chỉ được phép thêm số lượng sản phẩm khác 0!\"}");
                    out.close();
                    return;
                }
                cartItem = new CartItem(user, product, quantity);
            }
            int remain = product.getQuantity();
            int count = 0;
            if (shoppingCart.getItems().isEmpty()) {
                remain = product.getQuantity() - cartItem.getQuantity();
            } else {
                for (CartItem item : shoppingCart.getItems()) {
                    if (item.getProduct().getId().equals(product.getId()) && item.getUser().getId().equals(user.getId())) {
                        remain = product.getQuantity() - item.getQuantity() - cartItem.getQuantity();
                        count++;
                        break;
                    }
                }
            }
            if (count == 0) remain = product.getQuantity() - cartItem.getQuantity();
            int contain = Integer.parseInt(request.getParameter("contain"));
            if (remain < 0) {
                if (contain > 0) {
                    out.write("{\"status\": \"out\", \"error\": \"Số lượng thêm không được lớn hơn số lượng còn lại!\"}");
                } else {
                    out.write("{\"status\": \"stock\", \"error\": \"Bạn đã thêm số lượng sản phẩm tối đa vào giỏ!\"}");
                }
                out.close();
                return;
            }
            shoppingCart.add(cartItem);
            session.setAttribute("cart", cart);

            for(CartItem i: cart) {
                products = ProductService.getInstance().getProductByIdWithSupplierInfo(new Product(i.getProduct().getId()), ip, "/user/cart");
                for (Product p: products.keySet()) {
                    re += i.getQuantity()*p.getPrice();
                }
            }
            retain = re - discount.getSalePercent() * re;
            out.write("{ \"total\": \""+cart.size()+"\", \"items\": \""+cart+"\" , \"prefix\": \""+remain+"\", \"rect\": \""+ re * discount.getSalePercent()+ "\"}");
            session.setAttribute("total", cart.size());
            session.setAttribute("result", retain);
            session.setAttribute("retain", re * discount.getSalePercent());
            out.flush();
            out.close();
            break;
        }
    }
}