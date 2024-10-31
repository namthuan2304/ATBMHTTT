package vn.edu.hcmuaf.fit.controller.user_page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.model.CartItem;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.model.WishlistItem;
import vn.edu.hcmuaf.fit.service.impl.CartService;
import vn.edu.hcmuaf.fit.service.impl.WishlistService;

import java.io.IOException;
import java.util.List;

@WebServlet("/user/signout")
public class SignOut extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        List<WishlistItem> wishlist = (List<WishlistItem>) session.getAttribute("wishlist");
        User user = (User) session.getAttribute("auth");
        CartService.getInstance().removeCart(user);
        if (!cart.isEmpty()) {
            for (CartItem item : cart) {
                CartService.getInstance().addIntoCart(item.getUser(), item.getProduct(), item.getQuantity());
            }
        }
        WishlistService.getInstance().deleteAllWishlist(user);
        if (!wishlist.isEmpty()) {
            for (WishlistItem item : wishlist) {
                WishlistService.getInstance().addWishList(item.getUser(), item.getProduct());
            }
        }
        session.invalidate();
        getServletContext().removeAttribute("email");
        getServletContext().removeAttribute("action");
        response.sendRedirect("home");
    }
}