package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.OrderStatus;

import java.util.List;

public interface IOrderStatusService {

    List<OrderStatus> getAllStatus();

    OrderStatus getStatusById(OrderStatus status);

}