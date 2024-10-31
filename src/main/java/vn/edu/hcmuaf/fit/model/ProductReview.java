package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Timestamp;

@Table(name = "product_review")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProductReview extends AbsModel implements Serializable {
     Integer id;
     @Nested("user")
     User user;
     int rating;
     @Nested("order")
     Order order;
     String reviewText;
     Timestamp reviewDate;
     String imageUrl;

    @Nested("user")
    public User getUsersByUsername() {
        return user;
    }

    @Nested("user")
    public void setUser(User user) {
        this.user = user;
    }

    @Nested("order")
    public Order getOrder() {
        return order;
    }

    @Nested("order")
    public void setOrder(Order order) {
        this.order = order;
    }
}