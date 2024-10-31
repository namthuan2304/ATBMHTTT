package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Product;

import java.util.List;
import java.util.Map;

public interface IProductDAO extends GenericDAO<Product> {

    Map<Product, List<String>> getAllProducts();

    Map<Product, List<String>> getAllProductsLimited(Integer start, Integer limit);

    Integer getTotalProducts();

    Map<Product, List<String>> searchProductsLimited(String searchTerm, Integer start, Integer pageSize);

    Integer getTotalSearchResults(String searchTerm);

    Map<String, Integer> getListObject();

    Map<Product, List<String>> getProductByCategory(String categoryName, Integer start, Integer pageSize);

    Map<Product, List<String>> getProductByType(String productType, Integer start, Integer pageSize);

    Map<String, Integer> getGroupListObject();

    Map<String, Integer> getListProductType();

    Map<Product, List<String>> getProductByGroup(String groupName, Integer start, Integer pageSize);

    Map<Product, List<String>> getProductByIdWithSupplierInfo(Integer productId);

    boolean updateProduct(Integer id, String productName, Integer categoryId, Double percent,
                          Integer price, Integer quantity, String purpose, String contraindications,
                          String ingredients, String dosage, String instructions, String warrantyPeriod,
                          String storageCondition, Integer typeId, Integer supplierId, Boolean active);

    boolean deleteProductById(int productId);

    public Product addProduct(String productName, Integer categoryId, Double percent,
                              Integer price, Integer quantity, String purpose, String contraindications,
                              String ingredients, String dosage, String instructions, String warrantyPeriod,
                              String storageCondition, Integer typeId, Integer supplierId, Boolean active);

    Map<Product, List<String>> getProductsLimit(Integer type_id, Integer limit);

    boolean setQuantity(Integer id);

    List<Product> getOutOfProducts();
}