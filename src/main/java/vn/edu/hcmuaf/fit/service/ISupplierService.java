package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Supplier;

import java.util.List;

public interface ISupplierService {

    Supplier getSupplierById(Integer id);

    List<Supplier> getSuppliers();

    Integer sumOfSupplier();

    Supplier insertSupplier(Supplier supplier, String ip, String address);

    boolean updateSupplier(Supplier supplier, String name, String email, String phone, String detailAddress, String imageUrl, Boolean active, String ip, String address);

    boolean deleteSupplier(Supplier supplier, String ip, String address);

}