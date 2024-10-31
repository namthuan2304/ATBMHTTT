package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.ILogDAO;
import vn.edu.hcmuaf.fit.model.AbsModel;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.model.Log;

import java.util.List;

public class LogDAO<T extends AbsModel> extends AbsDAO<Log> implements ILogDAO<T> {

    @Override
    public Log insert(T model, Level level, String ip, String address) {
        try {
            String sql = "INSERT INTO log(level_id, ip, address, pre_value, post_value) VALUES (?, ?, ?, ?, ?)";
            return insert(sql, Log.class, level.getId(), ip, address, model.getBeforeData(), model.getAfterData());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Log> getAllLogs() {
        String sql = "SELECT * FROM log";
        return query(sql, Log.class);
    }
}