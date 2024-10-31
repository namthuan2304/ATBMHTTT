package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.ShippingInfo;

import java.util.List;

public interface IShippingInfoDAO extends GenericDAO<ShippingInfo> {

    List<ShippingInfo> getShippingInfo(Integer infoId);

    List<ShippingInfo> getAllShippingInfo();
}