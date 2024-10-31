package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Level;

import java.util.List;

public interface ILevelDAO extends GenericDAO<Level> {

    List<Level> getLevel(int id);

}