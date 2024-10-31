package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.LevelDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.dao.impl.ProductDAO;
import vn.edu.hcmuaf.fit.model.*;
import vn.edu.hcmuaf.fit.service.IProductService;

import java.util.List;
import java.util.Map;

public class ProductService extends LogDAO<Product> implements IProductService {
    private static IProductService instance;

    public static IProductService getInstance() {
        if (instance == null) instance = new ProductService();
        return instance;
    }

    @Override
    public Map<Product, List<String>> getAllProducts() {
        return ProductDAO.getInstance().getAllProducts();
    }

    @Override
    public Map<Product, List<String>> getAllProductsLimited(Integer start, Integer pageSize) {
        return ProductDAO.getInstance().getAllProductsLimited(start, pageSize);
    }

    @Override
    public Integer getTotalProducts() {
        return ProductDAO.getInstance().getTotalProducts();
    }

    @Override
    public Map<Product, List<String>> searchProductsLimited(String searchTerm, Integer start, Integer pageSize) {
        return ProductDAO.getInstance().searchProductsLimited(searchTerm, start, pageSize);
    }

    @Override
    public Integer getTotalSearchResults(String searchTerm) {
        return ProductDAO.getInstance().getTotalSearchResults(searchTerm);
    }

    @Override
    public Map<String, Integer> getListObject() {
        return ProductDAO.getInstance().getListObject();
    }

    @Override
    public Map<Product, List<String>> getProductByCategory(String categoryName, Integer start, Integer pageSize) {
        return ProductDAO.getInstance().getProductByCategory(categoryName, start, pageSize);
    }

    @Override
    public Map<Product, List<String>> getProductByType(String productType, Integer start, Integer pageSize) {
        return ProductDAO.getInstance().getProductByType(productType, start, pageSize);
    }

    @Override
    public Map<String, Integer> getGroupListObject() {
        return ProductDAO.getInstance().getGroupListObject();
    }

    @Override
    public Map<String, Integer> getListProductType() {
        return ProductDAO.getInstance().getListProductType();
    }

    @Override
    public Map<Product, List<String>> getProductByGroup(String groupName, Integer start, Integer pageSize) {
        return ProductDAO.getInstance().getProductByGroup(groupName, start, pageSize);
    }

    @Override
    public Map<Product, List<String>> getProductByIdWithSupplierInfo(Product p, String ip, String address) {
        try {
            Level level;
            Map<Product, List<String>> success = ProductDAO.getInstance().getProductByIdWithSupplierInfo(p.getId());
            if (success != null && success.size() == 1) {
                p.setAfterData("Get product with ID=" + p.getId() + " successfully");
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                p.setAfterData("Get product with ID=" + p.getId() + " failed");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(p, level, ip, address);
            return success;
        } catch (Exception e) {
            p.setAfterData("Get product with ID=" + p.getId() + " failed with " + e.getMessage());
            super.insert(p, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return null;
        }
    }

    @Override
    public Map<Product, List<String>> getProductsLimit(ProductTypes type, Integer limit) {
        return ProductDAO.getInstance().getProductsLimit(type.getId(), limit);
    }

    @Override
    public boolean updateProduct(Product p, String ip, String address) {
        try {
            Level level;
            p.setBeforeData("Old info of ID=" + p.getId() + " is " + p);
            boolean success = ProductDAO.getInstance().updateProduct(p.getId(), p.getProductName(), p.getCate().getId(), p.getSalePercent(), p.getPrice(), p.getQuantity(),
                    p.getPurpose(), p.getContraindications(), p.getIngredients(), p.getDosage(), p.getInstructions(), p.getWarrantyPeriod(), p.getStorageCondition(),
                    p.getType().getId(), p.getSupplier().getId(), p.getActive());
            if (success) {
                p.setAfterData("Update success with ID=" + p.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                p.setAfterData("Update fail with ID=" + p.getId());
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(p, level, ip, address);
            return success;
        } catch (Exception e) {
            p.setAfterData("Update fail with ID=" + p.getId() + " is " + p);
            super.insert(p, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return false;
        }
    }

    @Override
    public boolean deleteProductById(Product p, String ip, String address) {
        try {
            Level level;
            p.setBeforeData("Product info of ID=" + p.getId() + " is " + p + " before delete");
            ImageService.getInstance().removeImage(p, ip, address);
            boolean success = ProductDAO.getInstance().deleteProductById(p.getId());
            if (success) {
                level = LevelDAO.getInstance().getLevel(1).get(0);
                p.setAfterData("Product ID=" + p.getId() + " has been deleted");
            } else {
                level = LevelDAO.getInstance().getLevel(2).get(0);
                p.setAfterData("Delete failed with ID=" + p.getId());
            }
            super.insert(p, level, ip, address);
            return success;
        } catch (Exception e) {
            Map<Product, List<String>> product = ProductDAO.getInstance().getProductByIdWithSupplierInfo(p.getId());
            p.setAfterData(e.getMessage() + " with ID=" + p.getId());
            super.insert(p, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            if (product == null || product.isEmpty()) return true;
            else return false;
        }
    }

    @Override
    public Product addProduct(Product p, String ip, String address) {
        try {
            Level level;
            Product success = ProductDAO.getInstance().addProduct(p.getProductName(), p.getCate().getId(), p.getSalePercent(), p.getPrice(), p.getQuantity(),
                    p.getPurpose(), p.getContraindications(), p.getIngredients(), p.getDosage(), p.getInstructions(), p.getWarrantyPeriod(), p.getStorageCondition(),
                    p.getType().getId(), p.getSupplier().getId(), p.getActive());
            if (success != null) {
                p.setAfterData("Add product success with ID=" + success.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                p.setAfterData("Add failed. New product isn't created in database");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(p, level, ip, address);
            return success;
        } catch (Exception e) {
            return null;
        }

    }
    @Override
    public boolean setQuantity(Product p, String ip, String address) {
        try {
            Level level;
            p.setBeforeData("Product info of ID=" + p.getId() + " is " + p + " before set");
            boolean success = ProductDAO.getInstance().setQuantity(p.getId());
            if(success) {
                level = LevelDAO.getInstance().getLevel(1).get(0);
                p.setAfterData("Product ID=" + p.getId() + " has been set");
            } else {
                level = LevelDAO.getInstance().getLevel(2).get(0);
                p.setAfterData("set failed with ID=" + p.getId());
            }
            super.insert(p, level, ip, address);
            return success;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public List<Product> getOutOfProducts() {
        try {
            return ProductDAO.getInstance().getOutOfProducts();
        } catch (Exception e) {
            return null;
        }
    }
}

