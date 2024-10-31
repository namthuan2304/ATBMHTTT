package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IGroupDAO;
import vn.edu.hcmuaf.fit.model.ProductGroups;

import java.util.List;

public class GroupDAO extends AbsDAO<ProductGroups> implements IGroupDAO {
    private static IGroupDAO instance;

    public static IGroupDAO getInstance() {
        if (instance == null) {
            instance = new GroupDAO();
        }
        return instance;
    }

    /**
     * TESTED
     * Retrieves all the product groups from the database.
     */
    @Override
    public List<ProductGroups> getGroupCategory() {
        String sql = "SELECT * FROM product_groups";
        return query(sql, ProductGroups.class);
    }
}