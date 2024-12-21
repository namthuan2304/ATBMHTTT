package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IDeliveryDAO;
import vn.edu.hcmuaf.fit.model.DeliveryAddress;

import java.util.List;

public class DeliveryDAO extends AbsDAO<DeliveryAddress> implements IDeliveryDAO {
    private static IDeliveryDAO instance;

    public static IDeliveryDAO getInstance() {
        if (instance == null) {
            instance = new DeliveryDAO();
        }
        return instance;
    }

    @Override
    public List<DeliveryAddress> loadAddressByUser(Integer userId) {
        String sql = "SELECT * FROM delivery_address WHERE user_id = ?";
        return query(sql, DeliveryAddress.class, userId);
    }

    @Override
    public List<DeliveryAddress> loadAddressById(Integer id) {
        String sql = "SELECT * FROM delivery_address WHERE id = ?";
        return query(sql, DeliveryAddress.class, id);
    }

    @Override
    public List<DeliveryAddress> loadAddressByOrder(Integer id) {
        String sql = "SELECT d.* FROM (" +
                " SELECT * FROM orders WHERE id = ?" +
                ") AS o LEFT JOIN delivery_address d ON o.address_id = d.id";
        return query(sql, DeliveryAddress.class, id);
    }

    public static void main(String[] args) {
        System.out.println(DeliveryDAO.getInstance().loadAddressByOrder(55));
    }

    @Override
    public DeliveryAddress addDeliveryAddress(Integer userId, String fullName, String phone, String province, String district, String ward, String detailAddress) {
        String sql = "INSERT INTO `delivery_address`(`user_id`, `full_name`, `phone`, `province`, `district`, `ward`, `detail_address`) VALUES (?, ?, ?, ?, ?, ?, ?)";
        return insert(sql, DeliveryAddress.class, userId, fullName, phone, province, district, ward, detailAddress);
    }

    @Override
    public boolean updateDeliveryAddress(Integer userId, Integer addressId, String fullName, String phone, String province, String district, String ward, String detailAddress) {
        String sql = "UPDATE delivery_address SET full_name = ?, phone = ?, province = ?, district = ?, ward = ?, detail_address = ? WHERE user_id = ? AND id = ?";
        return update(sql, fullName, phone, province, district, ward, detailAddress, userId, addressId);
    }

    @Override
    public boolean deleteDeliveryAddress(Integer userId, Integer addressId) {
        String sql = "DELETE FROM delivery_address WHERE user_id =? AND id =?";
        return update(sql, userId, addressId);
    }
}