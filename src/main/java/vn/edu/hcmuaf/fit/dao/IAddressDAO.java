package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Address;
import vn.edu.hcmuaf.fit.model.Supplier;

import java.util.List;

public interface IAddressDAO extends GenericDAO<Address>{

    List<Address> loadAddress();

    boolean updateAddress(Integer id, String address, String phone, String hotline, String email, String timeOpen, String map);
    List<Address> getAddressById(Integer id);

    Address insertAddress(String address, String phone, String hotline, String email, String timeOpen, String map);

    boolean deleteAddress(Integer id);

    void clearMainAddress();

    void setMainAddress(int id);


}