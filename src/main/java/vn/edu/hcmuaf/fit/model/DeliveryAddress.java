package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;
import org.jdbi.v3.core.mapper.Nested;

import java.io.Serializable;

@Table(name = "delivery_address")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class DeliveryAddress extends AbsModel implements Serializable {
     Integer id;
     @Nested("user")
     User user;
     String fullName;
     String phone;
     String province;
     String district;
     String ward;
     String detailAddress;
     Boolean atHome;
     Boolean isPrimary;

     public DeliveryAddress(User user, String fullName, String phone, String province, String district,
                            String ward, String detailAddress, Boolean atHome, Boolean primary) {
         this.user = user;
         this.fullName = fullName;
         this.phone = phone;
         this.province = province;
         this.district = district;
         this.ward = ward;
         this.detailAddress = detailAddress;
         this.atHome = atHome;
         this.isPrimary = primary;
     }



    @Nested("user")
    public User getUser() {
        return user;
    }

    @Nested("user")
    public void setUser(User user) {
        this.user = user;
    }
}