package vn.edu.hcmuaf.fit.dao.impl;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import vn.edu.hcmuaf.fit.controller.user_page.Hash;
import vn.edu.hcmuaf.fit.dao.IOrderDAO;
import vn.edu.hcmuaf.fit.model.*;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

public class OrderDAO extends AbsDAO<Order> implements IOrderDAO {
    private static IOrderDAO instance;

    public static IOrderDAO getInstance() {
        if (instance == null) {
            instance = new OrderDAO();
        }
        return instance;
    }

    @Override
    public Map<Order, List<OrderItem>> loadAllOrders() {
        String sql = "SELECT o.*, i.* FROM (" +
                " SELECT * FROM orders" +
                ") AS o LEFT JOIN order_items i ON o.id = i.order_id";
        return queryForMap(sql, new OrderItemMapper(), true);
    }

    @Override
    public Order getOrderStatus(Order od) {
        String sql = "SELECT * FROM orders where id=?";
        return query(sql, Order.class, od.getId()).get(0);
    }

    @Override
    public Map<Order, List<OrderItem>> loadOrdersByStatus(Integer status) {
        String sql = "SELECT o.*, i.* FROM (" +
                " SELECT * FROM orders WHERE status_id = ?" +
                ") AS o LEFT JOIN order_items i ON o.id = i.order_id";
        return queryForMap(sql, new OrderItemMapper(), true, status);
    }

    @Override
    public Integer getOrderPriceNotVoucher(Integer orderId) {
        String sql = "SELECT SUM(quantity * order_price) FROM order_items WHERE order_id = ?";
        return count(sql, orderId);
    }

    @Override
    public Integer countSaleProducts(Integer productId) {
        String sql = "SELECT SUM(quantity) FROM order_items WHERE product_id = ?";
        return count(sql, productId);
    }

    @Override
    public Integer getOrderPriceHasVoucher(Integer orderId) {
        String sql = "SELECT (SUM(i.quantity * i.order_price) - (d.sale_percent * SUM(i.quantity * i.order_price))) " +
                "FROM orders o LEFT JOIN order_items i ON o.id = i.order_id " +
                "LEFT JOIN discounts d ON o.discount_id = d.id WHERE o.id = ? GROUP BY o.id, d.sale_percent";
        return count(sql, orderId);
    }

    @Override
    public Integer getProfitOfProduct(Integer productId) {
        String sql = "SELECT (SUM(i.quantity * i.order_price) - (SUM(i.quantity * i.order_price) - (d.sale_percentSELECT (SUM(i.quantity * i.order_price) - (d.sale_percent * SUM(i.quantity * i.order_price))) \" +\n" +
                "                \"FROM orders o LEFT JOIN order_items i ON o.id = i.order_id \" +\n" +
                "                \"LEFT JOIN discounts d ON o.discount_id = d.id WHERE o.id = ? GROUP BY o.id, d.sale_percent * SUM(i.quantity * i.order_price)))) " +
                "FROM orders o LEFT JOIN order_items i ON o.id = i.order_id " +
                "LEFT JOIN discounts d ON o.discount_id = d.id " +
                "WHERE o.id = ? GROUP BY o.id, d.sale_percent";
        return count(sql, productId);
    }

    @Override
    public Map<Order, List<OrderItem>> loadOrderProductByOrder(Integer orderId) {
        String sql = "SELECT o.*, i.* FROM (" +
                " SELECT * FROM orders WHERE id = ?" +
                ") AS o LEFT JOIN order_items i ON o.id = i.order_id";
        return queryForMap(sql, new OrderItemMapper(), true, orderId);
    }

    @Override
    public Map<Order, List<OrderItem>> loadOrderProductByUser(Integer userId) {
        String sql = "SELECT o.*, i.* FROM (" +
                " SELECT * FROM orders WHERE user_id = ?" +
                ") AS o LEFT JOIN order_items i ON o.id = i.order_id";
        return queryForMap(sql, new OrderItemMapper(), true, userId);
    }

    public static void main(String[] args) throws NoSuchAlgorithmException {
        List<User> listUser = UserDAO.getInstance().loadUsersWithId(82);
        User user = listUser.get(0);
        JsonObject root = new JsonObject();
        root.addProperty("userId",user.getId());
        root.addProperty("username",user.getUsername());
        root.addProperty("email",user.getEmail());
        Map<Order, List<OrderItem>> entry = OrderDAO.getInstance().loadLatestOrderByUser(user.getId());
        for (Map.Entry<Order, List<OrderItem>> e : entry.entrySet()) {
            root.addProperty("date_created",e.getKey().getDateCreated().toString());
            Order order = e.getKey();
            System.out.println(e.getKey().getStatus().getId());
            JsonArray array = new JsonArray();
            for (OrderItem oi : e.getValue()) {
                JsonObject orderItem = new JsonObject();
                orderItem.addProperty("order_id",oi.getOrder().getId());
                orderItem.addProperty("product_id",oi.getProduct().getId());
                orderItem.addProperty("quantity",oi.getQuantity());
                orderItem.addProperty("order_price",oi.getOrderPrice());
                array.add(orderItem);
            }
            root.add("order", array);
        }
        System.out.println(root.toString());
        String json = root.toString();
        Hash hash = new Hash();
        String hashJson = hash.hash(json);
        System.out.println(hashJson);
    }

    @Override
    public Order insertOrders(Integer userId, Integer addressId, Integer shipType, Integer discountId, Integer paymentId, String note, Integer statusId) {
        String sql;
        if (discountId == null) {
            sql = "INSERT INTO `orders` (`user_id`, `address_id`, `ship_type`, `payment_id`, `note`, `status_id`) VALUES (?, ?, ?, ?, ?, ?)";
            return insert(sql, Order.class, userId, addressId, shipType, paymentId, note, statusId);
        } else {
            sql = "INSERT INTO `orders` (`user_id`, `address_id`, `ship_type`, `discount_id`, `payment_id`, `note`, `status_id`) VALUES (?, ?, ?, ?, ?, ?, ?)";
            return insert(sql, Order.class, userId, addressId, shipType, discountId, paymentId, note, statusId);
        }
    }

    @Override
    public Map<Order, List<OrderItem>> loadOrderNear(Integer limit) {
        String sql = "SELECT o.*, i.* FROM (" +
                " SELECT * FROM orders ORDER BY date_created DESC LIMIT ? " +
                ") AS o LEFT JOIN order_items i ON o.id = i.order_id";
        return queryForMap(sql, new OrderItemMapper(), true, limit);
    }

    @Override
    public boolean updateOrderStatus(Integer orderId, Integer statusId) {
        String sql = "UPDATE orders SET status_id = ? WHERE id = ?";
        return update(sql, statusId, orderId);
    }

    @Override
    public boolean deleteOrder(Integer orderId) {
        String sql = "DELETE FROM orders WHERE id = ?";
        return update(sql, orderId);
    }

    @Override
    public boolean updateTimePayment(Integer orderId, String date) {
        String sql = "UPDATE orders SET date_payment = ? WHERE id = ?";
        return update(sql, date, orderId);
    }

    @Override
    public boolean updateOrdStatusByAdmin(Integer orderId, Integer adminId, Integer statusId) {
        String sql = "UPDATE orders SET status_id =?, admin_id =? WHERE id = ?";
        return update(sql, statusId, adminId, orderId);
    }

    @Override
    public boolean updatePayment(Integer orderId, Integer payment) {
        String sql = "UPDATE orders SET payment_id = ? WHERE id = ?";
        return update(sql, payment, orderId);
    }

    @Override
    public boolean updateDelivery(Integer orderId, Integer delivery) {
        String sql = "UPDATE orders SET address_id = ? WHERE id = ?";
        return update(sql, delivery, orderId);
    }

    @Override
    public List<Order> hasDatePayment(Integer orderId) {
        String sql = "SELECT * FROM orders WHERE id = ? AND date_payment IS NOT NULL";
        return query(sql, Order.class, orderId);
    }

    @Override
    public Map<Order, List<OrderItem>> loadLatestOrderByUser(Integer userId) {
        String sql = "SELECT o.*, i.* FROM (" +
                " SELECT * FROM orders WHERE user_id = ? ORDER BY date_created DESC LIMIT 1" +
                ") AS o LEFT JOIN order_items i ON o.id = i.order_id";
        return queryForMap(sql, new OrderItemMapper(), true, userId);
    }

    @Override
    public boolean saveSignature(int order_id, String signature) {
        // SQL query to update the public_key and keyCreatedDate for the user in the 'users' table
        String sql = "UPDATE orders SET signature = ? WHERE id = ?";
        // Execute the update and return the result
        return update(sql, signature, order_id);
    }

}