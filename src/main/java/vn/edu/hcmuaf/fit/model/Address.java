package vn.edu.hcmuaf.fit.model;

import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

@Table(name = "address")
@EqualsAndHashCode(callSuper = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Address extends AbsModel implements Serializable {
    Integer id;
    String address;
    String phone;
    String hotline;
    String email;
    String timeOpen;
    String map;
     Integer isMain;

}