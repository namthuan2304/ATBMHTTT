package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Wishlist;
import vn.edu.hcmuaf.fit.model.WishlistItem;

import java.util.List;

public interface IWishlistDAO extends GenericDAO<Wishlist> {

    List<WishlistItem> getWishlistByUser(Integer userId);

    WishlistItem addWishList(Integer userId, Integer productId);

    boolean deleteWishlist(Integer userId, Integer productId);

    boolean deleteAllWishlist(Integer userId);

}
