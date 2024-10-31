package vn.edu.hcmuaf.fit.dao.impl;

import org.jdbi.v3.core.mapper.RowMapper;
import vn.edu.hcmuaf.fit.dao.ICategoryDAO;
import vn.edu.hcmuaf.fit.model.ProductCategories;
import vn.edu.hcmuaf.fit.model.ProductGroups;

import java.util.AbstractMap;
import java.util.List;
import java.util.Map;

public class CategoryDAO extends AbsDAO<ProductCategories> implements ICategoryDAO {
    private static ICategoryDAO instance;

    public static ICategoryDAO getInstance() {
        if (instance == null) {
            instance = new CategoryDAO();
        }
        return instance;
    }

    /**
     * TESTED
     * Retrieves all categories from the database.
     *
     * @return A list of ProductCategories objects representing all categories in the database.
     */
    @Override
    public List<ProductCategories> getCategories() {
        String sql = "SELECT * FROM product_categories";
        return query(sql, ProductCategories.class);
    }

    /**
     * TESTED
     * Retrieves the quantity of products for each category from the database.
     */
    @Override
    public Map<ProductCategories, Integer> getQuantityCategories() {
        String sql = "SELECT pc.id AS cateId, COALESCE(COUNT(p.quantity), 0) AS total " +
                "FROM product_categories pc " +
                "LEFT JOIN products p ON pc.id = p.cate_id " +
                "GROUP BY pc.id, pc.categoryName";
        RowMapper<Map.Entry<ProductCategories, Integer>> rowMapper = (rs, ctx) -> {
            Integer cateId = rs.getInt("cateId");
            Integer total = rs.getInt("total");
            ProductCategories category = getCategoryById(cateId).get(0);
            return new AbstractMap.SimpleEntry<>(category, total);
        };
        return queryForMap(sql, rowMapper, false);
    }

    /**
     * TESTED
     * Retrieves a category by its id from the database.
     */
    @Override
    public List<ProductCategories> getCategoryById(Integer id) {
        String sql = "SELECT * FROM product_categories WHERE id =?";
        return query(sql, ProductCategories.class, id);
    }

    /**
     * TESTED
     * Updates the 'active' status of a category in the database.
     */
    @Override
    public boolean setActive(Integer id, Boolean active) {
        String sql = "UPDATE product_categories SET active =? WHERE id =?";
        return update(sql, active?1:0, id);
    }

    /**
     * TESTED
     * Updates a category's name in the database.
     */
    @Override
    public boolean editCategory(Integer id, String cateName) {
        String sql = "UPDATE product_categories SET categoryName =? WHERE id =?";
        return update(sql, cateName, id);
    }

    /**
     * TESTED
     * Adds a new category to the database.
     */
    @Override
    public ProductCategories addCategory(String cateName, Integer groupId) {
        String sql = "INSERT INTO `product_categories`(`categoryName`, `group_id`, `active`) VALUES(?,?,0)";
        return insert(sql, ProductCategories.class, cateName, groupId);
    }

    @Override
    public List<ProductGroups> getCategoriesGroups() {
        String sql = "SELECT * FROM product_groups";
        return query(sql, ProductGroups.class);
    }

    @Override
    public ProductGroups getCategoriesGroupById(Integer id) {
        String sql = "SELECT * FROM product_groups WHERE id = ?";
        return query(sql, ProductGroups.class, id).get(0);
    }

    @Override
    public boolean checkExistCate(String cate) {
        String sql = "SELECT * FROM product_categories WHERE categoryName= ?";
        List<ProductCategories> categories = query(sql, ProductCategories.class, cate);
        return !categories.isEmpty();
    }

}