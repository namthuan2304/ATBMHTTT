package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.SocialMedia;

import java.util.List;

public interface ISocialMediaDAO extends GenericDAO<SocialMedia> {

    List<SocialMedia> load();

    boolean update(String facebook, String instagram, String twitter, String pinterest, String youtube, String linkedin);
}
