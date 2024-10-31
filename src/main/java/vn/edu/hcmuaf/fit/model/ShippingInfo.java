package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

@Table(name = "shipping_info")
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ShippingInfo implements Serializable {
     Integer id;
     String shippingName;
     String phone;
     Integer pricePerKg;
     Integer pricePerSize;
     Integer pricePerKm;

}