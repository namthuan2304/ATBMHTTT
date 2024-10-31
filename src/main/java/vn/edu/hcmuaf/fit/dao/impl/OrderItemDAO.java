package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IOrderItemDAO;
import vn.edu.hcmuaf.fit.model.OrderItem;

import java.util.List;

public class OrderItemDAO extends AbsDAO<OrderItem> implements IOrderItemDAO {
    private static IOrderItemDAO instance;

    public static IOrderItemDAO getInstance() {
        if (instance == null) {
            instance = new OrderItemDAO();
        }
        return instance;
    }

    @Override
    public List<OrderItem> getOrderItems(Integer orderId) {
        String sql = "SELECT * FROM order_items WHERE order_id =?";
        return query(sql, OrderItem.class, orderId);
    }

    @Override
    public boolean addOrderItem(Integer orderId, Integer prodId, Integer quantity, Integer orderPrice) {
        String sql = "INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `order_price`) VALUES (?,?,?,?)";
        return update(sql, orderId, prodId, quantity, orderPrice);
    }

    public static void main(String[] args) {
        System.out.println(OrderItemDAO.getInstance().addOrderItem(10, 100, 2, 10000));
    }

    @Override
    public boolean deleteOrderItem(Integer orderId) {
        String sql = "DELETE FROM order_items WHERE order_id =?";
        return update(sql, orderId);
    }
}