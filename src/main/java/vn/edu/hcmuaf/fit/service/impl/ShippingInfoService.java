package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.ShippingInfoDAO;
import vn.edu.hcmuaf.fit.model.ShippingInfo;
import vn.edu.hcmuaf.fit.service.IShippingInfoService;

import java.util.List;

public class ShippingInfoService implements IShippingInfoService {
    private static IShippingInfoService instance;

    public static IShippingInfoService getInstance() {
        if (instance == null) {
            instance = new ShippingInfoService();
        }
        return instance;
    }

    @Override
    public ShippingInfo getShippingInfo(ShippingInfo info) {
        try {
            return ShippingInfoDAO.getInstance().getShippingInfo(info.getId()).get(0);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<ShippingInfo> getAllShippingInfo() {
        try {
            return ShippingInfoDAO.getInstance().getAllShippingInfo();
        } catch (Exception e) {
            return null;
        }
    }
}