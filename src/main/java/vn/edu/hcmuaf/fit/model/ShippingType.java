package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Table(name = "shipping_type")
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ShippingType implements Serializable {
     Integer id;
     String type;
     String description;
     @Nested("info")
     ShippingInfo info;

    @Nested("info")
    public ShippingInfo getInfo() {
        return info;
    }

    @Nested("info")
    public void setInfo(ShippingInfo info) {
        this.info = info;
    }
}