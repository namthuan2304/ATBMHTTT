package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.ISupplierDAO;
import vn.edu.hcmuaf.fit.model.Supplier;

import java.util.List;

public class SupplierDAO extends AbsDAO<Supplier> implements ISupplierDAO {
    private static ISupplierDAO instance;

    public static ISupplierDAO getInstance() {
        if (instance == null) {
            instance = new SupplierDAO();
        }
        return instance;
    }

    /**
     * TESTED
     * Loads a list of all suppliers from the database.
     */
    @Override
    public List<Supplier> loadSupplierList() {
        String sql = "SELECT * FROM suppliers";
        return query(sql, Supplier.class);
    }

    /**
     * TESTED
     * Counts the total number of suppliers in the database.=
     */
    @Override
    public Integer sumOfSupplier() {
        String sql = "SELECT COUNT(*) FROM suppliers";
        return count(sql);
    }

    /**
     * TESTED
     * Retrieves a list of suppliers based on the provided supplier id.
     */
    @Override
    public List<Supplier> getSupplierById(Integer id) {
        String sql = "SELECT * FROM suppliers WHERE id =?";
        return query(sql, Supplier.class, id);
    }

    /**
     * TESTED
     * Inserts a new supplier into the database.
     */
    @Override
    public Supplier insertSupplier(String supplierName, String contactName, String email, String phone, String detailAddress, String imageUrl, Boolean active) {
        String sql = "INSERT INTO suppliers (supplierName, contactName, email, phone, detail_Address, imageUrl, active) VALUES(?,?,?,?,?,?,?)";
        int activeInt = (active != null && active) ? 1 : 0; // Chuyển đổi Boolean sang int

        return insert(sql, Supplier.class, supplierName, contactName, email, phone, detailAddress, imageUrl, activeInt);
    }

    /**
     * TESTED
     * Updates a supplier in the database.
     */
    @Override
    public boolean updateSupplier(Integer id, String supplierName, String contactName, String email, String phone, String detailAddress, String imageUrl, Boolean active) {
        String sql = "UPDATE suppliers SET supplierName = ?, contactName = ?, email = ?, phone = ?, detail_Address = ?, imageUrl = ?, active = ? WHERE id = ?";
        int activeInt = (active != null && active) ? 1 : 0;
        return update(sql, supplierName, contactName, email, phone, detailAddress, imageUrl, activeInt, id);
    }



    /**
     * TESTED
     * Deletes a supplier from the database based on the provided supplier id.=
     */
    @Override
    public boolean deleteSupplier(Integer id) {
        String sql = "DELETE FROM suppliers WHERE id=?";

        return update(sql, id);
    }
}