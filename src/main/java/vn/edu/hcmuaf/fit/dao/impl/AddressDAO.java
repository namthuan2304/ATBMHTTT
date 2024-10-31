package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IAddressDAO;
import vn.edu.hcmuaf.fit.model.Address;
import vn.edu.hcmuaf.fit.model.Supplier;

import java.util.List;

public class AddressDAO extends AbsDAO<Address> implements IAddressDAO {
    private static IAddressDAO instance;

    public static IAddressDAO getInstance() {
        if (instance == null) {
            instance = new AddressDAO();
        }
        return instance;
    }

    /**
     * TESTED
     * Loads all addresses from the database.
     */
    @Override
    public List<Address> loadAddress() {
        String sql = "SELECT * FROM `address` WHERE is_main = 1";
        return query(sql, Address.class);
    }

    /**
     * TESTED
     * Updates an address in the database.
     */
    @Override
    public boolean updateAddress(Integer id,String address, String phone, String hotline, String email, String timeOpen, String map) {
        String sql = "UPDATE address SET address=?, phone=?, hotline=?, email=?, timeOpen=?, map=? WHERE id =?";
        return update(sql, address, phone, hotline, email, timeOpen, map, id);
    }

    @Override
    public List<Address> getAddressById(Integer id) {
        String sql = "SELECT * FROM address WHERE id =?";
        return query(sql, Address.class, id);
    }

    @Override
    public Address insertAddress(String address, String phone, String hotline, String email, String timeOpen, String map) {
        String sql = "INSERT INTO address (address, phone, hotline, email, timeOpen, map) VALUES(?,?,?,?,?,?)";
        return insert(sql, Address.class,  address, phone, hotline, email, timeOpen, map);
    }

    @Override
    public boolean deleteAddress(Integer id) {
            String sql = "DELETE FROM address WHERE id=?";
            return update(sql, id);
    }

    @Override
    public void clearMainAddress() {
        String sql = "UPDATE address SET is_main = 0 WHERE is_main = 1";
        update(sql);
    }

    @Override
    public void setMainAddress(int id) {
        String sql = "UPDATE address SET is_main = 1 WHERE id = ?";
        update(sql, id);
    }


    public static void main(String[] args) {
        System.out.println(AddressDAO.getInstance().loadAddress());
    }
}