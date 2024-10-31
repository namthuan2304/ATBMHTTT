package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.ProductCategories;
import vn.edu.hcmuaf.fit.model.ProductGroups;

import java.util.List;
import java.util.Map;

public interface ICategoryDAO extends GenericDAO<ProductCategories> {

    List<ProductCategories> getCategories();

    Map<ProductCategories, Integer> getQuantityCategories();

    List<ProductCategories> getCategoryById(Integer id);

    boolean setActive(Integer id, Boolean active);

    boolean editCategory(Integer id, String cateName);

    ProductCategories addCategory(String cateName, Integer groupId);

    List<ProductGroups> getCategoriesGroups();

    ProductGroups getCategoriesGroupById(Integer id);

    boolean checkExistCate(String cate);
}