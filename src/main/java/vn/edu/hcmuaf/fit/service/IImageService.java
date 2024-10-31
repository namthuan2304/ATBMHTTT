package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Image;
import vn.edu.hcmuaf.fit.model.Product;

import java.util.List;

public interface IImageService {

    List<Image> getImageById(Product p);

    boolean addImage(Product p, List<Image> images, String ip, String address);

    boolean removeImage(Product p, String ip, String address);
}