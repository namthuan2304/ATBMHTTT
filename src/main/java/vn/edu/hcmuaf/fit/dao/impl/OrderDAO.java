package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IOrderDAO;
import vn.edu.hcmuaf.fit.model.Order;
import vn.edu.hcmuaf.fit.model.OrderItem;

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

    public static void main(String[] args) {
        Map<Order, List<OrderItem>> entry = OrderDAO.getInstance().loadOrderProductByUser(80);
        for (Map.Entry<Order, List<OrderItem>> e : entry.entrySet()) {
            System.out.println(e.getKey());
            System.out.println(e.getValue());
        }
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
}