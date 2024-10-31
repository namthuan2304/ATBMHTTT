package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.ISocialMediaDAO;
import vn.edu.hcmuaf.fit.model.SocialMedia;

import java.util.List;

public class SocialMediaDAO extends AbsDAO<SocialMedia> implements ISocialMediaDAO {
    private static ISocialMediaDAO instance;

    public static ISocialMediaDAO getInstance() {
        if (instance == null) {
            instance = new SocialMediaDAO();
        }
        return instance;
    }

    /**
     * TESTED
     * Loads all the social media data from the database.
     */
    @Override
    public List<SocialMedia> load() {
        String sql = "SELECT * FROM social_media";
        return query(sql, SocialMedia.class);
    }

    /**
     * TESTED
     * Updates the social media data in the database.=
     */
    @Override
    public boolean update(String facebook, String instagram, String twitter, String pinterest, String youtube, String linkedin) {
        String sql = "UPDATE social_media SET facebook=?, instagram=?, twitter=?, pinterest=?, youtube=?, linkedin=? WHERE id=1";
        return update(sql, facebook, instagram, twitter, pinterest, youtube, linkedin);
    }
}