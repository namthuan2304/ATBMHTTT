package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Image;

import java.util.List;

public interface IImageDAO extends GenericDAO<Image> {

    List<Image> getImageById(Integer proId);

    Image addImage(Integer proId, String imgUrl);

    boolean removeImage(Integer proId);
}