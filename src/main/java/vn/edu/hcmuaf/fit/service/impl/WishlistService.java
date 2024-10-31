package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.WishlistDAO;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.model.WishlistItem;
import vn.edu.hcmuaf.fit.service.IWishlistService;

import java.util.List;

public class WishlistService implements IWishlistService {
    private static IWishlistService instance;

    public static IWishlistService getInstance() {
        if (instance == null) {
            instance = new WishlistService();
        }
        return instance;
    }

    @Override
    public List<WishlistItem> getWishlistByUser(User user) {
        try {
            return WishlistDAO.getInstance().getWishlistByUser(user.getId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public WishlistItem addWishList(User user, Product product) {
        try {
            return WishlistDAO.getInstance().addWishList(user.getId(), product.getId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public boolean deleteWishlist(User user, Product product) {
        try {
            return WishlistDAO.getInstance().deleteWishlist(user.getId(), product.getId());
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean deleteAllWishlist(User user) {
        try {
            return WishlistDAO.getInstance().deleteAllWishlist(user.getId());
        } catch (Exception e) {
            return false;
        }
    }
}