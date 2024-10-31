package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.ICartDAO;
import vn.edu.hcmuaf.fit.model.CartItem;

import java.util.List;

public class CartDAO extends AbsDAO<CartItem> implements ICartDAO {
    private static ICartDAO instance;

    public static ICartDAO getInstance() {
        if (instance == null) {
            instance = new CartDAO();
        }
        return instance;
    }

    @Override
    public List<CartItem> getCartByUser(Integer userId) {
        String sql = "SELECT * FROM cart_items WHERE user_id = ?";
        return query(sql, CartItem.class, userId);
    }

    @Override
    public List<CartItem> getItem(Integer userId, Integer proId) {
        String sql = "SELECT * FROM cart_items WHERE user_id = ? AND product_id = ?";
        return query(sql, CartItem.class, userId, proId);
    }

    @Override
    public boolean addIntoCart(Integer userId, Integer proId, Integer quantity) {
        String sql = "INSERT INTO cart_items (user_id, product_id, quantity) VALUES (?, ?, ?)";
        return update(sql, userId, proId, quantity);
    }

    @Override
    public boolean updateItem(Integer userId, Integer proId, Integer quantity) {
        String sql = "UPDATE cart_items SET quantity = ? WHERE user_id = ? AND product_id = ?";
        return update(sql, quantity, userId, proId);
    }

    @Override
    public boolean deleteItem(Integer userId, Integer proId) {
        String sql = "DELETE FROM cart_items WHERE user_id = ? AND product_id = ?";
        return update(sql, userId, proId);
    }

    @Override
    public boolean removeCart(Integer userId) {
        String sql = "DELETE FROM cart_items WHERE user_id = ?";
        return update(sql, userId);
    }

    @Override
    public Integer getTotalPrice(Integer userId) {
        String sql = "SELECT SUM(p.price * c.quantity) FROM cart_items c JOIN products p ON c.product_id = p.id WHERE c.user_id = ?";
        return count(sql, userId);
    }
}