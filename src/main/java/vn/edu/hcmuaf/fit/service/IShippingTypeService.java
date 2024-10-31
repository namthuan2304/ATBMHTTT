package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.ShippingType;

import java.util.List;

public interface IShippingTypeService {

    ShippingType getShippingTypeById(ShippingType type);

    List<ShippingType> getShippingTypesByInfo(ShippingType type);

    List<ShippingType> getAllShippingTypes();
}
