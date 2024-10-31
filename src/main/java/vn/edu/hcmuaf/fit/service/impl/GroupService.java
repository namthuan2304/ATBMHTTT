package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.GroupDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.model.ProductGroups;
import vn.edu.hcmuaf.fit.service.IGroupService;

import java.util.List;

public class GroupService extends LogDAO<ProductGroups> implements IGroupService {

    @Override
    public List<ProductGroups> getGroupCategory() {
        return GroupDAO.getInstance().getGroupCategory();
    }
}