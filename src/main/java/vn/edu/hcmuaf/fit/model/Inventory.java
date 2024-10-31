package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;
import java.sql.Timestamp;

@Table(name = "inventory")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Inventory extends AbsModel implements Serializable {
     @Nested("user")
     User user;
     @Nested("discount")
     Discount discount;
     Timestamp addDate;
     Boolean isUsed;

    @Nested("user")
    public User getUser() {
        return user;
    }

    @Nested("user")
    public void setUser(User user) {
        this.user = user;
    }

    @Nested("discount")
    public Discount getDiscount() {
        return discount;
    }

    @Nested("discount")
    public void setDiscount(Discount discount) {
        this.discount = discount;
    }
}