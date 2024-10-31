package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.OrderStatusDAO;
import vn.edu.hcmuaf.fit.model.OrderStatus;
import vn.edu.hcmuaf.fit.service.IOrderStatusService;

import java.util.List;

public class OrderStatusService implements IOrderStatusService {
    private static IOrderStatusService instance;

    public static IOrderStatusService getInstance() {
        if (instance == null) {
            instance = new OrderStatusService();
        }
        return instance;
    }

    @Override
    public List<OrderStatus> getAllStatus() {
        try {
            return OrderStatusDAO.getInstance().getAllStatus();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public OrderStatus getStatusById(OrderStatus status) {
        try {
            return OrderStatusDAO.getInstance().getStatusById(status.getId()).get(0);
        } catch (Exception e) {
            return null;
        }
    }
}