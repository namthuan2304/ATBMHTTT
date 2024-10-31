package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.AddressDAO;
import vn.edu.hcmuaf.fit.dao.impl.LevelDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.dao.impl.SupplierDAO;
import vn.edu.hcmuaf.fit.model.Address;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.model.Supplier;
import vn.edu.hcmuaf.fit.service.IAddressService;

import java.util.List;

public class AddressService extends LogDAO<Address> implements IAddressService {
    private static IAddressService instance;

    public static IAddressService getInstance() {
        if (instance == null) {
            instance = new AddressService();
        }
        return instance;
    }

    @Override
    public Address loadAddress() {
        try {
            return AddressDAO.getInstance().loadAddress().get(0);
        } catch (Exception e) {
            return null;
        }
    }

    public static void main(String[] args) {
        System.out.println(AddressService.getInstance().loadAddress());
    }

    @Override
    public boolean updateAddress(Address pageAddress, String ip, String address) {
        try {
            Level level;
            pageAddress.setBeforeData("Old info of web address is " + pageAddress);
            boolean success = AddressDAO.getInstance().updateAddress(pageAddress.getId(),pageAddress.getAddress(), pageAddress.getPhone(), pageAddress.getHotline(), pageAddress.getEmail(), pageAddress.getTimeOpen(), pageAddress.getMap());
            if(success) {
                pageAddress.setAfterData("New info of address is update");
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                pageAddress.setAfterData("New info of address isn't updated!");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(pageAddress, level, ip, address);
            return success;
        } catch (Exception e) {
            pageAddress.setBeforeData("New info of web address is " + pageAddress);
            super.insert(pageAddress, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return false;
        }
    }

    @Override
    public Address getAddressById(Integer id) {
        try {
            return  AddressDAO.getInstance().getAddressById(id).get(0);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Address insertAddress(Address address1, String ip, String address) {
        try {
            Level level;

            Address success = AddressDAO.getInstance().insertAddress(
                    address1.getAddress(),
                    address1.getPhone(),
                    address1.getHotline(),
                    address1.getEmail(),
                    address1.getTimeOpen(),
                    address1.getMap()

            );
            if(success != null) {
                address1.setAfterData("Add successfully with ID=" + success.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                address1.setAfterData("Add failed. New address isn't created in database");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(address1, level, ip, address);
            return success;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public boolean deleteAddress(Address address1, String ip, String address) {
        try {
            Level level;
            address1.setBeforeData("Supplier info of ID=" + address1.getId() + " is " + address1 + " before delete");
            boolean success = AddressDAO.getInstance().deleteAddress(address1.getId());
            if(success) {
                level = LevelDAO.getInstance().getLevel(1).get(0);
                address1.setAfterData("Supplier with ID=" + address1.getId() + " has been deleted");
            } else {
                level = LevelDAO.getInstance().getLevel(2).get(0);
                address1.setAfterData("Delete failed with ID=" + address1.getId());
            }
            super.insert(address1, level, ip, address);
            return success;
        } catch (Exception e) {
            List<Address> list = AddressDAO.getInstance().getAddressById(address1.getId());
            address1.setAfterData(e.getMessage() + " with ID=" + address1.getId());
            super.insert(address1, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            if(list.isEmpty()) return true;
            else return false;
        }
    }
    @Override
    public void setMainAddress(int id) {
        AddressDAO.getInstance().clearMainAddress();
        AddressDAO.getInstance().setMainAddress(id);
    }

    @Override
    public void clearMainAddress() {
        AddressDAO.getInstance().clearMainAddress();
    }

}