package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.ShippingInfo;

import java.util.List;

public interface IShippingInfoService {

    ShippingInfo getShippingInfo(ShippingInfo info);

    List<ShippingInfo> getAllShippingInfo();

}
