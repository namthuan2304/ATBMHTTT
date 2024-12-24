package vn.edu.hcmuaf.fit.controller.user_page;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.impl.*;

import java.lang.reflect.Field;
import java.time.Duration;
import java.time.LocalTime;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class OrderApprovalScheduler implements ServletContextListener {
    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Tạo ScheduledExecutorService với một luồng
        scheduler = Executors.newScheduledThreadPool(1);

        // Tác vụ duyệt đơn hàng
        Runnable approveOrdersTask = () -> {
            System.out.println("Starting order approval process at: " + LocalTime.now());
            approveOrders();
        };

        // Tính delay và period
        long delay = calculateDelay(11, 44); // 14:30
        long period = TimeUnit.DAYS.toSeconds(1); // Lặp lại mỗi ngày

        // Lên lịch tác vụ
        scheduler.scheduleAtFixedRate(approveOrdersTask, delay, period, TimeUnit.SECONDS);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (scheduler != null) {
            scheduler.shutdownNow(); // Dừng tất cả các tác vụ khi ứng dụng tắt
        }
    }

    private long calculateDelay(int targetHour, int targetMinute) {
        LocalTime now = LocalTime.now();
        LocalTime targetTime = LocalTime.of(targetHour, targetMinute);
        if (now.isAfter(targetTime)) {
            targetTime = targetTime.plusHours(24); // Chuyển sang ngày hôm sau nếu đã qua thời gian mục tiêu
        }
        return Duration.between(now, targetTime).getSeconds();
    }

    private void approveOrders() {
        Map<Order, List<OrderItem>> all = OrderService.getInstance().loadAllOrders();
        for (Map.Entry<Order, List<OrderItem>> entry : all.entrySet()) {
            JsonObject root = new JsonObject();
            List<OrderItem> items = entry.getValue();
            Order order = entry.getKey();
            User user = UserService.getInstance().getUserById(order.getUser());

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
                if(order.getHash() == null || !hashOrder.equals(order.getHash())) {
                    OrderStatus status = new OrderStatus();
                    status.setId(5);
                    order.setStatus(status);
                    boolean success = OrderService.getInstance().updateOrderStatus(order, "127.0.0.1", "admin/approve_order");
                    System.out.println(success);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}