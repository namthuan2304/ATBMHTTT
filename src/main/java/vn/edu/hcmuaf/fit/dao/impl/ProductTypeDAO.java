package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IProductTypeDAO;
import vn.edu.hcmuaf.fit.model.ProductTypes;

import java.util.List;

public class ProductTypeDAO extends AbsDAO<ProductTypes> implements IProductTypeDAO {
    private static IProductTypeDAO instance;

    public static IProductTypeDAO getInstance() {
        if (instance == null) {
            instance = new ProductTypeDAO();
        }
        return instance;
    }

    @Override
    public List<ProductTypes> loadProductType() {
        String sql = "SELECT * FROM product_types";
        return query(sql, ProductTypes.class);
    }

    @Override
    public Integer sumOfProductType() {
        String sql = "SELECT count(*) FROM product_types";
        return count(sql);
    }

    @Override
    public List<ProductTypes> getProductTypeById(Integer id) {
        String sql = "SELECT * FROM product_types WHERE id = ?";
        return query(sql, ProductTypes.class, id);
    }

    @Override
    public ProductTypes insertProductTypes(String typeName, Boolean active) {
        String sql = "INSERT INTO product_types (type_name, active) VALUES(?, ?)";
        return insert(sql, ProductTypes.class, typeName, active ? 1 : 0);
    }

    @Override
    public boolean updateProductTypes(Integer id, String typeName, Boolean active) {
        String sql = "UPDATE product_types SET type_name =?, active =? WHERE id =?";
        return update(sql, typeName, active ? 1:0, id);
    }

    @Override
    public boolean deleteProductTypes(Integer id) {
        String sql = "DELETE FROM product_types WHERE id =?";
        return update(sql, id);
    }
}