package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.ProductTypes;

import java.util.List;

public interface IProductTypeDAO extends GenericDAO<ProductTypes> {

    List<ProductTypes> loadProductType();

    Integer sumOfProductType();

    List<ProductTypes> getProductTypeById(Integer id);

    ProductTypes insertProductTypes(String typeName, Boolean active);

    boolean updateProductTypes(Integer id, String typeName, Boolean active);

    boolean deleteProductTypes(Integer id);
}
