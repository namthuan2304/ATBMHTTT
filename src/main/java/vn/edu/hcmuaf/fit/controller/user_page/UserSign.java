package vn.edu.hcmuaf.fit.controller.user_page;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.dao.impl.OrderDAO;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.Order;
import vn.edu.hcmuaf.fit.model.OrderItem;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.impl.OrderService;
import vn.edu.hcmuaf.fit.service.impl.UserService;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

@WebServlet("/user/sign")
public class UserSign extends HttpServlet {
    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        JsonObject root = new JsonObject();

        if (user == null) request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
        else {
            System.out.println(user.getPublicKey());
            root.addProperty("userId", user.getId());
            root.addProperty("username", user.getUsername());
            root.addProperty("email", user.getEmail());
            Map<Order, List<OrderItem>> entry = OrderDAO.getInstance().loadLatestOrderByUser(user.getId());
            for (Map.Entry<Order, List<OrderItem>> e : entry.entrySet()) {
                if (e.getKey().getStatus().getId() == 8) {
                root.addProperty("date_created", e.getKey().getDateCreated().toString());

                JsonArray array = new JsonArray();
                for (OrderItem oi : e.getValue()) {
                    JsonObject orderItem = new JsonObject();
                    orderItem.addProperty("order_id", oi.getOrder().getId());
                    orderItem.addProperty("product_id", oi.getProduct().getId());
                    orderItem.addProperty("quantity", oi.getQuantity());
                    orderItem.addProperty("order_price", oi.getOrderPrice());
                    array.add(orderItem);
                }
                root.add("order", array);
                }
            }
            System.out.println(root.toString());
            Hash hash = new Hash();
            String hashOrder=null;
            try {
                 hashOrder = hash.hash(root.toString());
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }
            request.setAttribute("hash",hashOrder);
            request.getRequestDispatcher("/WEB-INF/user/user_sign.jsp").forward(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        String sign = request.getParameter("signature");
        Signature signature = new Signature();
        String hashFromClient =null;
        try {
            hashFromClient = signature.decrypt(sign);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        JsonObject root = new JsonObject();

        if (user == null) request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
        else {
            System.out.println(user.getPublicKey());
            root.addProperty("userId", user.getId());
            root.addProperty("username", user.getUsername());
            root.addProperty("email", user.getEmail());
            Map<Order, List<OrderItem>> entry = OrderDAO.getInstance().loadLatestOrderByUser(user.getId());
            Order order = null;
            for (Map.Entry<Order, List<OrderItem>> e : entry.entrySet()) {
                order = e.getKey();

                if (e.getKey().getStatus().getId() == 8) {
                    root.addProperty("date_created", e.getKey().getDateCreated().toString());
                    JsonArray array = new JsonArray();
                    for (OrderItem oi : e.getValue()) {
                        JsonObject orderItem = new JsonObject();
                        orderItem.addProperty("order_id", oi.getOrder().getId());
                        orderItem.addProperty("product_id", oi.getProduct().getId());
                        orderItem.addProperty("quantity", oi.getQuantity());
                        orderItem.addProperty("order_price", oi.getOrderPrice());
                        array.add(orderItem);
                    }
                    root.add("order", array);
                }
            }
            System.out.println(root.toString());
            Hash hash = new Hash();
            String hashOrder = null;
            try {
                hashOrder = hash.hash(root.toString());
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }
            if (hashFromClient.equals(hashOrder)) {
                boolean rs = OrderService.getInstance().saveSignature(order, sign, ip, "user/sign");
            }
            request.getRequestDispatcher("/WEB-INF/user/order_success.jsp").forward(request, response);
        }
    }

    public static void main(String[] args) {
//        UserService.getInstance().loadUsersWithId().getPublicKey();
    }
}