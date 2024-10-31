package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IShippingInfoDAO;
import vn.edu.hcmuaf.fit.model.ShippingInfo;

import java.util.List;

public class ShippingInfoDAO extends AbsDAO<ShippingInfo> implements IShippingInfoDAO {
    private static IShippingInfoDAO instance;

    public static IShippingInfoDAO getInstance() {
        if (instance == null) {
            instance = new ShippingInfoDAO();
        }
        return instance;
    }

    @Override
    public List<ShippingInfo> getShippingInfo(Integer infoId) {
        String sql = "SELECT * FROM shipping_info WHERE id = ?";
        return query(sql, ShippingInfo.class, infoId);
    }

    @Override
    public List<ShippingInfo> getAllShippingInfo() {
        String sql = "SELECT * FROM shipping_info";
        return query(sql, ShippingInfo.class);
    }
}