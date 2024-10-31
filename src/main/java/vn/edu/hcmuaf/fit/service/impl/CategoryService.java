package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.CategoryDAO;
import vn.edu.hcmuaf.fit.dao.impl.LevelDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.model.ProductCategories;
import vn.edu.hcmuaf.fit.model.ProductGroups;
import vn.edu.hcmuaf.fit.service.ICategoryService;

import java.util.List;
import java.util.Map;

public class CategoryService extends LogDAO<ProductCategories> implements ICategoryService {

    private static ICategoryService instance;

    public static ICategoryService getInstance() {
        if (instance == null) {
            instance = new CategoryService();
        }
        return instance;
    }
    @Override
    public List<ProductCategories> getCategories() {
        return CategoryDAO.getInstance().getCategories();
    }

    @Override
    public Map<ProductCategories, Integer> getQuantityCategories() {
        return CategoryDAO.getInstance().getQuantityCategories();
    }

    @Override
    public boolean setCategoryStatus(ProductCategories cate, Boolean active, String ip, String address) {
        try {
            Level level;
            cate.setBeforeData("Old status of ID=" + cate.getId() + " is " + (active?0:1));
            boolean success = CategoryDAO.getInstance().setActive(cate.getId(), active);
            if(success) {
                cate.setAfterData("The new status of ID=" + cate.getId() + " is updated!");
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                cate.setAfterData("The new status of ID=" + cate.getId() + " is not updated!");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(cate, level, ip, address);
            return success;
        } catch (Exception e) {
            cate.setAfterData("The new status of ID=" + cate.getId() + " is not updated!");
            super.insert(cate, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return false;
        }
    }

    @Override
    public ProductCategories getCategoryById(Integer id) {
        try {
            return CategoryDAO.getInstance().getCategoryById(id).get(0);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public boolean editCategory(ProductCategories cate, String cateName, String ip, String address) {
        try {
            Level level;
            cate.setBeforeData("Old info of ID=" + cate.getId() + " is " + cate);
            boolean success = CategoryDAO.getInstance().editCategory(cate.getId(), cateName);
            if(success) {
                cate.setAfterData("New info of ID=" + cate.getId() + " is updated!");
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                cate.setAfterData("Update fail. Old info of ID=" + cate.getId() + " is not updated");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(cate, level, ip, address);
            return success;
        } catch (Exception e) {
            cate.setAfterData("Update fail. Old info of ID=" + cate.getId() + " is not updated");
            super.insert(cate, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            return false;
        }
    }

    @Override
    public ProductCategories addCategory(ProductCategories cate, String ip, String address) {
        ProductCategories success = null;
        try {
            Level level;
            success = CategoryDAO.getInstance().addCategory(cate.getCategoryName(), cate.getGroup().getId());
            if(success != null) {
                cate.setAfterData("Add successfully with ID=" + success.getId());
                level = LevelDAO.getInstance().getLevel(1).get(0);
            } else {
                cate.setAfterData("Add failed. New category isn't created in database");
                level = LevelDAO.getInstance().getLevel(2).get(0);
            }
            super.insert(cate, level, ip, address);
            return success;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<ProductGroups> getCategoriesGroups() {
        return CategoryDAO.getInstance().getCategoriesGroups();
    }

    @Override
    public ProductGroups getCategoriesGroupById(Integer id) {
        return CategoryDAO.getInstance().getCategoriesGroupById(id);
    }

    @Override
    public boolean checkExistCate(String cateName) {
        return CategoryDAO.getInstance().checkExistCate(cateName);
    }
}