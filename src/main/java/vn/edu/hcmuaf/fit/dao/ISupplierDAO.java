package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Supplier;

import java.util.List;

public interface ISupplierDAO extends GenericDAO<Supplier> {

    List<Supplier> loadSupplierList();

    Integer sumOfSupplier();

    List<Supplier> getSupplierById(Integer id);

    Supplier insertSupplier(String supplierName, String contactName, String email, String phone, String detailAddress, String imageUrl, Boolean active);

    boolean updateSupplier(Integer id, String supplierName, String contactName, String email, String phone, String detailAddress, String imageUrl, Boolean active);


    boolean deleteSupplier(Integer id);
}