package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.ProductCategories;
import vn.edu.hcmuaf.fit.model.ProductGroups;

import java.util.List;
import java.util.Map;

public interface ICategoryService {

    List<ProductCategories> getCategories();

    Map<ProductCategories, Integer> getQuantityCategories();

    boolean setCategoryStatus(ProductCategories cate, Boolean active, String ip, String address);

    ProductCategories getCategoryById(Integer id);

    boolean editCategory(ProductCategories cate, String cateName, String ip, String address);

    ProductCategories addCategory(ProductCategories cate, String ip, String address);

    List<ProductGroups> getCategoriesGroups();

    ProductGroups getCategoriesGroupById(Integer id);

    boolean checkExistCate(String cate);
}