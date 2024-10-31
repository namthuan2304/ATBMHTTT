package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.OrderStatus;

import java.util.List;

public interface IOrderStatusDAO extends GenericDAO<OrderStatus>{

    List<OrderStatus> getAllStatus();

    List<OrderStatus> getStatusById(Integer id);

}