package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.OrderItem;

import java.util.List;

public interface IOrderItemDAO extends GenericDAO<OrderItem> {

    boolean addOrderItem(Integer orderId, Integer prodId, Integer quantity, Integer orderPrice);

    boolean deleteOrderItem(Integer orderId);

    List<OrderItem> getOrderItems(Integer orderId);
}