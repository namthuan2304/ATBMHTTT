package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.AbsModel;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.model.Log;

import java.util.List;

public interface ILogDAO<T extends AbsModel> extends GenericDAO<Log> {

    Log insert(T model, Level level, String ip, String address);

    List<Log> getAllLogs();

}