package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.DeliveryDAO;
import vn.edu.hcmuaf.fit.dao.impl.LevelDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.model.DeliveryAddress;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.model.Order;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.IDeliveryService;

import java.util.List;

public class DeliveryService extends LogDAO<DeliveryAddress> implements IDeliveryService {
    private static IDeliveryService instance;

    public static IDeliveryService getInstance() {
        if (instance == null) {
            instance = new DeliveryService();
        }
        return instance;
    }

    @Override
    public List<DeliveryAddress> loadAddressByUser(User user) {
        try {
            return DeliveryDAO.getInstance().loadAddressByUser(user.getId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public DeliveryAddress loadAddressByOrder(Order order) {
        try {
            return DeliveryDAO.getInstance().loadAddressByOrder(order.getId()).get(0);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public DeliveryAddress loadAddressById(DeliveryAddress delivery) {
        try {
            return DeliveryDAO.getInstance().loadAddressById(delivery.getId()).get(0);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public DeliveryAddress addDeliveryAddress(DeliveryAddress delivery, String ip, String address) {
        DeliveryAddress success = null;
        try {
            Level level;
            success = DeliveryDAO.getInstance().addDeliveryAddress(delivery.getUser().getId(), delivery.getFullName(), delivery.getPhone(), delivery.getProvince(), delivery.getDistrict(), delivery.getWard(), delivery.getDetailAddress(), delivery.getAtHome(), delivery.getIsPrimary());
            if(success != null) {
                delivery.setAfterData("Add delivery success with ID=" + success.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                delivery.setAfterData("Add failed. New delivery isn't created in database");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(delivery, level, ip, address);
            return success;
        } catch (Exception e) {
            return null;
        }
    }

    public static void main(String[] args) {
        DeliveryAddress deliveryAddress = new DeliveryAddress();
        User user = new User();
        user.setId(83);
        deliveryAddress.setUser(user);
        deliveryAddress.setFullName("John Doe");
        deliveryAddress.setPhone("0987654321");
        deliveryAddress.setProvince("Hà Nội");
        deliveryAddress.setDistrict("Tây Hồ");
        deliveryAddress.setWard("Đội Cung");
        deliveryAddress.setDetailAddress("123 Đường Thanh Niên");
        deliveryAddress.setAtHome(true);
        deliveryAddress.setIsPrimary(true);

        System.out.println(DeliveryService.getInstance().addDeliveryAddress(deliveryAddress, "124", "jdidsjd"));
    }

    @Override
    public boolean updateDeliveryAddress(DeliveryAddress delivery, String ip, String address) {
        boolean success;
        try {
            Level level;
            success = DeliveryDAO.getInstance().updateDeliveryAddress(delivery.getUser().getId(), delivery.getId(), delivery.getFullName(), delivery.getPhone(), delivery.getProvince(), delivery.getDistrict(), delivery.getWard(), delivery.getDetailAddress(), delivery.getAtHome(), delivery.getIsPrimary());
            if(success) {
                delivery.setAfterData("Update delivery successfully with id: " + delivery.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                delivery.setAfterData("Update failed. New delivery isn't created in database");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(delivery, level, ip, address);
            return success;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean deleteDeliveryAddress(DeliveryAddress delivery, String ip, String address) {
        boolean success;
        try {
            Level level;
            success = DeliveryDAO.getInstance().deleteDeliveryAddress(delivery.getUser().getId(), delivery.getId());
            if(success) {
                delivery.setAfterData("Delete success with ID: " + delivery.getId() + " of " + delivery.getUser().getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                delivery.setAfterData("Delete failed. New delivery isn't created in database");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(delivery, level, ip, address);
            return success;
        } catch (Exception e) {
            return false;
        }
    }
}