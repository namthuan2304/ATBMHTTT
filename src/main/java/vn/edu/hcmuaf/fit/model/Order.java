package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Timestamp;

@Table(name = "orders")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Order extends AbsModel implements Serializable {
     Integer id;
     @Nested("user")
     User user;
     @Nested("address")
     DeliveryAddress address;
     @Nested("type")
     ShippingType type;
     @Nested("discount")
     Discount discount;
     @Nested("payment")
     Payment payment;
     Timestamp dateCreated;
     Timestamp datePayment;
     String note;
     @Nested("status")
     OrderStatus status;
     @Nested("admin")
     User admin;

    @Nested("user")
    public User getUser() {
        return user;
    }

    @Nested("user")
    public void setUser(User user) {
        this.user = user;
    }

    @Nested("address")
    public DeliveryAddress getAddress() {
        return address;
    }

    @Nested("address")
    public void setAddress(DeliveryAddress address) {
        this.address = address;
    }

    @Nested("type")
    public ShippingType getType() {
        return type;
    }

    @Nested("type")
    public void setType(ShippingType type) {
        this.type = type;
    }

    @Nested("discount")
    public Discount getDiscount() {
        return discount;
    }

    @Nested("discount")
    public void setDiscount(Discount discount) {
        this.discount = discount;
    }

    @Nested("payment")
    public Payment getPayment() {
        return payment;
    }

    @Nested("payment")
    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    @Nested("status")
    public OrderStatus getStatus() {
        return status;
    }

    @Nested("status")
    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    @Nested("admin")
    public User getAdmin() {
        return admin;
    }

    @Nested("admin")
    public void setAdmin(User admin) {
        this.admin = admin;
    }
}