package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Table(name = "order_items")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class OrderItem extends AbsModel implements Serializable {
     @Nested("order")
     Order order;
     @Nested("product")
     Product product;
     Integer quantity;
     Integer orderPrice;

    @Nested("order")
    public Order getOrder() {
        return order;
    }

    @Nested("order")
    public void setOrder(Order order) {
        this.order = order;
    }

    @Nested("product")
    public Product getProduct() {
        return product;
    }

    @Nested("product")
    public void setProduct(Product product) {
        this.product = product;
    }
}