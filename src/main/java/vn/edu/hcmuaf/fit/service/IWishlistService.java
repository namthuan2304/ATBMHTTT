package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.model.WishlistItem;

import java.util.List;

public interface IWishlistService {

    List<WishlistItem> getWishlistByUser(User user);

    WishlistItem addWishList(User user, Product product);

    boolean deleteWishlist(User user, Product product);

    boolean deleteAllWishlist(User user);

}