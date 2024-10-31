package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.dao.impl.ProductTypeDAO;
import vn.edu.hcmuaf.fit.model.ProductTypes;
import vn.edu.hcmuaf.fit.service.IProductTypeService;

public class ProductTypeService extends LogDAO<ProductTypes> implements IProductTypeService {
    private static IProductTypeService instance;

    public static IProductTypeService getInstance() {
        if (instance == null) {
            instance = new ProductTypeService();
        }
        return instance;
    }

    @Override
    public ProductTypes getProductTypeById(Integer id) {
        try {
            return ProductTypeDAO.getInstance().getProductTypeById(id).get(0);
        } catch (Exception e) {
            return null;
        }
    }
}