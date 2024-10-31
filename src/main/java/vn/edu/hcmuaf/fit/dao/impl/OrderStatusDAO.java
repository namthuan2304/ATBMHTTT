package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IOrderStatusDAO;
import vn.edu.hcmuaf.fit.model.OrderStatus;

import java.util.List;

public class OrderStatusDAO extends AbsDAO<OrderStatus> implements IOrderStatusDAO {
    private static IOrderStatusDAO instance;

    public static IOrderStatusDAO getInstance() {
        if (instance == null) {
            instance = new OrderStatusDAO();
        }
        return instance;
    }

    @Override
    public List<OrderStatus> getAllStatus() {
        String sql = "SELECT * FROM order_status";
        return query(sql, OrderStatus.class);
    }

    @Override
    public List<OrderStatus> getStatusById(Integer id) {
        String sql = "SELECT * FROM order_status WHERE id =?";
        return query(sql, OrderStatus.class, id);
    }
}