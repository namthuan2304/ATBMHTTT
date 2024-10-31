package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.ProductTypes;

import java.util.List;
import java.util.Map;

public interface IProductService {

    Map<Product, List<String>> getAllProducts();

    Map<Product, List<String>> getAllProductsLimited(Integer start, Integer pageSize);

    Integer getTotalProducts();

    Map<Product, List<String>> searchProductsLimited(String searchTerm, Integer start, Integer pageSize);

    Integer getTotalSearchResults(String searchTerm);

    Map<String, Integer> getListObject();

    Map<Product, List<String>> getProductByCategory(String categoryName, Integer start, Integer pageSize);

    Map<Product, List<String>> getProductByType(String productType, Integer start, Integer pageSize);

    Map<String, Integer> getGroupListObject();

    Map<String, Integer> getListProductType();

    Map<Product, List<String>> getProductByGroup(String groupName, Integer start, Integer pageSize);

    Map<Product, List<String>> getProductByIdWithSupplierInfo(Product p, String ip, String address);

    Map<Product, List<String>> getProductsLimit(ProductTypes type, Integer limit);

    boolean updateProduct(Product p, String ip, String address);

    boolean deleteProductById(Product p, String ip, String address);

    Product addProduct(Product p, String ip, String address);

    boolean setQuantity(Product p, String ip, String address);

    List<Product> getOutOfProducts();

}
