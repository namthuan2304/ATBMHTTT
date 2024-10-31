package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.ProductGroups;

import java.util.List;

public interface IGroupDAO extends GenericDAO<ProductGroups> {

    List<ProductGroups> getGroupCategory();

}
