package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.ShippingType;

import java.util.List;

public interface IShippingTypeDAO extends GenericDAO<ShippingType> {

    List<ShippingType> getShippingTypeById(Integer id);

    List<ShippingType> getShippingTypesByInfo(Integer infoId);

    List<ShippingType> getAllShippingTypes();
}
