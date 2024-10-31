package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IShippingTypeDAO;
import vn.edu.hcmuaf.fit.model.ShippingType;

import java.util.List;

public class ShippingTypeDAO extends AbsDAO<ShippingType> implements IShippingTypeDAO {
    private static IShippingTypeDAO instance;

    public static IShippingTypeDAO getInstance() {
        if (instance == null) {
            instance = new ShippingTypeDAO();
        }
        return instance;
    }

    @Override
    public List<ShippingType> getShippingTypeById(Integer id) {
        String sql = "SELECT * FROM shipping_type WHERE id = ?";
        return query(sql, ShippingType.class, id);
    }

    @Override
    public List<ShippingType> getShippingTypesByInfo(Integer infoId) {
        String sql = "SELECT * FROM shipping_type WHERE info_id =?";
        return query(sql, ShippingType.class, infoId);
    }

    @Override
    public List<ShippingType> getAllShippingTypes() {
        String sql = "SELECT * FROM shipping_type";
        return query(sql, ShippingType.class);
    }
}