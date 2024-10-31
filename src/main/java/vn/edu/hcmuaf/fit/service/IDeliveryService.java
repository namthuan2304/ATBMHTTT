package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Address;
import vn.edu.hcmuaf.fit.model.DeliveryAddress;
import vn.edu.hcmuaf.fit.model.Order;
import vn.edu.hcmuaf.fit.model.User;

import java.util.List;

public interface IDeliveryService {

    List<DeliveryAddress> loadAddressByUser(User user);

    DeliveryAddress loadAddressByOrder(Order order);

    DeliveryAddress loadAddressById(DeliveryAddress delivery);

    DeliveryAddress addDeliveryAddress(DeliveryAddress delivery, String ip, String address);

    boolean updateDeliveryAddress(DeliveryAddress delivery, String ip, String address);

    boolean deleteDeliveryAddress(DeliveryAddress delivery, String ip, String address);

}