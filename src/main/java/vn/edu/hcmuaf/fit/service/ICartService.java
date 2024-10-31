package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.CartItem;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.User;

import java.util.List;

public interface ICartService {

    boolean addIntoCart(User user, Product product, Integer quantity);

    boolean updateItem(User user, Product product, Integer quantity);

    boolean removeItem(User user, Product product);

    List<CartItem> getCartByUser(User user);

    CartItem getItem(User user, Product product);

    boolean removeCart(User user);

    Integer getTotalPrice(User user);
}
