package vn.edu.hcmuaf.fit.model;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ShoppingCart {
    List<CartItem> items;

    public void add(CartItem cartItem) {
        for (CartItem i : items) {
            if (cartItem.getProduct().getId().equals(i.getProduct().getId()) && cartItem.getUser().getId().equals(i.getUser().getId())) {
                int quantity = i.getQuantity() + cartItem.getQuantity();
//                CartService.getInstance().updateItem(cartItem.getUser(), cartItem.getProduct(), quantity);
                i.setQuantity(quantity);
                return;
            }
        }
        items.add(cartItem);
//        CartService.getInstance().addIntoCart(cartItem.getUser(), cartItem.getProduct(), cartItem.getQuantity());
    }

    public void update(CartItem cartItem) {
        for (CartItem i : items) {
            if (cartItem.getProduct().getId().equals(i.getProduct().getId()) && cartItem.getUser().getId().equals(i.getUser().getId())) {
//                CartService.getInstance().updateItem(cartItem.getUser(), cartItem.getProduct(), cartItem.getQuantity());
                i.setQuantity(cartItem.getQuantity());
                return;
            }
        }
        items.add(cartItem);
//        CartService.getInstance().addIntoCart(cartItem.getUser(), cartItem.getProduct(), cartItem.getQuantity());
    }

    public void remove(User user, Product product) {
        for (CartItem i : items){
            if (product.getId().equals(i.getProduct().getId()) && user.getId().equals(i.getUser().getId())) {
                items.remove(i);
//                CartService.getInstance().removeItem(user, product);
                return;
            }
        }
    }
}