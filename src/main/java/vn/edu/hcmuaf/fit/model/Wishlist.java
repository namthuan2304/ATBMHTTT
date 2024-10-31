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
public class Wishlist {
    List<WishlistItem> items;

    public void add(WishlistItem w) {
        for (WishlistItem i : items) {
            if (w.getProduct().getId().equals(i.getProduct().getId()) && w.getUser().getId().equals(i.getUser().getId())) {
                return;
            }
        }
        items.add(w);
    }

    public void remove(WishlistItem w) {
        for (WishlistItem i : items){
            if (w.getProduct().getId().equals(i.getProduct().getId()) && w.getUser().getId().equals(i.getUser().getId())) {
                items.remove(i);
                return;
            }
        }
    }
}