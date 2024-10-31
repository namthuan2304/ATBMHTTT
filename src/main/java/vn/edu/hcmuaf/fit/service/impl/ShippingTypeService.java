package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.ShippingTypeDAO;
import vn.edu.hcmuaf.fit.model.ShippingInfo;
import vn.edu.hcmuaf.fit.model.ShippingType;
import vn.edu.hcmuaf.fit.service.IShippingTypeService;

import java.util.List;

public class ShippingTypeService implements IShippingTypeService {
    private static ShippingTypeService instance;

    public static ShippingTypeService getInstance() {
        if (instance == null) {
            instance = new ShippingTypeService();
        }
        return instance;
    }

    @Override
    public ShippingType getShippingTypeById(ShippingType type) {
        try {
            ShippingType re = ShippingTypeDAO.getInstance().getShippingTypeById(type.getId()).get(0);
            re.setInfo(ShippingInfoService.getInstance().getShippingInfo(type.getInfo()));
            return re;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<ShippingType> getShippingTypesByInfo(ShippingType type) {
        try {
            List<ShippingType> re = ShippingTypeDAO.getInstance().getShippingTypeById(type.getInfo().getId());
            for (ShippingType st : re) {
                st.setInfo(ShippingInfoService.getInstance().getShippingInfo(type.getInfo()));
            }
            return re;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<ShippingType> getAllShippingTypes() {
        try {
            List<ShippingType> re = ShippingTypeDAO.getInstance().getAllShippingTypes();
            for (ShippingType st : re) {
                ShippingInfo info = new ShippingInfo();
                info.setId(st.getInfo().getId());
                st.setInfo(ShippingInfoService.getInstance().getShippingInfo(info));
            }
            return re;
        } catch (Exception e) {
            return null;
        }
    }
}