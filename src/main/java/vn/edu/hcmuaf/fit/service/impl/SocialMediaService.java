package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.SocialMediaDAO;
import vn.edu.hcmuaf.fit.model.SocialMedia;
import vn.edu.hcmuaf.fit.service.ISocialMediaService;

public class SocialMediaService implements ISocialMediaService {
    private static ISocialMediaService instance;

    public static ISocialMediaService getInstance() {
        if (instance == null) {
            instance = new SocialMediaService();
        }
        return instance;
    }

    @Override
    public SocialMedia load() {
        return SocialMediaDAO.getInstance().load().get(0);
    }

    @Override
    public boolean update(String facebook, String instagram, String twitter, String pinterest, String youtube, String linkedin) {
        return SocialMediaDAO.getInstance().update(facebook, instagram, twitter, pinterest, youtube, linkedin);
    }
}