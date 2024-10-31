package vn.edu.hcmuaf.fit.service.impl;

import vn.edu.hcmuaf.fit.dao.impl.CartDAO;
import vn.edu.hcmuaf.fit.model.CartItem;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.service.ICartService;

import java.util.List;

public class CartService implements ICartService {
    private static ICartService instance;

    public static ICartService getInstance() {
        if (instance == null) {
            instance = new CartService();
        }
        return instance;
    }

    @Override
    public boolean addIntoCart(User user, Product product, Integer quantity) {
        try {
            return CartDAO.getInstance().addIntoCart(user.getId(), product.getId(), quantity);
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean updateItem(User user, Product product, Integer quantity) {
        try {
            return CartDAO.getInstance().updateItem(user.getId(), product.getId(), quantity);
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean removeItem(User user, Product product) {
        try {
            return CartDAO.getInstance().deleteItem(user.getId(), product.getId());
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public List<CartItem> getCartByUser(User user) {
        try {
            return CartDAO.getInstance().getCartByUser(user.getId());
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public CartItem getItem(User user, Product product) {
        try {
            return CartDAO.getInstance().getItem(user.getId(), product.getId()).get(0);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public boolean removeCart(User user) {
        try {
            return CartDAO.getInstance().removeCart(user.getId());
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public Integer getTotalPrice(User user) {
        try {
            return CartDAO.getInstance().getTotalPrice(user.getId());
        } catch (Exception e) {
            return null;
        }
    }
}