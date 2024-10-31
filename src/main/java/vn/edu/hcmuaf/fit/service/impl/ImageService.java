package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.ImageDAO;
import vn.edu.hcmuaf.fit.dao.impl.LevelDAO;
import vn.edu.hcmuaf.fit.dao.impl.LogDAO;
import vn.edu.hcmuaf.fit.model.Image;
import vn.edu.hcmuaf.fit.model.Level;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.IImageService;

import java.util.List;

public class ImageService extends LogDAO<Product> implements IImageService {
    private static IImageService instance;

    public static IImageService getInstance() {
        if (instance == null) {
            instance = new ImageService();
        }
        return instance;
    }

    @Override
    public List<Image> getImageById(Product p) {
        return ImageDAO.getInstance().getImageById(p.getId());
    }

    //    @Override
//    public List<Image> getImageById(Product p) {
//        try {
//            Level level;
//            List<Image> images = ImageDAO.getInstance().getImageById(p.getId());
//            if(!images.isEmpty()) {
//                p.setAfterData("Load successful with ID=" + p.getId());
//                level = LevelDAO.getInstance().getLevel(1).get(0);
//            } else {
//                p.setAfterData("Load failed with ID=" + p.getId());
//                level = LevelDAO.getInstance().getLevel(2).get(0);
//            }
//            super.insert(p, level, ip, address);
//            return images;
//        } catch (Exception e) {
//            return null;
//        }
//    }

    @Override
    public boolean addImage(Product p, List<Image> images, String ip, String address) {
        int count = 0;
        try {
            Level level;
            boolean re = false;
            for (Image image : images) {
                Image success = ImageDAO.getInstance().addImage(p.getId(), image.getImageUrl());
                if(success!= null) {
                    count++;
                }
            }
            if(count==images.size()) {
                re = true;
                level = LevelDAO.getInstance().getLevel(1).get(0);
                p.setAfterData("Add image successfully with ID=" + p.getId());
            } else {
                level = LevelDAO.getInstance().getLevel(2).get(0);
                p.setAfterData("Add image failed with ID=" + p.getId());
            }
            super.insert(p, level, ip, address);
            return re;
        } catch (Exception e) {
            return true;
        }
    }

    @Override
    public boolean removeImage(Product p, String ip, String address) {
        try {
            Level level;
            List<Image> images = ImageDAO.getInstance().getImageById(p.getId());
            p.setBeforeData("List image of ID=" + p.getId() + " is " + images + " before delete");
            boolean success = ImageDAO.getInstance().removeImage(p.getId());
            if(success) {
                level = LevelDAO.getInstance().getLevel(1).get(0);
                p.setAfterData("All images of ID=" + p.getId() + " are deleted!");
            } else {
                level = LevelDAO.getInstance().getLevel(2).get(0);
                p.setAfterData("All images of ID=" + p.getId() + " aren't deleted!");
            }
            super.insert(p, level, ip, address);
            return success;
        } catch (Exception e) {
            List<Image> images = ImageDAO.getInstance().getImageById(p.getId());
            p.setAfterData(e.getMessage() + " with ID=" + p.getId());
            super.insert(p, LevelDAO.getInstance().getLevel(2).get(0), ip, address);
            if(images.isEmpty()) return true;
            else return false;
        }
    }
}