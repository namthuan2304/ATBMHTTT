package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.ILevelDAO;
import vn.edu.hcmuaf.fit.model.Level;

import java.util.List;

public class LevelDAO extends AbsDAO<Level> implements ILevelDAO {
    private static ILevelDAO instance;

    public static ILevelDAO getInstance() {
        if (instance == null) {
            instance = new LevelDAO();
        }
        return instance;
    }

    @Override
    public List<Level> getLevel(int id) {
        String sql = "SELECT * FROM level WHERE id = ?";
        return query(sql, Level.class, id);
    }
}