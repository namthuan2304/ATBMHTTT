package vn.edu.hcmuaf.fit.controller.user_page;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.dao.impl.DeliveryDAO;
import vn.edu.hcmuaf.fit.dao.impl.DiscountDAO;
import vn.edu.hcmuaf.fit.dao.impl.OrderDAO;
import vn.edu.hcmuaf.fit.dao.impl.ProductDAO;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.impl.DeliveryService;
import vn.edu.hcmuaf.fit.service.impl.DiscountService;
import vn.edu.hcmuaf.fit.service.impl.OrderService;
import vn.edu.hcmuaf.fit.service.impl.ProductService;

import java.io.IOException;
import java.lang.reflect.Field;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
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
//            System.out.println(user);
            Map<Order, List<OrderItem>> map = OrderService.getInstance().loadLatestOrderByUser(user);
            for (Map.Entry<Order, List<OrderItem>> entry : map.entrySet()) {
                List<OrderItem> items = entry.getValue();
                Order order = entry.getKey();

                // get user info
                Class<?> userClass = user.getClass();
                Field[] userFields = userClass.getDeclaredFields();

                // update and get delivery info
                order.setAddress(DeliveryService.getInstance().getAddressById(order.getAddress().getId()));
                Class<?> deliveryClass = order.getAddress().getClass();
                Field[] deliveryFields = deliveryClass.getDeclaredFields();

                // update and get discount info
                Field[] discountFields = null;
                if(order.getDiscount().getId()!=null) {
                    order.setDiscount(DiscountService.getInstance().getCouponById(order.getDiscount().getId()));
                    Class<?> discountClass = order.getDiscount().getClass();
                    discountFields = discountClass.getDeclaredFields();
                }

                // check if order is not signed
                if (order.getStatus().getId() == 8) {
                    try {
                        root.addProperty("order_id", order.getId());

                        root.addProperty("user_id", user.getId());
                        root.addProperty("username", user.getUsername());
                        root.addProperty("user_email", user.getEmail());

                        for (Field field : deliveryFields) {
                            field.setAccessible(true);
                            String fieldName = field.getName();
                            Object value = field.get(order.getAddress());
                            if (!fieldName.equalsIgnoreCase("id") &&!fieldName.equalsIgnoreCase("user") && value != null) {
                                root.addProperty(fieldName, value.toString());
                            }
                        }
                        if(discountFields != null) {
                            for (Field field : discountFields) {
                                field.setAccessible(true);
                                String fieldName = field.getName();
                                Object value = field.get(order.getDiscount());
                                if (!fieldName.equalsIgnoreCase("id") && !fieldName.equalsIgnoreCase("description") && !fieldName.equalsIgnoreCase("date_created")
                                        && value != null) {
                                    root.addProperty(fieldName, value.toString());
                                }
                            }
                        }
                        root.addProperty("date_created", order.getDateCreated().toString());
                        JsonArray array = new JsonArray();
                        for (OrderItem item : items) {
                            item.setProduct(ProductService.getInstance().getProductById(item.getProduct().getId()));
                            JsonObject orderItem = new JsonObject();
                            orderItem.addProperty("product_id", item.getProduct().getId());
                            orderItem.addProperty("product_name", item.getProduct().getProductName());
                            orderItem.addProperty("quantity", item.getQuantity());
                            orderItem.addProperty("order_price", item.getOrderPrice());
                            array.add(orderItem);
                        }
                        root.add("order", array);
                        Hash hash = new Hash();
                        String hashOrder = null;
                        hashOrder = hash.hash(root.toString());
                        request.setAttribute("hash", hashOrder);
                        System.out.println(root.toString());
                        request.getRequestDispatcher("/WEB-INF/user/user_sign.jsp").forward(request, response);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else request.getRequestDispatcher("/WEB-INF/user/index.jsp").forward(request, response);
            }
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
        JsonObject root = new JsonObject();

        if (user == null) request.getRequestDispatcher("/WEB-INF/user/signIn.jsp").forward(request, response);
        else {
            VerifySign verifySign = new VerifySign();
            PublicKey publicKey;
            try {
                publicKey = verifySign.convertBase64ToPublicKey(user.getPublicKey());
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
//            System.out.println(Base64.getEncoder().encodeToString(publicKey.getEncoded()));
            Map<Order, List<OrderItem>> map = OrderDAO.getInstance().loadLatestOrderByUser(user.getId());
            for (Map.Entry<Order, List<OrderItem>> entry : map.entrySet()) {
                List<OrderItem> items = entry.getValue();
                Order order = entry.getKey();

                // get user info
                Class<?> userClass = user.getClass();
                Field[] userFields = userClass.getDeclaredFields();

                // update and get delivery info
                order.setAddress(DeliveryService.getInstance().getAddressById(order.getAddress().getId()));
                Class<?> deliveryClass = order.getAddress().getClass();
                Field[] deliveryFields = deliveryClass.getDeclaredFields();

                // update and get discount info
                Field[] discountFields = null;
                if (order.getDiscount().getId() != null) {
                    order.setDiscount(DiscountService.getInstance().getCouponById(order.getDiscount().getId()));
                    Class<?> discountClass = order.getDiscount().getClass();
                    discountFields = discountClass.getDeclaredFields();
                }
//          System.out.println(Base64.getEncoder().encodeToString(publicKey.getEncoded()));

                // check if order is not signed
                if (order.getStatus().getId() == 8) {
                    try {
                        root.addProperty("order_id", order.getId());

                        root.addProperty("user_id", user.getId());
                        root.addProperty("username", user.getUsername());
                        root.addProperty("user_email", user.getEmail());

                        for (Field field : deliveryFields) {
                            field.setAccessible(true);
                            String fieldName = field.getName();
                            Object value = field.get(order.getAddress());
                            if (!fieldName.equalsIgnoreCase("id") && !fieldName.equalsIgnoreCase("user") && value != null) {
                                root.addProperty(fieldName, value.toString());
                            }
                        }
                        if (discountFields != null) {
                            for (Field field : discountFields) {
                                field.setAccessible(true);
                                String fieldName = field.getName();
                                Object value = field.get(order.getDiscount());
                                if (!fieldName.equalsIgnoreCase("id") && !fieldName.equalsIgnoreCase("description") && !fieldName.equalsIgnoreCase("date_created")
                                        && value != null) {
                                    root.addProperty(fieldName, value.toString());
                                }
                            }
                        }
                        root.addProperty("date_created", order.getDateCreated().toString());
                        JsonArray array = new JsonArray();
                        for (OrderItem item : items) {
                            item.setProduct(ProductService.getInstance().getProductById(item.getProduct().getId()));
                            JsonObject orderItem = new JsonObject();
                            orderItem.addProperty("product_id", item.getProduct().getId());
                            orderItem.addProperty("product_name", item.getProduct().getProductName());
                            orderItem.addProperty("quantity", item.getQuantity());
                            orderItem.addProperty("order_price", item.getOrderPrice());
                            array.add(orderItem);
                        }
                        root.add("order", array);
                        Hash hash = new Hash();
                        String hashOrder = null;
                        hashOrder = hash.hash(root.toString());
                        request.setAttribute("hash", hashOrder);
                        System.out.println(root.toString());
                        if (verifySign.verify(sign, publicKey, hashOrder)) {
                            boolean rs = OrderService.getInstance().saveSignature(order, sign, ip, "user/sign");
                            if (rs) {
                                OrderStatus orderStatus = new OrderStatus();
                                orderStatus.setId(1);
                                order.setStatus(orderStatus);
                                boolean success = OrderService.getInstance().updateOrderStatus(order, ip, "user/sign");
                                if (success) {
                                    response.getWriter().write("{ \"status\": \"success\"}");
                                } else response.getWriter().write("{ \"status\": \"failed\"}");
                            }
                        } else {
                            System.out.println("failed");
                            response.getWriter().write("{ \"status\": \"error\"}");
                        }

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } else request.getRequestDispatcher("/WEB-INF/user/index.jsp").forward(request, response);
            }
        }
    }
}
