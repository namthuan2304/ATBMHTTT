package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.DeliveryAddress;

import java.util.List;
import java.util.Map;

public interface IDeliveryDAO extends GenericDAO<DeliveryAddress> {

    List<DeliveryAddress> loadAddressByUser(Integer userId);

    List<DeliveryAddress> loadAddressById(Integer id);

    DeliveryAddress addDeliveryAddress(Integer userId, String fullName, String phone, String province, String district,
                                       String ward, String detailAddress, Boolean atHome, Boolean primary);

    boolean updateDeliveryAddress(Integer userId, Integer addressId, String fullName, String phone, String province, String district,
                                       String ward, String detailAddress, Boolean atHome, Boolean primary);

    boolean deleteDeliveryAddress(Integer userId, Integer addressId);

    List<DeliveryAddress> loadAddressByOrder(Integer id);
}