package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.CartItem;

import java.util.List;

public interface ICartDAO extends GenericDAO<CartItem> {

    List<CartItem> getCartByUser(Integer userId);

    List<CartItem> getItem(Integer userId, Integer proId);

    boolean addIntoCart(Integer userId, Integer proId, Integer quantity);

    boolean updateItem(Integer userId, Integer proId, Integer quantity);

    boolean deleteItem(Integer userId, Integer proId);

    boolean removeCart(Integer userId);

    Integer getTotalPrice(Integer userId);
}